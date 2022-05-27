import ChangeCases
import Foundation

public struct APIDefinition {
  public var name: String
  public var returnType: String
  public var parameters: [(name: String, type: String)]
  public init(name: String, returnType: String, parameters: [(name: String, type: String)]) {
    self.name = name
    self.returnType = returnType
    self.parameters = parameters
  }
}

// We have 3 ways to handle Mj* types. These are either value like MjvCamera, itself is a final
// class / struct, and contains the struct of mjvCamera. Or ref, like MjModel, itself is a final
// class / struct, and contains the UnsafeMutablePointer to mjModel. The other is the alias like
// MjrRect, it is the same as mjrRect.
enum MjType {
  case value
  case ref
  case alias
}

let MjTypes: [String: MjType] = [
  "MjContact": .value,
  "MjData": .ref,
  "MjLROpt": .value,
  "MjModel": .ref,
  "MjOption": .value,
  "MjrContext": .ref,
  "MjrRect": .alias,
  "MjSolverStat": .alias,
  "MjStatistic": .alias,
  "MjTimerStat": .alias,
  "MjuiDef": .value,
  "MjuiItemEdit": .ref,
  "MjuiItemMulti": .ref,
  "MjuiItemSingle": .ref,
  "MjuiItemSlider": .ref,
  "MjuiItem": .ref,
  "MjuiSection": .ref,
  "MjuiState": .value,
  "MjUI": .ref,
  "MjuiThemeColor": .value,
  "MjuiThemeSpacing": .value,
  "MjvCamera": .value,
  "MjvFigure": .ref,
  "MjVFS": .ref,
  "MjvGeom": .value,
  "MjvGLCamera": .value,
  "MjVisual": .value,
  "MjvLight": .alias,
  "MjvOption": .value,
  "MjvPerturb": .value,
  "MjvScene": .ref,
  "MjWarningStat": .alias,
]

enum SwiftParameterType {
  case plain(String, Bool, Bool)  // name, isPointer, isConst
  case string
  case tuple(String, Bool, Int)  // name, isConst, Repeat
  case array(String, Bool)  // name, isConst

  var isPointer: Bool {
    switch self {
    case .plain(_, let isPointer, _):
      return isPointer
    case .array, .tuple, .string:
      return true
    }
  }

  var isConst: Bool {
    switch self {
    case .plain(_, _, let isConst), .array(_, let isConst), .tuple(_, let isConst, _):
      return isConst
    case .string:
      return true
    }
  }

  var isInout: Bool {
    // Otherwise, if it is a pointer, it needs to be inout.
    if case let .plain(_, isPointer, _) = self {
      // If it is const pointer, we don't need this to be inout, just a local copy would be
      // sufficient.
      if isConst {
        return false
      }
      return isPointer
    }
    return false
  }

  var swiftType: String {
    switch self {
    case let .plain(name, _, _):
      return name
    case let .tuple(name, isPointer, _), let .array(name, isPointer):
      return isPointer ? "Mj\(name)MutableBufferPointer" : "Mj\(name)BufferPointer"
    case .string:
      return "String"
    }
  }
}

extension SwiftParameterType: CustomStringConvertible {
  var description: String {
    switch self {
    case let .plain(name, _, _):
      return name
    case let .tuple(name, _, count):
      return "(" + [String](repeating: name, count: count).joined(separator: ", ") + ")"
    case let .array(name, _):
      return "[" + name + "]"
    case .string:
      return "String"
    }
  }
}

func swiftParameterType(name: String, type: String) -> SwiftParameterType {
  if type == "const char *" || type == "const char*" { return .string }
  let matched = type.split(separator: " ", maxSplits: 1)
  let isConst = matched.count > 1 && matched[0] == "const"
  let nakedType = isConst ? String(matched.last!) : type
  var mainType = nakedType
  let isPointer = (mainType.last == "*")
  if isPointer {
    mainType = String(mainType.dropLast().trimmingCharacters(in: .whitespaces))
  }
  mainType = (SwiftType[mainType] ?? mainType).firstUppercased()
  if let range = name.range(of: #"\[\w+\]"#, options: .regularExpression) {
    let matched = name[range].dropFirst().dropLast()
    let count = Int(matched)!
    precondition(!isPointer)  // We cannot handle static array with pointer.
    return .tuple(mainType, isConst, count)
  }
  if mainType.hasPrefix("Mj") || !isPointer {
    return .plain(mainType, isPointer, isConst)
  } else {
    return .array(mainType, isConst)
  }
}

