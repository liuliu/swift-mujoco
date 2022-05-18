import ChangeCases
import Foundation

struct Enum {
  var name: String
  var keyValues: [(key: String, value: String?)]
}

var enums = [Enum]()

for filePath in CommandLine.arguments[1...] {
  let fileContent = try! String(contentsOf: URL(fileURLWithPath: filePath), encoding: .utf8)
  let lines = fileContent.split(whereSeparator: \.isNewline)

  var thisEnum: Enum? = nil

  for line in lines {
    if let range = line.range(of: #"\s*typedef\s+enum\s+(\w)+\s+\{"#, options: .regularExpression) {
      let matched = line[range].split(whereSeparator: \.isWhitespace)
      thisEnum = Enum(name: String(matched[2]), keyValues: [])
    } else if let currentEnum = thisEnum {
      if line.range(of: #"\s*\}"#, options: .regularExpression) != nil {
        enums.append(currentEnum)
        thisEnum = nil
      } else {
        let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.hasPrefix("mjN") && !trimmed.hasPrefix("/") else { continue }
        let kv = trimmed.prefix(while: { $0 != "," }).split(separator: "=")
        var value: String? = nil
        if kv.count > 1 {
          value = kv[1].prefix(while: { $0 != "/" }).trimmingCharacters(in: .whitespaces)
        }
        thisEnum?.keyValues.append((key: kv[0].trimmingCharacters(in: .whitespaces), value: value))
      }
    }
  }
}

func enumDecl(_ thisEnum: Enum) -> String {
  precondition(thisEnum.name.hasPrefix("mjt"))
  let swiftName =
    "Mj" + thisEnum.name.suffix(from: thisEnum.name.index(thisEnum.name.startIndex, offsetBy: 3))
  var code =
    "public enum \(swiftName.prefix(upTo: swiftName.index(swiftName.endIndex, offsetBy: -1))): Int32 {\n"
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

for thisEnum in enums {
  print(enumDecl(thisEnum))
}
