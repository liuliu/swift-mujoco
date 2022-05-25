import ChangeCases
import Foundation

public func parseMuJoCoHeaders(from filePaths: [String]) -> (
  enums: [Enum], structs: [Struct], definedConstants: [String: Int], apiDefinitions: [APIDefinition]
) {
  var enums = [Enum]()
  var structs = [Struct]()
  var definedConstants = [String: Int]()
  var apiDefinitions = [APIDefinition]()
  for filePath in filePaths {
    let fileContent = try! String(contentsOf: URL(fileURLWithPath: filePath), encoding: .utf8)
    let lines = fileContent.split(whereSeparator: \.isNewline)

    var thisEnum: Enum? = nil
    var thisStruct: Struct? = nil
    var thisAnonymousStruct: AnonymousStruct? = nil
    var thisAnonymousUnion: AnonymousUnion? = nil
    var thisAPIDefinition: APIDefinition? = nil

    for line in lines {
      // The start of a enum.
      if let range = line.range(of: #"\s*#define\s+\w+\s+\d+"#, options: .regularExpression) {
        let matched = line[range].split(whereSeparator: \.isWhitespace)
        definedConstants[String(matched[1])] = Int(matched[2])!
      } else if line.hasPrefix("MJAPI ") {  // This is API definition.
        let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
        let matched = trimmed.split(maxSplits: 2, whereSeparator: \.isWhitespace)
        guard
          matched.count == 3 && matched[2].hasPrefix("mj")
            && matched[2].range(of: #"[\w\_]+\("#, options: .regularExpression) != nil
        else { continue }
        let nameSeparator = matched[2].firstIndex(where: { $0 == "(" })!
        let apiName = matched[2].prefix(upTo: nameSeparator)
        var apiDefinition = APIDefinition(
          name: String(apiName), returnType: String(matched[1]), parameters: [])
        // Find parameters up until the closing.
        let restParameters = matched[2].suffix(from: matched[2].index(nameSeparator, offsetBy: 1))
          .prefix(while: { $0 != ")" })
        let separatedParameters = restParameters.split(separator: ",")
        for parameter in separatedParameters {
          let trimmed = parameter.trimmingCharacters(in: .whitespaces)
          guard trimmed != "void" else { continue }
          let typeSeparator = trimmed.lastIndex(where: { $0 == " " || $0 == "*" })!
          let type = trimmed.prefix(upTo: typeSeparator).trimmingCharacters(in: .whitespaces)
          let name = trimmed.suffix(from: trimmed.index(typeSeparator, offsetBy: 1))
            .trimmingCharacters(in: .whitespaces)
          apiDefinition.parameters.append((name: String(name), type: String(type)))
        }
        if !trimmed.contains(");") {
          // We need to continue.
          thisAPIDefinition = apiDefinition
        } else {
          apiDefinitions.append(apiDefinition)
        }
      } else if var currentAPIDefinition = thisAPIDefinition {
        let restParameters = line.prefix(while: { $0 != ")" })
        let separatedParameters = restParameters.split(separator: ",")
        for parameter in separatedParameters {
          let trimmed = parameter.trimmingCharacters(in: .whitespaces)
          guard trimmed != "void" else { continue }
          let typeSeparator = trimmed.lastIndex(where: { $0 == " " || $0 == "*" })!
          let type = trimmed.prefix(upTo: typeSeparator).trimmingCharacters(in: .whitespaces)
          let name = trimmed.suffix(from: trimmed.index(typeSeparator, offsetBy: 1))
            .trimmingCharacters(in: .whitespaces)
          currentAPIDefinition.parameters.append((name: String(name), type: String(type)))
        }
        thisAPIDefinition = currentAPIDefinition
        if line.contains(");") {
          apiDefinitions.append(currentAPIDefinition)
          thisAPIDefinition = nil
        }
      } else if let range = line.range(
        of: #"\s*typedef\s+enum\s+(\w)+\s+\{"#, options: .regularExpression)
      {
        let matched = line[range].split(whereSeparator: \.isWhitespace)
        thisEnum = Enum(name: String(matched[2]), keyValues: [])
      } else if let currentEnum = thisEnum {
        if line.range(of: #"\s*\}"#, options: .regularExpression) != nil {
          // Close up a enum.
          enums.append(currentEnum)
          thisEnum = nil
        } else {
          // Poor-man's parser for enum.
          let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
          // Ignore comments.
          guard !trimmed.hasPrefix("/") else { continue }
          // These are counting number of enums. Used as array size in some places. Keep them.
          guard !trimmed.hasPrefix("mjN") else {
            let parts = trimmed.split(whereSeparator: \.isWhitespace)
            definedConstants[String(parts[0])] = currentEnum.keyValues.count
            continue
          }
          let kv = trimmed.prefix(while: { $0 != "," }).split(separator: "=")
          var value: String? = nil
          if kv.count > 1 {
            value = kv[1].prefix(while: { $0 != "/" }).trimmingCharacters(in: .whitespaces)
          }
          thisEnum?.keyValues.append(
            (key: kv[0].trimmingCharacters(in: .whitespaces), value: value))
        }
      } else if let range = line.range(of: #"\s*struct\s+(\w)+\s+\{"#, options: .regularExpression)
      {
        // The start of a struct.
        let matched = line[range].split(whereSeparator: \.isWhitespace)
        thisStruct = Struct(name: String(matched[1]), fields: [])
      } else if let currentStruct = thisStruct {
        // The end of a struct.
        if line.range(of: #"\s*\}"#, options: .regularExpression) != nil {
          if let currentAnonymousStruct = thisAnonymousStruct {
            // If at the end of anonymous struct, append this as field to struct.
            let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
            let fieldAndComment = trimmed.components(separatedBy: "//")
            let field = fieldAndComment[0].prefix(while: { $0 != ";" }).split(separator: " ")
            guard field.count > 0 else { continue }
            let comment: String? =
              fieldAndComment.count > 1
              ? fieldAndComment[1].trimmingCharacters(in: .whitespaces) : nil
            thisStruct?.fields.append(
              (name: String(field[1]), type: .product(currentAnonymousStruct), comment: comment))
            thisAnonymousStruct = nil
          } else if let currentAnonymousUnion = thisAnonymousUnion {
            thisStruct?.fields.append((name: nil, type: .sum(currentAnonymousUnion), comment: nil))
            thisAnonymousUnion = nil
          } else {
            structs.append(currentStruct)
            thisStruct = nil
          }
          // Check for nested struct (mjVisual_ has a few).
        } else if line.range(of: #"\s*struct\s+\{"#, options: .regularExpression) != nil {
          thisAnonymousStruct = AnonymousStruct(fields: [])
        } else if line.range(of: #"\s*union\s+\{"#, options: .regularExpression) != nil {
          thisAnonymousUnion = AnonymousUnion(fields: [])
        } else {
          let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
          let fieldAndComment = trimmed.components(separatedBy: "//")
          let field = fieldAndComment[0].prefix(while: { $0 != ";" }).split(separator: " ")
          guard field.count > 0 else { continue }
          let comment: String? =
            fieldAndComment.count > 1
            ? fieldAndComment[1].trimmingCharacters(in: .whitespaces) : nil
          // If it is anonymous struct, append this.
          let fieldName = String(field.last!)
          let fieldType = field.dropLast().joined(separator: " ")
          if thisAnonymousStruct != nil {
            thisAnonymousStruct?.fields.append(
              (name: fieldName, type: fieldType, comment: comment))
          } else if thisAnonymousUnion != nil {
            thisAnonymousUnion?.fields.append(
              (name: fieldName, type: fieldType, comment: comment))
          } else {
            // Otherwise append to struct.
            thisStruct?.fields.append(
              (name: fieldName, type: .plain(fieldType), comment: comment))
          }
        }
      }
    }
  }
  return (
    enums: enums, structs: structs, definedConstants: definedConstants,
    apiDefinitions: apiDefinitions
  )
}
