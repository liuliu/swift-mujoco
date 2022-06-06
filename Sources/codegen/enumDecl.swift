import ChangeCases
import Foundation

public struct Enum {
  public var name: String
  public var comment: String?
  public var keyValues: [(key: String, value: String?)]
  public var iterable: Bool = false
  public init(name: String, comment: String?, keyValues: [(key: String, value: String?)]) {
    self.name = name
    self.comment = comment
    self.keyValues = keyValues
  }
}

public func enumDecl(_ thisEnum: Enum) -> String {
  precondition(thisEnum.name.hasPrefix("mjt"))
  let swiftName_ =
    "Mjt" + thisEnum.name.suffix(from: thisEnum.name.index(thisEnum.name.startIndex, offsetBy: 3))
  let swiftName = swiftName_.prefix(upTo: swiftName_.index(swiftName_.endIndex, offsetBy: -1))
  var code = ""
  if let comment = thisEnum.comment {
    code += "/// \(comment)\n"
  }
  code += "public enum \(swiftName): Int32\(thisEnum.iterable ? ", CaseIterable" : "") {\n"
  for (key, value) in thisEnum.keyValues {
    var swiftKey = key.split(separator: "_", maxSplits: 1)[1].lowercased().camelCase()
    // If it starts with integer, prefix _.
    if !swiftKey.prefix(while: \.isNumber).isEmpty {
      swiftKey = "_" + swiftKey
    }
    // If it is keyword, warp with ``.
    if ["static", "enum", "dynamic", "func"].contains(swiftKey) {
      swiftKey = "`\(swiftKey)`"
    }
    if var value = value {
      if value.contains("<<") {  // Evaluate this, Swift is not happy with anything other than literal.
        let parts = value.components(separatedBy: "<<")
        value = String(Int(parts[0])! << Int(parts[1])!)
      }
      code += "  case \(swiftKey) = \(value)\n"
    } else {
      code += "  case \(swiftKey)\n"
    }
  }
  code += "}\n"
  return code
}

public func optionSet(_ thisEnum: Enum) -> String {
  precondition(thisEnum.name.hasPrefix("mjt"))
  let swiftName_ =
    "Mjt" + thisEnum.name.suffix(from: thisEnum.name.index(thisEnum.name.startIndex, offsetBy: 3))
  let swiftName = swiftName_.prefix(upTo: swiftName_.index(swiftName_.endIndex, offsetBy: -1))
  var code = ""
  if let comment = thisEnum.comment {
    code += "/// \(comment)\n"
  }
  code += "public struct \(swiftName): OptionSet\(thisEnum.iterable ? ", CaseIterable" : "") {\n"
  code += "  public let rawValue: Int32\n"
  code += "  public init(rawValue: Int32) {\n"
  code += "    self.rawValue = rawValue\n"
  code += "  }\n"
  var keys: [String] = []
  for (key, value) in thisEnum.keyValues {
    var swiftKey = key.split(separator: "_", maxSplits: 1)[1].lowercased().camelCase()
    // If it starts with integer, prefix _.
    if !swiftKey.prefix(while: \.isNumber).isEmpty {
      swiftKey = "_" + swiftKey
    }
    // If it is keyword, warp with ``.
    if ["static", "enum", "dynamic", "func"].contains(swiftKey) {
      swiftKey = "`\(swiftKey)`"
    }
    guard let value = value else { fatalError() }
    keys.append(swiftKey)
    code += "  public static let \(swiftKey) = \(swiftName)(rawValue: \(value))\n"
  }
  if thisEnum.iterable {
    code +=
      "  public static let allCases: [\(swiftName)] = [\(keys.map({ ".\($0)" }).joined(separator: ", "))]\n"
  }
  code += "}\n"
  return code
}
