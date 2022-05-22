import ChangeCases
import Foundation

struct Enum {
  var name: String
  var keyValues: [(key: String, value: String?)]
}

struct AnonymousStruct {
  var fields: [(name: String, type: String, comment: String?)]
}

struct AnonymousUnion {
  var fields: [(name: String, type: String, comment: String?)]
}

enum FieldType {
  case plain(String)
  case product(AnonymousStruct)
  case sum(AnonymousUnion)
}

struct Struct {
  var name: String
  var fields: [(name: String?, type: FieldType, comment: String?)]
}

var enums = [Enum]()
var structs = [Struct]()
var definedConstants = [String: Int]()

var WorkDir = CommandLine.arguments[1]

for filePath in CommandLine.arguments[2...] {
  let fileContent = try! String(contentsOf: URL(fileURLWithPath: filePath), encoding: .utf8)
  let lines = fileContent.split(whereSeparator: \.isNewline)

  var thisEnum: Enum? = nil
  var thisStruct: Struct? = nil
  var thisAnonymousStruct: AnonymousStruct? = nil
  var thisAnonymousUnion: AnonymousUnion? = nil

  for line in lines {
    // The start of a enum.
    if let range = line.range(of: #"\s*#define\s+\w+\s+\d+"#, options: .regularExpression) {
      let matched = line[range].split(whereSeparator: \.isWhitespace)
      definedConstants[String(matched[1])] = Int(matched[2])!
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
        thisEnum?.keyValues.append((key: kv[0].trimmingCharacters(in: .whitespaces), value: value))
      }
    } else if let range = line.range(of: #"\s*struct\s+(\w)+\s+\{"#, options: .regularExpression) {
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
          fieldAndComment.count > 1 ? fieldAndComment[1].trimmingCharacters(in: .whitespaces) : nil
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

func enumDecl(_ thisEnum: Enum) -> String {
  precondition(thisEnum.name.hasPrefix("mjt"))
  let swiftName_ =
    "Mj" + thisEnum.name.suffix(from: thisEnum.name.index(thisEnum.name.startIndex, offsetBy: 3))
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

let SwiftType: [String: String] = [
  "int": "Int32",
  "unsigned int": "UInt32",
  "bool": "Bool",
  "mjtByte": "UInt8",
  "mjtNum": "Double",
  "char": "CChar",
  "void": "UInt8",
  "float": "Float",
  "double": "Double",
  "mjContact": "MjContact",
  "mjOption": "MjOption",
  "mjVisual": "MjVisual",
  "mjStatistic": "MjStatistic",
  "mjvGLCamera": "MjvGLCamera",
  "mjvGeom": "MjvGeom",
  "mjvLight": "MjvLight",
  "mjrRect": "MjrRect",
  "mjuiThemeSpacing": "MjuiThemeSpacing",
  "mjuiThemeColor": "MjuiThemeColor",
]

let WrappedMjStructs: [String] = [
  "MjOption", "MjVisual", "MjvGLCamera", "MjuiThemeSpacing", "MjuiThemeColor",
]

enum SwiftArrayType {
  case plain(String)
  case tuple(String, Int)
  case staticString(Int)
  var primitive: String {
    switch self {
    case .plain(let name):
      return name
    case .tuple(let name, _):
      return name
    case .staticString(_):
      return "String"
    }
  }
}

extension SwiftArrayType: CustomStringConvertible {
  var description: String {
    switch self {
    case .plain(let name):
      return name
    case .tuple(let name, let count):
      return "(" + [String](repeating: name, count: count).joined(separator: ", ") + ")"
    case .staticString(_):
      return "String"
    }
  }
}

enum SwiftFieldType {
  case plain(String)
  case tuple(String, Int)
  case staticString(Int)
  case array(SwiftArrayType, Int?, Bool)
  var primitive: String {
    switch self {
    case .plain(let name):
      return name
    case .tuple(let name, _):
      return name
    case .array(let name, _, _):
      return name.primitive
    case .staticString(_):
      return "String"
    }
  }
}

extension SwiftFieldType: CustomStringConvertible {
  var description: String {
    switch self {
    case .plain(let name):
      return name
    case .tuple(let name, let count):
      return "(" + [String](repeating: name, count: count).joined(separator: ", ") + ")"
    case .array(let name, _, _):
      if case .staticString(_) = name {
        return "MjStaticStringArray"
      } else {
        return "MjArray<\(name)>"
      }
    case .staticString(_):
      return "String"
    }
  }
}

func swiftFieldType(
  structName: String, fieldName: String, fieldType: FieldType, comment: String?,
  staticArrayAsDynamic: [String]
) -> SwiftFieldType {
  var primitiveType = ""
  let commentType: String?
  if let comment = comment,
    let range = comment.range(of: #"\(mjt\w+\)"#, options: .regularExpression)
  {
    // This is enum type, and we need to cast.
    var elType = String(comment[range].dropFirst().dropLast())  // Remove mjt and add the rest.
    elType = "Mj" + elType.suffix(from: elType.index(elType.startIndex, offsetBy: 3))
    commentType = elType
  } else {
    commentType = nil
  }
  switch fieldType {
  case .plain(let typeName):
    if typeName.hasSuffix("*") {
      let elTypeName = typeName.dropLast().trimmingCharacters(in: .whitespaces)
      let elType = commentType ?? SwiftType[elTypeName]!
      return .array(.plain(elType), nil, false)
    } else {
      primitiveType = SwiftType[typeName]!
    }
  case .product(_):
    let fieldName = cleanupFieldName(name: fieldName)
    primitiveType = "\(structName).__Unnamed_struct_\(fieldName)"
  case .sum(_):
    break
  }
  // This is an static array.
  if let range = fieldName.range(of: #"\[\w+\]"#, options: .regularExpression) {
    let matched = fieldName[range].dropFirst().dropLast()
    let count = Int(matched) ?? definedConstants[String(matched)]!
    let restOfField = String(fieldName.suffix(from: fieldName.firstIndex(where: { $0 == "]" })!))
    let secondaryCount: Int?
    if let secondRange = restOfField.range(of: #"\[\w+\]"#, options: .regularExpression) {
      let matched = restOfField[secondRange].dropFirst().dropLast()
      secondaryCount = Int(matched) ?? definedConstants[String(matched)]!
    } else {
      secondaryCount = nil
    }
    // Treat this as dynamic array (these with suffix *).
    if staticArrayAsDynamic.contains(cleanupFieldName(name: fieldName)) {
      let elType = commentType ?? primitiveType
      if let secondaryCount = secondaryCount {
        if elType == "CChar" {
          return .array(.staticString(secondaryCount), count, true)
        } else {
          return .array(.tuple(elType, secondaryCount), count, true)
        }
      } else {
        return .array(.plain(elType), count, true)
      }
    } else if primitiveType == "CChar" {
      precondition(secondaryCount == nil)
      return .staticString(count)
    } else {
      precondition(secondaryCount == nil)
      return .tuple(primitiveType, count)
    }
  }
  return .plain(primitiveType)
}

func cleanupFieldName(name: String) -> String {
  return String(name.prefix(while: { $0 != "[" }))
}

func structExtension(
  _ thisStruct: Struct, prefix: String = "", deny: [String] = [],
  propertiesMapping: [String: String] = [:],
  staticArrayAsDynamic: [String] = [],
  excludingCamelCaseForProperties: [String] = [],
  boundingObject: String = "self"
) -> String {
  precondition(thisStruct.name.hasPrefix("mj"))
  let swiftName_ =
    "Mj"
    + thisStruct.name.suffix(from: thisStruct.name.index(thisStruct.name.startIndex, offsetBy: 2))
  let swiftName = swiftName_.prefix(upTo: swiftName_.index(swiftName_.endIndex, offsetBy: -1))
  let varName = swiftName.suffix(from: thisStruct.name.firstIndex(where: \.isUppercase)!)
    .lowercased()
  let denySet = Set(deny)
  var code = "public extension \(swiftName) {\n"
  for (name, type, comment) in thisStruct.fields {
    guard let name = name else { continue }  // Handle sum type.
    let fieldName = cleanupFieldName(name: name)
    guard !denySet.contains(fieldName) else { continue }
    code += "  @inlinable\n"
    let fieldType = swiftFieldType(
      structName: thisStruct.name, fieldName: name, fieldType: type, comment: comment,
      staticArrayAsDynamic: staticArrayAsDynamic)
    if excludingCamelCaseForProperties.contains(fieldName) {
      code += "  var \(fieldName): \(fieldType) {\n"
    } else {
      code += "  var \(fieldName.camelCase()): \(fieldType) {\n"
    }
    // If this is MjArray, we need to have more parsing, particularly on the comment.
    if case let .array(elType, maxCount, staticArray) = fieldType {
      guard let comment = comment else { fatalError() }
      // If the maxCount is available, use that. And then if we can extract more precise information, use that later.
      var arrayCount: String? = maxCount.flatMap { "\($0)" }
      if let range = comment.range(of: #"\(n\w+.*\)"#, options: .regularExpression) {
        arrayCount = comment[range].dropFirst().dropLast().replacingOccurrences(
          of: " x ", with: " * ")
        for (key, value) in propertiesMapping {
          arrayCount = arrayCount?.replacingOccurrences(of: key, with: value)
        }
      }
      let count = arrayCount!
      if case .staticString(let strlen) = elType {
        precondition(staticArray)
        let ump = "withUnsafeMutablePointer(to: &_\(varName)\(prefix).\(fieldName).0.0, { $0 })"
        code +=
          "    get { \(fieldType)(array: \(ump), object: \(boundingObject), len: \(count), strlen: \(strlen)) }\n"
        code += "    set {\n"
        code += "      let unsafeMutablePointer: UnsafeMutablePointer<CChar> = \(ump)\n"
        code += "      guard unsafeMutablePointer != newValue._array else { return }\n"
        code +=
          "      unsafeMutablePointer.assign(from: newValue._array, count: Int(\(count)) * \(strlen))\n"
        code += "    }\n"
      } else {
        let cast = elType.primitive.hasPrefix("Mj")  // For these, we need to force cast the type.
        let ump: String
        if staticArray {
          if cast {
            ump =
              "UnsafeMutableRawPointer(withUnsafeMutablePointer(to: &_\(varName)\(prefix).\(fieldName).0, { $0 })).assumingMemoryBound(to: \(elType).self)"
          } else {
            ump = "withUnsafeMutablePointer(to: &_\(varName)\(prefix).\(fieldName).0, { $0 })"
          }
        } else {
          if cast {
            ump =
              "UnsafeMutableRawPointer(_\(varName)\(prefix).\(fieldName)).assumingMemoryBound(to: \(elType).self)"
          } else {
            ump = "_\(varName)\(prefix).\(fieldName)"
          }
        }
        code +=
          "    get { \(fieldType)(array: \(ump), object: \(boundingObject), len: \(count)) }\n"
        code += "    set {\n"
        code += "      let unsafeMutablePointer: UnsafeMutablePointer<\(elType)> = \(ump)\n"
        code += "      guard unsafeMutablePointer != newValue._array else { return }\n"
        code += "      unsafeMutablePointer.assign(from: newValue._array, count: Int(\(count)))\n"
        code += "    }\n"
      }
    } else if WrappedMjStructs.contains(fieldType.primitive) {
      if case let .plain(primitiveType) = fieldType {
        code += "    get { \(primitiveType)(_\(varName)\(prefix).\(fieldName)) }\n"
        var fieldVarName = String(primitiveType.dropFirst())
        fieldVarName = fieldVarName.suffix(from: fieldVarName.firstIndex(where: \.isUppercase)!)
          .lowercased()
        code +=
          "    set { _\(varName)\(prefix).\(fieldName) = newValue._\(fieldVarName) }\n"
      } else if case let .tuple(primitiveType, count) = fieldType {
        code +=
          "    get { (\((0..<count).map({ "\(primitiveType)(_\(varName)\(prefix).\(fieldName).\($0))" }).joined(separator: ", "))) }\n"
        var fieldVarName = String(primitiveType.dropFirst())
        fieldVarName = fieldVarName.suffix(from: fieldVarName.firstIndex(where: \.isUppercase)!)
          .lowercased()
        code += "    set {\n"
        for i in 0..<count {
          code += "      _\(varName)\(prefix).\(fieldName).\(i) = newValue.\(i)._\(fieldVarName)\n"
        }
        code += "    }\n"
      }
    } else if case .staticString(let count) = fieldType {
      code += "    get {\n"
      code += "      var value = _\(varName)\(prefix).\(fieldName)\n"
      code +=
        "      return withUnsafePointer(to: &value.0) { String(cString: $0, encoding: .utf8)! }\n"
      code += "    }\n"
      code += "    set {\n"
      code += "      var value = newValue\n"
      code += "      value.withUTF8 { utf8 in\n"
      code += "        precondition(utf8.count < \(count))\n"
      code +=
        "        withUnsafeMutablePointer(to: &_\(varName)\(prefix).\(fieldName).0) { pos in\n"
      code +=
        "          utf8.baseAddress?.withMemoryRebound(to: CChar.self, capacity: utf8.count) {\n"
      code += "            pos.assign(from: $0, count: utf8.count)\n"
      code += "          }\n"
      code += "          pos[utf8.count] = 0\n"
      code += "        }\n"
      code += "      }\n"
      code += "    }\n"
    } else {
      code += "    get { _\(varName)\(prefix).\(fieldName) }\n"
      code += "    set { _\(varName)\(prefix).\(fieldName) = newValue }\n"
    }
    code += "  }\n"
  }
  code += "}\n"
  return code
}

var mjtCode = ""
for thisEnum in enums {
  mjtCode += enumDecl(thisEnum)
}
try! mjtCode.write(
  to: URL(fileURLWithPath: WorkDir).appendingPathComponent("Mjt.swift"), atomically: false,
  encoding: .utf8)

for thisStruct in structs {
  if thisStruct.name == "mjContact_" {
    let code = structExtension(thisStruct, excludingCamelCaseForProperties: ["H"])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjContact+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjLROpt_" {
    let code = structExtension(thisStruct)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjLROpt+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjOption_" {
    let code = structExtension(thisStruct)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjOption+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjVisual_" {
    let code = "import C_mujoco\n" + structExtension(thisStruct)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjVisual+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvCamera_" {
    let code = structExtension(thisStruct)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvCamera+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvGLCamera_" {
    let code = structExtension(thisStruct)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvGLCamera+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvGeom_" {
    let code = structExtension(thisStruct)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvGeom+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvOption_" {
    let code = structExtension(thisStruct)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvOption+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvPerturb_" {
    let code = structExtension(thisStruct)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvPerturb+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjData_" {
    let code = structExtension(
      thisStruct, prefix: ".pointee", deny: ["warning", "timer", "solver", "buffer", "stack"])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjData+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjModel_" {
    var code = "import C_mujoco\n"
    code += structExtension(
      thisStruct, prefix: ".pointee", deny: ["buffer"],
      propertiesMapping: [
        "nuser_jnt": "nuserJnt", "nuser_geom": "nuserGeom", "nuser_site": "nuserSite",
        "nuser_cam": "nuserCam", "nuser_tendon": "nuserTendon", "nuser_actuator": "nuserActuator",
        "nuser_sensor": "nuserSensor", "nuser_body": "nuserBody",
      ])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjModel+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvScene_" {
    let code = structExtension(thisStruct, staticArrayAsDynamic: ["lights"])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvScene+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvFigure_" {
    let code = structExtension(
      thisStruct, prefix: ".pointee",
      deny: ["linedata"], staticArrayAsDynamic: ["linergb", "range", "linename", "linepnt"])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvFigure+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjrContext_" {
    let code = structExtension(
      thisStruct,
      staticArrayAsDynamic: [
        "auxWidth", "auxHeight", "auxSamples", "auxFBO", "auxFBO_r", "auxColor", "auxColor_r",
        "textureType", "texture", "charWidth", "charWidthBig",
      ],
      excludingCamelCaseForProperties: [
        "offFBO_r", "offColor_r", "offDepthStencil_r", "auxFBO_r", "auxColor_r",
      ])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjrContext+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiState_" {
    let code = structExtension(thisStruct, deny: ["userdata"])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiState+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiThemeSpacing_" {
    let code = structExtension(thisStruct)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiThemeSpacing+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiThemeColor_" {
    let code = structExtension(thisStruct)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiThemeColor+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiItemSingle_" {
    let code = structExtension(thisStruct, prefix: ".pointee", boundingObject: "object")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiItemSingle+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiItemMulti_" {
    let code = structExtension(
      thisStruct, prefix: ".pointee", staticArrayAsDynamic: ["name"], boundingObject: "object")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiItemMulti+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiItemSlider_" {
    let code = structExtension(thisStruct, prefix: ".pointee", boundingObject: "object")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiItemSlider+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiItemEdit_" {
    let code = structExtension(
      thisStruct, prefix: ".pointee", staticArrayAsDynamic: ["range"], boundingObject: "object")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiItemEdit+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiItem_" {
    let code = structExtension(
      thisStruct, prefix: ".pointee", deny: ["*pdata", "single", "multi", "slider", "edit"],
      boundingObject: "object")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiItem+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiSection_" {
    let code = structExtension(thisStruct, prefix: ".pointee", deny: ["item"])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiSection+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjUI_" {
    let code = structExtension(
      thisStruct, prefix: ".pointee", deny: ["predicate", "userdata", "editchanged", "sect"])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjUI+Extensions.swift"),
      atomically: false, encoding: .utf8)
  }
}
