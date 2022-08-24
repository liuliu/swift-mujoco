import ChangeCases
import Foundation

public struct AnonymousStruct {
  public var fields: [(name: String, type: String, comment: String?)]
  public init(fields: [(name: String, type: String, comment: String?)]) {
    self.fields = fields
  }
}

public struct AnonymousUnion {
  public var fields: [(name: String, type: String, comment: String?)]
  public init(fields: [(name: String, type: String, comment: String?)]) {
    self.fields = fields
  }
}

public enum FieldType {
  case plain(String)
  case product(AnonymousStruct)
  case sum(AnonymousUnion)
}

public struct Struct {
  public var name: String
  public var comment: String?
  public var fields: [(name: String?, type: FieldType, comment: String?)]
  public init(
    name: String, comment: String?, fields: [(name: String?, type: FieldType, comment: String?)]
  ) {
    self.name = name
    self.comment = comment
    self.fields = fields
  }
}

let SwiftType: [String: String] = [
  "int": "Int32",
  "unsigned int": "UInt32",
  "bool": "Bool",
  "mjtByte": "UInt8",
  "mjtNum": "Double",
  "char": "CChar",
  "unsigned char": "UInt8",
  "void": "Void",
  "float": "Float",
  "double": "Double",
  "mjContact": "MjContact",
  "mjTimerStat": "MjTimerStat",
  "mjSolverStat": "MjSolverStat",
  "mjWarningStat": "MjWarningStat",
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
  staticArrayAsDynamic: [String], definedConstants: [String: Int]
) -> SwiftFieldType {
  var primitiveType = ""
  let commentType: String?
  if let comment = comment {
    if let range = comment.range(of: #"\(mjt\w+\)"#, options: .regularExpression) {
      // This is enum type, and we need to cast.
      var elType = String(comment[range].dropFirst().dropLast())  // Remove mjt and add the rest.
      elType = "Mjt" + elType.suffix(from: elType.index(elType.startIndex, offsetBy: 3))
      commentType = elType
    } else if let range = comment.range(of: #"\(type\s+mjt\w+\)"#, options: .regularExpression) {
      let tighterComment = comment[range]
      var elType = String(
        tighterComment.suffix(from: tighterComment.index(tighterComment.startIndex, offsetBy: 5))
          .dropLast().trimmingCharacters(in: .whitespaces))  // Remove mjt and add the rest.
      elType = "Mjt" + elType.suffix(from: elType.index(elType.startIndex, offsetBy: 3))
      commentType = elType
    } else {
      commentType = nil
    }
  } else {
    commentType = nil
  }
  switch fieldType {
  case .plain(let typeName):
    if typeName.hasSuffix("*") {
      let elTypeName = typeName.dropLast().trimmingCharacters(in: .whitespaces)
      let elType = commentType ?? SwiftType[elTypeName]!
      if elType == "Void" {  // This is raw pointer, nothing to see.
        return .plain("UnsafeMutableRawPointer")
      }
      return .array(.plain(elType), nil, false)
    } else {
      primitiveType = commentType ?? SwiftType[typeName]!
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

public func structExtension(
  _ thisStruct: Struct, definedConstants: [String: Int], wrappedMjEnums: Set<String>,
  optionSets: Set<String>, prefix: String = "",
  suffix: String = "", deny: [String] = [], propertiesMapping: [String: String] = [:],
  staticArrayAsDynamic: [String] = [], excludingCamelCaseForProperties: [String] = [],
  boundingObject: String = "self",
  additionalReflectingProperties: [(name: String, optional: Bool)] = []
) -> String {
  precondition(thisStruct.name.hasPrefix("mj"))
  let swiftName_ =
    "Mj"
    + thisStruct.name.suffix(from: thisStruct.name.index(thisStruct.name.startIndex, offsetBy: 2))
  let swiftName = swiftName_.prefix(upTo: swiftName_.index(swiftName_.endIndex, offsetBy: -1))
  let varName = swiftName.suffix(from: thisStruct.name.firstIndex(where: \.isUppercase)!)
    .lowercased()
  let denySet = Set(deny)
  var code = "extension \(swiftName) {\n"
  var fieldNames = [(name: String, optional: Bool)]()
  for (name, type, comment) in thisStruct.fields {
    guard let name = name else { continue }  // Handle sum type.
    let fieldName = cleanupFieldName(name: name)
    guard !denySet.contains(fieldName) else { continue }
    if let comment = comment {
      code += "  /// \(comment)\n"
    }
    code += "  @inlinable\n"
    let fieldType = swiftFieldType(
      structName: thisStruct.name, fieldName: name, fieldType: type, comment: comment,
      staticArrayAsDynamic: staticArrayAsDynamic, definedConstants: definedConstants)
    if excludingCamelCaseForProperties.contains(fieldName) {
      fieldNames.append((name: fieldName, optional: false))
      code += "  public var \(fieldName): \(fieldType) {\n"
    } else {
      fieldNames.append((name: fieldName.camelCase(), optional: false))
      code += "  public var \(fieldName.camelCase()): \(fieldType) {\n"
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
        let ump =
          "withUnsafeMutablePointer(to: &\(prefix)_\(varName)\(suffix).\(fieldName), { UnsafeMutableRawPointer($0).assumingMemoryBound(to: CChar.self) })"
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
          ump =
            "withUnsafeMutablePointer(to: &\(prefix)_\(varName)\(suffix).\(fieldName), { UnsafeMutableRawPointer($0).assumingMemoryBound(to: \(elType).self) })"
        } else {
          if cast {
            ump =
              "UnsafeMutableRawPointer(\(prefix)_\(varName)\(suffix).\(fieldName)).assumingMemoryBound(to: \(elType).self)"
          } else {
            ump = "\(prefix)_\(varName)\(suffix).\(fieldName)"
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
        code += "    get { \(primitiveType)(_\(varName)\(suffix).\(fieldName)) }\n"
        var fieldVarName = String(primitiveType.dropFirst())
        fieldVarName = fieldVarName.suffix(from: fieldVarName.firstIndex(where: \.isUppercase)!)
          .lowercased()
        code +=
          "    set { _\(varName)\(suffix).\(fieldName) = newValue._\(fieldVarName) }\n"
      } else if case let .tuple(primitiveType, count) = fieldType {
        code +=
          "    get { (\((0..<count).map({ "\(primitiveType)(_\(varName)\(suffix).\(fieldName).\($0))" }).joined(separator: ", "))) }\n"
        var fieldVarName = String(primitiveType.dropFirst())
        fieldVarName = fieldVarName.suffix(from: fieldVarName.firstIndex(where: \.isUppercase)!)
          .lowercased()
        code += "    set {\n"
        for i in 0..<count {
          code += "      _\(varName)\(suffix).\(fieldName).\(i) = newValue.\(i)._\(fieldVarName)\n"
        }
        code += "    }\n"
      }
    } else if wrappedMjEnums.contains(fieldType.primitive) {
      let isOptionSet = optionSets.contains(fieldType.primitive)
      if case let .plain(primitiveType) = fieldType {
        code +=
          "    get { \(primitiveType)(rawValue: _\(varName)\(suffix).\(fieldName))\(isOptionSet ? "" : "!") }\n"
        code +=
          "    set { _\(varName)\(suffix).\(fieldName) = newValue.rawValue }\n"
      } else if case let .tuple(primitiveType, count) = fieldType {
        code +=
          "    get { (\((0..<count).map({ "\(primitiveType)(rawValue: _\(varName)\(suffix).\(fieldName).\($0))\(isOptionSet ? "" : "!")" }).joined(separator: ", "))) }\n"
        code += "    set {\n"
        for i in 0..<count {
          code += "      _\(varName)\(suffix).\(fieldName).\(i) = newValue.\(i).rawValue\n"
        }
        code += "    }\n"
      }
    } else if case .staticString(let count) = fieldType {
      code += "    get {\n"
      code += "      var value = _\(varName)\(suffix).\(fieldName)\n"
      code +=
        "      return withUnsafePointer(to: &value) { String(cString: UnsafeRawPointer($0).assumingMemoryBound(to: CChar.self), encoding: .utf8)! }\n"
      code += "    }\n"
      code += "    set {\n"
      code += "      var value = newValue\n"
      code += "      value.withUTF8 { utf8 in\n"
      code += "        let count = min(utf8.count, \(count - 1))\n"
      code +=
        "        withUnsafeMutablePointer(to: &_\(varName)\(suffix).\(fieldName)) {\n"
      code +=
        "          let pos = UnsafeMutableRawPointer($0).assumingMemoryBound(to: CChar.self)\n"
      code +=
        "          utf8.baseAddress?.withMemoryRebound(to: CChar.self, capacity: count) {\n"
      code += "            pos.assign(from: $0, count: count)\n"
      code += "          }\n"
      code += "          pos[count] = 0\n"
      code += "        }\n"
      code += "      }\n"
      code += "    }\n"
    } else {
      code += "    get { _\(varName)\(suffix).\(fieldName) }\n"
      code += "    set { _\(varName)\(suffix).\(fieldName) = newValue }\n"
    }
    code += "  }\n"
  }
  code += "}\n"
  code += "extension \(swiftName): CustomReflectable {\n"
  code += "  public var customMirror: Mirror {\n"
  code +=
    "    Mirror(self, children: [\((fieldNames + additionalReflectingProperties).map({ "\"\($0.name)\": \($0.name)" + ($0.optional ? " as Any" : "") }).joined(separator: ", "))])\n"
  code += "  }\n"
  code += "}\n"
  return code
}
