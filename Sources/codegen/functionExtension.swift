import ChangeCases
import Foundation

public struct APIDefinition {
  public var name: String
  public var returnType: String
  public var parameters: [(name: String, type: String)]
  public var comment: String?
  public init(
    name: String, returnType: String, parameters: [(name: String, type: String)], comment: String?
  ) {
    self.name = name
    self.returnType = returnType
    self.parameters = parameters
    self.comment = comment
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

public func mjObjectExtensions() -> String {
  let mjTypes = MjTypes.map({ $0 }).sorted { $0.key < $1.key }
  var code = "import C_mujoco\n\n"
  for (key, value) in mjTypes {
    code += "extension \(key): MjObject {\n"
    let cType = key.firstLowercased() + "_"
    code += "  public typealias CType = \(cType)\n"
    code +=
      "  public static func withCTypeUnsafeMutablePointer<R>(to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R) rethrows -> R {\n"
    let varName = varName(key)
    switch value {
    case .value:
      code += "  try withUnsafeMutablePointer(to: &value.\(varName), body)\n"
    case .alias:
      code += "  try withUnsafeMutablePointer(to: &value, body)\n"
    case .ref:
      code += "  try body(value.\(varName))\n"
    }
    code += "  }\n"
    code += "}\n"
  }
  return code
}

let MjTypeConversionSuffixPatch: [String: String] = [
  "MjuiItem": ", object: _storage"
]

enum SwiftParameterType {
  case plain(String, Bool, Bool)  // name, isPointer, isConst
  case string
  case tuple(String, Bool, Int)  // name, isConst, Repeat
  case array(String, Bool)  // name, isConst
  case `enum`(String)  // name

  var isPointer: Bool {
    switch self {
    case .plain(_, let isPointer, _):
      return isPointer
    case .array, .tuple, .string:
      return true
    case .enum:
      return false
    }
  }

  var isConst: Bool {
    switch self {
    case .plain(_, _, let isConst), .array(_, let isConst), .tuple(_, let isConst, _):
      return isConst
    case .string, .enum:
      return true
    }
  }

  var isInout: Bool {
    // Otherwise, if it is a pointer, it needs to be inout.
    switch self {
    case let .plain(_, isPointer, _):
      // If it is const pointer, we don't need this to be inout, just a local copy would be
      // sufficient.
      if isConst {
        return false
      }
      return isPointer
    case let .tuple(_, isConst, _), let .array(_, isConst):
      return !isConst
    case .string, .enum:
      return false
    }
  }

  var isArrayOrTuple: Bool {
    switch self {
    case .array, .tuple:
      return true
    case .plain, .string, .enum:
      return false
    }
  }

  var swiftType: String {
    switch self {
    case let .plain(name, _, _), let .enum(name):
      return name
    case let .tuple(name, isConst, _), let .array(name, isConst):
      return isConst ? "Mj\(name)BufferPointer" : "Mj\(name)MutableBufferPointer"
    case .string:
      return "String"
    }
  }
}

extension SwiftParameterType: CustomStringConvertible {
  var description: String {
    switch self {
    case let .plain(name, _, _), let .enum(name):
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

func swiftParameterType(name: String, type: String, comment: String?) -> SwiftParameterType {
  if type == "const char *" || type == "const char*" { return .string }
  let matched = type.split(separator: " ", maxSplits: 1)
  let isConst = matched.count > 1 && matched[0] == "const"
  let nakedType = isConst ? String(matched.last!) : type
  var mainType = nakedType
  let isPointer = (mainType.last == "*")
  var isEnum = false
  if isPointer {
    mainType = String(mainType.dropLast().trimmingCharacters(in: .whitespaces))
  } else if let comment = comment {
    // If it is not pointer, we need to explore the possibility this is an enum type.
    // In MuJoCo, all enum types are int, but they are annotated in comment as "x is mjtY"
    let parts = comment.split(separator: " ")
    for (i, part) in parts.enumerated() where i < parts.count - 2 {
      if part == name && parts[i + 1] == "is" && parts[i + 2].hasPrefix("mjt") {
        mainType =
          "Mjt"
          + String(
            parts[i + 2].suffix(from: parts[i + 2].index(parts[i + 2].startIndex, offsetBy: 3)))
        if mainType.hasSuffix(".") || mainType.hasSuffix(";") {
          mainType = String(mainType.dropLast())
        }
        isEnum = true
        break
      }
    }
  }
  mainType = (SwiftType[mainType] ?? mainType).firstUppercased()
  if let range = name.range(of: #"\[\w+\]"#, options: .regularExpression) {
    let matched = name[range].dropFirst().dropLast()
    let count = Int(matched)!
    precondition(!isPointer)  // We cannot handle static array with pointer.
    precondition(!isEnum)
    return .tuple(mainType, isConst, count)
  }
  if mainType.hasPrefix("Mj") || !isPointer {
    if isEnum {
      return .enum(mainType)
    } else {
      return .plain(mainType, isPointer, isConst)
    }
  } else {
    return .array(mainType, isConst)
  }
}
enum SwiftReturnType {
  case plain(String, Bool, Bool)  // name, isPointer, isConst
  case string
  case void

  var isMjType: Bool {
    if case .plain(let name, _, _) = self {
      return name.hasPrefix("Mj")
    }
    return false
  }

  func isBoolReturn(apiName: String) -> Bool {
    // This is pure C, bool is int, is Int32.
    guard case let .plain(name, _, _) = self, name == "Int32" else {
      return false
    }
    // If name contains _is, it is a boolean
    return apiName.contains("_is")
  }
}

extension SwiftReturnType: CustomStringConvertible {
  var description: String {
    switch self {
    case let .plain(name, _, _):
      return name
    case .string:
      return "String"
    case .void:
      return "Void"
    }
  }
}

func swiftReturnType(_ type: String) -> SwiftReturnType {
  if type == "void" { return .void }
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
  return .plain(mainType, isPointer, isConst)
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
      break
    }
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
  if var unwrappedMainType = mainType {
    if !(unwrappedMainType.hasPrefix("mj") && !unwrappedMainType.hasPrefix("mjt")) {
      mainType = nil
      mainInd = nil
    } else {
      // Now we have main type, we can create functions for them.
      if unwrappedMainType.last == "*" {
        unwrappedMainType = String(
          unwrappedMainType.dropLast().trimmingCharacters(in: .whitespaces))
      }
      mainType = unwrappedMainType.firstUppercased()
    }
  }
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
  var numberedGenerics = [String]()
  var parameterParsedTypes = [Int: SwiftParameterType]()
  for i in 0..<apiDefinition.parameters.count {
    guard i != mainInd, let namedParameter = positionedNamedParameters[i] else { continue }
    let parsedType = swiftParameterType(
      name: namedParameter.name, type: namedParameter.type, comment: apiDefinition.comment)
    parameterParsedTypes[i] = parsedType
    // For inout parameters, we need to make this as generics, otherwise the API requires you first cast to the protocol, which could be messed up.
    let swiftType: String
    if parsedType.isInout && parsedType.isArrayOrTuple {
      swiftType = "T\(numberedGenerics.count)"
      numberedGenerics.append(parsedType.swiftType)
    } else {
      swiftType = parsedType.swiftType
    }
    if anonymousIndexes.contains(i) {
      parameterPairs.append(
        "_ \(cleanupFieldName(name: namedParameter.name).camelCase()): \(parsedType.isInout ? "inout ": "")\(swiftType)"
      )
    } else {
      parameterPairs.append(
        "\(cleanupFieldName(name: namedParameter.name).camelCase()): \(parsedType.isInout ? "inout ": "")\(swiftType)"
      )
    }
  }
  let mainParsedType = mainInd.map {
    swiftParameterType(
      name: apiDefinition.parameters[$0].name, type: apiDefinition.parameters[$0].type,
      comment: apiDefinition.comment)
  }
  var code = ""
  if let comment = apiDefinition.comment {
    code += "  /// \(comment)\n"
  }
  code += "  @inlinable\n"
  let mutatingPrefix: String
  if let mainParsedType = mainParsedType, mainParsedType.isInout {
    mutatingPrefix = " mutating"
  } else {
    mutatingPrefix = ""
  }
  let parsedReturnType = swiftReturnType(apiDefinition.returnType)
  let isBoolReturn = parsedReturnType.isBoolReturn(apiName: apiDefinition.name)
  let hasReturnValue: Bool
  if case .void = parsedReturnType {
    hasReturnValue = false
  } else {
    hasReturnValue = true
  }
  let genericsList =
    numberedGenerics.count > 0
    ? "<\(numberedGenerics.enumerated().map({ "T\($0): \($1)" }).joined(separator: ", "))>" : ""
  switch parsedReturnType {
  case .string:
    code +=
      "  public\(mutatingPrefix) func \(funcName)\(genericsList)(\(parameterPairs.joined(separator: ", "))) -> String? {\n"
  case .void:
    code +=
      "  public\(mutatingPrefix) func \(funcName)\(genericsList)(\(parameterPairs.joined(separator: ", "))) {\n"
  case .plain(let name, _, _):
    code +=
      "  public\(mutatingPrefix) func \(funcName)\(genericsList)(\(parameterPairs.joined(separator: ", "))) -> \(isBoolReturn ? "Bool" : name) {\n"
  }
  var localCopyPairs = [String]()
  var callingPairs = [String]()
  var enclosings = 0
  for (i, _) in apiDefinition.parameters.enumerated() {
    guard i != mainInd, let namedParameter = positionedNamedParameters[i] else {
      let mainType = mainType!  // We can unwrapped because mainInd != nil.
      let mainParsedType = mainParsedType!  // Therefore, we can unwrap mainParsedType too.
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
              String(repeating: "  ", count: enclosings)
                + "var \(paramName)_\(varName(parsedType.swiftType)) = \(paramName).\(varName(parsedType.swiftType))"
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
    } else if case let .array(_, isConst) = parsedType {
      if isConst {
        localCopyPairs.append(
          String(repeating: "  ", count: enclosings) + (hasReturnValue ? "return " : "")
            + "\(paramName).withUnsafeBufferPointer { \(paramName)__p in")
      } else {
        localCopyPairs.append(
          String(repeating: "  ", count: enclosings) + (hasReturnValue ? "return " : "")
            + "\(paramName).withUnsafeMutableBufferPointer { \(paramName)__p in")
      }
      enclosings += 1
      callingPairs.append("\(paramName)__p.baseAddress")
    } else if case let .tuple(_, isConst, count) = parsedType {
      localCopyPairs.append(
        String(repeating: "  ", count: enclosings) + "precondition(\(paramName).count == \(count))")
      if isConst {
        localCopyPairs.append(
          String(repeating: "  ", count: enclosings) + (hasReturnValue ? "return " : "")
            + "\(paramName).withUnsafeBufferPointer { \(paramName)__p in")
      } else {
        localCopyPairs.append(
          String(repeating: "  ", count: enclosings) + (hasReturnValue ? "return " : "")
            + "\(paramName).withUnsafeMutableBufferPointer { \(paramName)__p in")
      }
      enclosings += 1
      callingPairs.append("\(paramName)__p.baseAddress")
    } else if case .enum(_) = parsedType {
      callingPairs.append("\(paramName).rawValue")
    } else {
      callingPairs.append("\(paramName)")
    }
  }
  code += localCopyPairs.map({ "    \($0)\n" }).joined()
  let extraPadding = String(repeating: "  ", count: enclosings)
  switch parsedReturnType {
  case .string:
    code +=
      "    \(extraPadding)return String(cString: \(apiDefinition.name)(\(callingPairs.joined(separator: ", "))), encoding: .utf8)\n"
  case .void:
    code += "    \(extraPadding)\(apiDefinition.name)(\(callingPairs.joined(separator: ", ")))\n"
  case .plain(let name, _, _):
    if isBoolReturn {
      code +=
        "    \(extraPadding)return (0 != \(apiDefinition.name)(\(callingPairs.joined(separator: ", "))))\n"
    } else {
      if parsedReturnType.isMjType && MjTypes[name] != .alias {
        code +=
          "    \(extraPadding)return \(name)(\(apiDefinition.name)(\(callingPairs.joined(separator: ", ")))\(MjTypeConversionSuffixPatch[name] ?? ""))\n"
      } else {
        code +=
          "    \(extraPadding)return \(apiDefinition.name)(\(callingPairs.joined(separator: ", ")))\n"
      }
    }
  }
  for i in (0..<enclosings).reversed() {
    code += "    \(String(repeating: "  ", count: i))}\n"
  }
  code += "  }\n"
  return (mainType: mainType, sourceCode: code)
}
