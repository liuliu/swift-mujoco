import ChangeCases
import Foundation

public struct Enum {
  public var name: String
  public var keyValues: [(key: String, value: String?)]
  public init(name: String, keyValues: [(key: String, value: String?)]) {
    self.name = name
    self.keyValues = keyValues
  }
}

public func enumDecl(_ thisEnum: Enum) -> String {
  precondition(thisEnum.name.hasPrefix("mjt"))
  let swiftName_ =
    "Mjt" + thisEnum.name.suffix(from: thisEnum.name.index(thisEnum.name.startIndex, offsetBy: 3))
  let swiftName = swiftName_.prefix(upTo: swiftName_.index(swiftName_.endIndex, offsetBy: -1))
  var code = "public enum \(swiftName): Int32 {\n"
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