func varName(_ name: String) -> String {
  precondition(name.hasPrefix("Mj"))
  let internalProperty = name.dropFirst()
  let varName = internalProperty.suffix(from: internalProperty.firstIndex(where: \.isUppercase)!)
    .lowercased()
  return "_" + varName
}

public func functionExtension(
  _ apiDefinition: APIDefinition, deny: [String] = [], nameMapping: [String: [String]] = [:]
) -> (mainType: String?, sourceCode: String) {
  // First, identify primary owner of the function.
  // Rule:
  // 1. Only look at first or last parameter (excluding mjt* or ordinary C types) as the primary owner, if cannot find any, fatal.
  // 2. Identify parameter corresponding to the function signature, if the function starts with mjv_
  //    find the parameter has type mjv*.
  guard apiDefinition.parameters.count > 0 else { return (mainType: nil, sourceCode: "") }
  let prefix = apiDefinition.name.prefix(while: { $0 != "_" })
  var mainInd: Int? = nil
  var mainType: String? = nil
  for (i, last) in apiDefinition.parameters.enumerated().reversed() {
    guard !last.type.hasPrefix("mjt") else { continue }
    let matched = last.type.split(separator: " ", maxSplits: 1)
    let nakedType = String(matched.last!)
    guard nakedType.hasPrefix("mj") else { continue }
    guard !deny.contains(nakedType) else { continue }
    if nakedType.lowercased().hasPrefix(prefix) {
      mainType = nakedType
      mainInd = i
    }
    break
  }
  if let first = apiDefinition.parameters.first {
    let matched = first.type.split(separator: " ", maxSplits: 1)
    let nakedType = String(matched.last!)
    if !deny.contains(nakedType) {
      if nakedType.lowercased().hasPrefix(prefix) {
        mainType = nakedType
        mainInd = 0
      } else if mainType == nil {
        mainType = nakedType
        mainInd = 0
      }
    }
  }
  guard var mainType = mainType, let mainInd = mainInd else {
    return (mainType: nil, sourceCode: "")
  }
  // Handle cases where mainType is not a mj*
  guard mainType.hasPrefix("mj") && !mainType.hasPrefix("mjt") else {
    return (mainType: nil, sourceCode: "")
  }
  // Now we have main type, we can create functions for them.
  if mainType.last == "*" {
    mainType = String(mainType.dropLast().trimmingCharacters(in: .whitespaces))
  }
  mainType = mainType.firstUppercased()
  var positionedNamedParameters = [Int: (name: String, type: String)]()
  for (i, parameter) in apiDefinition.parameters.enumerated() {
    guard i != mainInd else { continue }
    // First, matching parameter name.
    let possibleNames = nameMapping[parameter.name]
    let name: String
    if let possibleNames = possibleNames {
      if possibleNames.count > 1 {
        var matched: String? = nil
        let lowercasedType = parameter.type.lowercased()
        for possibleName in possibleNames {
          if lowercasedType.contains(possibleName.lowercased()) {
            matched = possibleName
            break
          }
        }
        name = matched!
      } else {
        name = possibleNames.first!
      }
    } else {
      name = parameter.name
    }
    positionedNamedParameters[i] = (name: name, type: parameter.type)
  }
  // Remove the prefix from the name.
  var funcName = apiDefinition.name.suffix(
    from: apiDefinition.name.index(
      apiDefinition.name.firstIndex(where: { $0 == "_" })!, offsetBy: 1))
  let lowercasedName = funcName.lowercased()
  var parameterSuffix = ""
  var suffixIndexes = Set<Int>()
  for i in 0..<apiDefinition.parameters.count {
    guard i != mainInd, let namedParameter = positionedNamedParameters[i] else { continue }
    if lowercasedName.contains(namedParameter.name.lowercased()) {
      parameterSuffix += namedParameter.name.lowercased()
      suffixIndexes.insert(i)
    } else {
      break
    }
  }
  var anonymousIndexes = Set<Int>()
  if lowercasedName.hasSuffix(parameterSuffix) {
    // We have a problem, we cannot have function that has no name. In this case, make function name
    // whatever it is, and make the parameters not named.
    if lowercasedName.hasPrefix(parameterSuffix) {
      // Now these matching suffix indexes should be anonymous.
      anonymousIndexes = suffixIndexes
    } else {
      // Other, remove these suffixes.
      funcName = funcName.prefix(
        upTo: funcName.index(
          funcName.startIndex, offsetBy: lowercasedName.count - parameterSuffix.count))
    }
  }
  var parameterPairs = [String]()
  var parameterParsedTypes = [Int: SwiftParameterType]()
  for i in 0..<apiDefinition.parameters.count {
    guard i != mainInd, let namedParameter = positionedNamedParameters[i] else { continue }
    let parsedType = swiftParameterType(name: namedParameter.name, type: namedParameter.type)
    parameterParsedTypes[i] = parsedType
    if anonymousIndexes.contains(i) {
      parameterPairs.append(
        "_ \(cleanupFieldName(name: namedParameter.name).camelCase()): \(parsedType.isInout ? "inout ": "")\(parsedType.swiftType)"
      )
    } else {
      parameterPairs.append(
        "\(cleanupFieldName(name: namedParameter.name).camelCase()): \(parsedType.isInout ? "inout ": "")\(parsedType.swiftType)"
      )
    }
  }
  let mainParsedType = swiftParameterType(
    name: apiDefinition.parameters[mainInd].name, type: apiDefinition.parameters[mainInd].type)
  var code = "  @inlinable\n"
  let mutatingPrefix: String
  if let mjType = MjTypes[mainParsedType.swiftType], mainParsedType.isInout {
    mutatingPrefix = mjType == .value || mjType == .alias ? " mutating" : ""
  } else {
    mutatingPrefix = ""
  }
  code +=
    "  public\(mutatingPrefix) func \(funcName)(\(parameterPairs.joined(separator: ", "))) {\n"
  var localCopyPairs = [String]()
  var callingPairs = [String]()
  for (i, _) in apiDefinition.parameters.enumerated() {
    guard i != mainInd, let namedParameter = positionedNamedParameters[i] else {
      switch MjTypes[mainType]! {
      case .value:
        if mainParsedType.isPointer {
          if mainParsedType.isConst {
            localCopyPairs.append(
              "var _\(varName(mainParsedType.swiftType)) = self.\(varName(mainParsedType.swiftType))"
            )
            callingPairs.append("&_\(varName(mainType))")
          } else {
            callingPairs.append("&self.\(varName(mainType))")
          }
        } else {
          callingPairs.append("self.\(varName(mainType))")
        }
      case .ref:
        precondition(mainParsedType.isPointer)
        callingPairs.append("self.\(varName(mainType))")
      case .alias:
        if mainParsedType.isPointer {
          callingPairs.append("self")
        } else {
          callingPairs.append("&self")
        }
      }
      continue
    }
    let parsedType = parameterParsedTypes[i]!
    let paramName = cleanupFieldName(name: namedParameter.name).camelCase()
    if case let .plain(typeName, isPointer, isConst) = parsedType, typeName.hasPrefix("Mj") {
      switch MjTypes[parsedType.swiftType]! {
      case .value:
        if isPointer {
          if isConst {  // This is const pointer, we need to make a local copy and then pass the pointer.
            localCopyPairs.append(
              "var \(paramName)_\(varName(parsedType.swiftType)) = \(paramName).\(varName(parsedType.swiftType))"
            )
            callingPairs.append("&\(paramName)_\(varName(parsedType.swiftType))")
          } else {
            callingPairs.append("&\(paramName).\(varName(parsedType.swiftType))")
          }
        } else {
          callingPairs.append("\(paramName).\(varName(parsedType.swiftType))")
        }
      case .ref:
        precondition(isPointer)
        callingPairs.append("\(paramName).\(varName(parsedType.swiftType))")
      case .alias:
        if isPointer {
          callingPairs.append("&\(paramName)")
        } else {
          callingPairs.append(paramName)
        }

      }
    } else {
      callingPairs.append(paramName)
    }
  }
  code += localCopyPairs.map({ "    \($0)\n" }).joined()
  code += "    \(apiDefinition.name)(\(callingPairs.joined(separator: ", ")))\n"
  code += "  }\n"
  return (mainType: mainType, sourceCode: code)
}
