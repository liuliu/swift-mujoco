import ChangeCases
import Foundation
import MuJoCoCSyntax

var enums = [Enum]()
var structs = [Struct]()
var definedConstants = [String: Int]()
var apiDefinitions = [APIDefinition]()

var WorkDir = CommandLine.arguments[1]

for filePath in CommandLine.arguments[2...] {
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

// ----- Generate code for enums ----

var wrappedMjEnums = Set<String>()
var mjtCode = ""
for thisEnum in enums {
  let swiftName_ =
    "Mj" + thisEnum.name.suffix(from: thisEnum.name.index(thisEnum.name.startIndex, offsetBy: 3))
  let swiftName = swiftName_.prefix(upTo: swiftName_.index(swiftName_.endIndex, offsetBy: -1))
  wrappedMjEnums.insert(String(swiftName))
  mjtCode += enumDecl(thisEnum)
}
try! mjtCode.write(
  to: URL(fileURLWithPath: WorkDir).appendingPathComponent("Mjt.swift"), atomically: false,
  encoding: .utf8)

// ----- Generate code for structs -----

for thisStruct in structs {
  if thisStruct.name == "mjContact_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      excludingCamelCaseForProperties: ["H"])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjContact+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjLROpt_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjLROpt+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjOption_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjOption+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjVisual_" {
    let code =
      "import C_mujoco\n"
      + structExtension(
        thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjVisual+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvCamera_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvCamera+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvGLCamera_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvGLCamera+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvGeom_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvGeom+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvOption_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvOption+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvPerturb_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvPerturb+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjData_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      prefix: ".pointee", deny: ["warning", "timer", "solver", "buffer", "stack"])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjData+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjModel_" {
    var code = "import C_mujoco\n"
    code += structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      prefix: ".pointee", deny: ["buffer"],
      propertiesMapping: [
        "nuser_jnt": "nuserJnt", "nuser_geom": "nuserGeom", "nuser_site": "nuserSite",
        "nuser_cam": "nuserCam", "nuser_tendon": "nuserTendon", "nuser_actuator": "nuserActuator",
        "nuser_sensor": "nuserSensor", "nuser_body": "nuserBody",
      ])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjModel+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvScene_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      staticArrayAsDynamic: ["lights"])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvScene+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvFigure_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      prefix: ".pointee",
      deny: ["linedata"], staticArrayAsDynamic: ["linergb", "range", "linename", "linepnt"])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvFigure+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjrContext_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
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
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      deny: ["userdata"])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiState+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiThemeSpacing_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiThemeSpacing+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiThemeColor_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiThemeColor+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiItemSingle_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      prefix: ".pointee", boundingObject: "object")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiItemSingle+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiItemMulti_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      prefix: ".pointee", staticArrayAsDynamic: ["name"], boundingObject: "object")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiItemMulti+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiItemSlider_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      prefix: ".pointee", boundingObject: "object")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiItemSlider+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiItemEdit_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      prefix: ".pointee", staticArrayAsDynamic: ["range"], boundingObject: "object")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiItemEdit+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiItem_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      prefix: ".pointee", deny: ["*pdata", "single", "multi", "slider", "edit"],
      boundingObject: "object")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiItem+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiSection_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      prefix: ".pointee", deny: ["item"])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiSection+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjUI_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      prefix: ".pointee", deny: ["predicate", "userdata", "editchanged", "sect"])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjUI+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiDef_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      deny: ["pdata"])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiDef+Extensions.swift"),
      atomically: false, encoding: .utf8)
  }
}

// ----- Generate code for functions -----

let FunctionDeny: Set<String> = Set([
  "mj_defaultVFS",
  "mj_addFileVFS",
  "mj_makeEmptyFileVFS",
  "mj_findFileVFS",
  "mj_deleteFileVFS",
  "mj_deleteVFS",
  "mj_loadXML",
  "mj_saveLastXML",
  "mj_freeLastXML",
  "mj_printSchema",
  "mj_defaultLROpt",
  "mj_defaultSolRefImp",
  "mj_defaultOption",
  "mj_defaultVisual",
  "mj_copyModel",
  "mj_saveModel",
  "mj_loadModel",
  "mj_deleteModel",
  "mj_sizeModel",
  "mj_makeData",
  "mj_copyData",
  "mj_deleteData",
  "mjv_defaultCamera",
  "mjv_defaultPerturb",
  "mjv_defaultOption",
  "mjv_defaultFigure",
  "mjv_defaultScene",
  "mjv_makeScene",
  "mjv_freeScene",
  "mjr_defaultContext",
  "mjr_makeContext",
  "mjr_freeContext",
  "mjui_themeSpacing",
  "mjui_themeColor",
  "mju_malloc",
  "mju_free",
  "mj_activate",
  "mj_deactivate",
  // No need for math.
  "mju_zero3",
  "mju_copy3",
  "mju_scl3",
  "mju_add3",
  "mju_sub3",
  "mju_addTo3",
  "mju_subFrom3",
  "mju_addToScl3",
  "mju_addScl3",
  "mju_normalize3",
  "mju_norm3",
  "mju_dot3",
  "mju_dist3",
  "mju_rotVecMat",
  "mju_rotVecMatT",
  "mju_cross",
  "mju_zero4",
  "mju_unit4",
  "mju_copy4",
  "mju_normalize4",
  "mju_zero",
  "mju_copy",
  "mju_sum",
  "mju_L1",
  "mju_scl",
  "mju_add",
  "mju_sub",
  "mju_addTo",
  "mju_subFrom",
  "mju_addToScl",
  "mju_addScl",
  "mju_normalize",
  "mju_norm",
  "mju_dot",
  "mju_mulMatVec",
  "mju_mulMatTVec",
  "mju_transpose",
  "mju_mulMatMat",
  "mju_mulMatMatT",
  "mju_mulMatTMat",
  "mju_sqrMatTD",
  "mju_transformSpatial",
  "mju_rotVecQuat",
  "mju_negQuat",
  "mju_mulQuat",
  "mju_mulQuatAxis",
  "mju_axisAngle2Quat",
  "mju_quat2Vel",
  "mju_subQuat",
  "mju_quat2Mat",
  "mju_mat2Quat",
  "mju_derivQuat",
  "mju_quatIntegrate",
  "mju_quatZ2Vec",
  "mju_mulPose",
  "mju_negPose",
  "mju_trnVecPose",
  "mju_cholFactor",
  "mju_cholSolve",
  "mju_cholUpdate",
  "mju_eig3",
  "mju_muscleGain",
  "mju_muscleBias",
  "mju_muscleDynamics",
  "mju_encodePyramid",
  "mju_decodePyramid",
  "mju_springDamper",
  "mju_min",
  "mju_max",
  "mju_sign",
  "mju_round",
  "mju_str2Type",
  "mju_isBad",
  "mju_isZero",
  "mju_standardNormal",
  "mju_f2n",
  "mju_n2f",
  "mju_d2n",
  "mju_n2d",
  "mju_insertionSort",
  "mju_insertionSortInt",
  "mju_Halton",
  "mju_strncpy",
  "mju_sigmoid",
])

for apiDefinition in apiDefinitions {
  guard !FunctionDeny.contains(apiDefinition.name) else { continue }
  print(
    functionExtension(
      apiDefinition,
      deny: ["mjrRect"],
      nameMapping: [
        "m": ["model"], "d": ["data"], "con": ["contact", "context"], "scn": ["scene"],
        "key": ["keyframe"],
      ]))
}
