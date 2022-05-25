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

func swiftParameterType(name: String, type: String) -> SwiftFieldType {
  if type == "const char *" || type == "const char*" { return .staticString(0) }
  let matched = type.split(separator: " ", maxSplits: 1)
  let nakedType = String(matched.last!)
  var mainType = nakedType
  if mainType.last == "*" {
    mainType = String(mainType.dropLast().trimmingCharacters(in: .whitespaces))
  }
  mainType = (SwiftType[mainType] ?? mainType).firstUppercased()
  return .plain(mainType)
}

public func functionExtension(
  _ apiDefinition: APIDefinition, deny: [String] = [], nameMapping: [String: [String]] = [:]
) -> String {
  // First, identify primary owner of the function.
  // Rule:
  // 1. Only look at first or last parameter (excluding mjt* or ordinary C types) as the primary owner, if cannot find any, fatal.
  // 2. Identify parameter corresponding to the function signature, if the function starts with mjv_
  //    find the parameter has type mjv*.
  guard apiDefinition.parameters.count > 0 else { return "" }
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
  guard var mainType = mainType, let mainInd = mainInd else { return "" }
  // Handle cases where mainType is not a mj*
  guard mainType.hasPrefix("mj") && !mainType.hasPrefix("mjt") else { return "\(apiDefinition)" }
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
  for i in 0..<apiDefinition.parameters.count {
    guard i != mainInd, let namedParameter = positionedNamedParameters[i] else { continue }
    if lowercasedName.contains(namedParameter.name.lowercased()) {
      parameterSuffix += namedParameter.name.lowercased()
    }
  }
  if lowercasedName.hasSuffix(parameterSuffix) {
    funcName = funcName.prefix(
      upTo: funcName.index(
        funcName.startIndex, offsetBy: lowercasedName.count - parameterSuffix.count))
  }
  var code = "extension \(mainType) {\n"
  var parameterPairs = [String]()
  for i in 0..<apiDefinition.parameters.count {
    guard i != mainInd, let namedParameter = positionedNamedParameters[i] else { continue }
    parameterPairs.append(
      "\(cleanupFieldName(name: namedParameter.name)): \(swiftParameterType(name: namedParameter.name, type: namedParameter.type))"
    )
  }
  code += "  @inlinable\n"
  code += "  public func \(funcName)(\(parameterPairs.joined(separator: ", "))) {\n"
  code += "    \(apiDefinition)\n"
  code += "  }\n"
  code += "}\n"
  return code
}
