import ChangeCases
import Foundation
import MuJoCoCSyntax

var WorkDir = CommandLine.arguments[1]

let (enums, structs, definedConstants, apiDefinitions) = parseMuJoCoHeaders(
  from: Array(CommandLine.arguments[2...]))

// ----- Generate code for enums ----

var wrappedMjEnums = Set<String>()
var mjtCode = ""
let optionSets: Set<String> = Set([
  "MjtEnableBit",
  "MjtDisableBit",
  "MjtPertBit",
  "MjtCatBit",
])
for thisEnum in enums {
  let swiftName_ =
    "Mjt" + thisEnum.name.suffix(from: thisEnum.name.index(thisEnum.name.startIndex, offsetBy: 3))
  let swiftName = swiftName_.prefix(upTo: swiftName_.index(swiftName_.endIndex, offsetBy: -1))
  wrappedMjEnums.insert(String(swiftName))
  if optionSets.contains(String(swiftName)) {
    mjtCode += optionSet(thisEnum)
  } else {
    mjtCode += enumDecl(thisEnum)
  }
}
try! mjtCode.write(
  to: URL(fileURLWithPath: WorkDir).appendingPathComponent("Mjt.swift"), atomically: false,
  encoding: .utf8)

// ----- Generate code for structs -----

for thisStruct in structs {
  if thisStruct.name == "mjContact_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets,
      excludingCamelCaseForProperties: ["H"])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjContact+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjLROpt_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjLROpt+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjOption_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjOption+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjVisual_" {
    let code =
      "import C_mujoco\n"
      + structExtension(
        thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
        optionSets: optionSets)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjVisual+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvCamera_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvCamera+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvGLCamera_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvGLCamera+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvGeom_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvGeom+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvOption_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvOption+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvPerturb_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvPerturb+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjData_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets,
      suffix: ".pointee", deny: ["buffer", "stack"],
      staticArrayAsDynamic: ["warning", "timer", "solver"],
      boundingObject: "_storage")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjData+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjModel_" {
    var code = "import C_mujoco\n"
    code += structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets,
      suffix: ".pointee", deny: ["buffer"],
      propertiesMapping: [
        "nuser_jnt": "nuserJnt", "nuser_geom": "nuserGeom", "nuser_site": "nuserSite",
        "nuser_cam": "nuserCam", "nuser_tendon": "nuserTendon", "nuser_actuator": "nuserActuator",
        "nuser_sensor": "nuserSensor", "nuser_body": "nuserBody",
      ], boundingObject: "_storage")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjModel+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvScene_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets,
      suffix: ".pointee",
      staticArrayAsDynamic: ["lights"], boundingObject: "_storage")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvScene+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjvFigure_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets,
      suffix: ".pointee",
      deny: ["linedata"], staticArrayAsDynamic: ["linergb", "range", "linename", "linepnt"],
      boundingObject: "_storage")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjvFigure+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjrContext_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets,
      suffix: ".pointee",
      staticArrayAsDynamic: [
        "auxWidth", "auxHeight", "auxSamples", "auxFBO", "auxFBO_r", "auxColor", "auxColor_r",
        "textureType", "texture", "charWidth", "charWidthBig",
      ],
      excludingCamelCaseForProperties: [
        "offFBO_r", "offColor_r", "offDepthStencil_r", "auxFBO_r", "auxColor_r",
      ], boundingObject: "_storage")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjrContext+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiState_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets,
      deny: ["userdata"])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiState+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiThemeSpacing_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiThemeSpacing+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiThemeColor_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets)
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiThemeColor+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiItemSingle_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets,
      suffix: ".pointee", boundingObject: "object")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiItemSingle+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiItemMulti_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets,
      suffix: ".pointee", staticArrayAsDynamic: ["name"], boundingObject: "object")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiItemMulti+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiItemSlider_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets,
      suffix: ".pointee", boundingObject: "object")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiItemSlider+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiItemEdit_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets,
      suffix: ".pointee", staticArrayAsDynamic: ["range"], boundingObject: "object")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiItemEdit+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiItem_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets,
      suffix: ".pointee", deny: ["*pdata", "single", "multi", "slider", "edit"],
      boundingObject: "object")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiItem+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiSection_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets,
      suffix: ".pointee", deny: ["item"])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiSection+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjUI_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets,
      suffix: ".pointee", deny: ["predicate", "userdata", "editchanged", "sect"],
      boundingObject: "_storage")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjUI+Extensions.swift"),
      atomically: false, encoding: .utf8)
  } else if thisStruct.name == "mjuiDef_" {
    let code = structExtension(
      thisStruct, definedConstants: definedConstants, wrappedMjEnums: wrappedMjEnums,
      optionSets: optionSets,
      deny: ["pdata"])
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("MjuiDef+Extensions.swift"),
      atomically: false, encoding: .utf8)
  }
}

// ----- Generate code for functions -----

let FunctionDeny: Set<String> = Set([
  // Implemented manually.
  "mj_defaultVFS",
  "mj_addFileVFS",
  "mj_makeEmptyFileVFS",
  "mj_findFileVFS",
  "mj_deleteFileVFS",
  "mj_deleteVFS",
  "mj_loadXML",
  "mj_defaultLROpt",
  "mj_defaultSolRefImp",
  "mj_defaultOption",
  "mj_defaultVisual",
  "mj_loadModel",
  "mj_deleteModel",
  "mj_makeData",
  "mj_deleteData",
  "mjv_defaultCamera",
  "mjv_defaultPerturb",
  "mjv_defaultOption",
  "mjv_defaultFigure",
  "mjv_defaultScene",
  "mjv_updateScene",
  "mjv_freeScene",
  "mjr_defaultContext",
  "mjr_freeContext",
  "mjui_themeSpacing",
  "mjui_themeColor",
  "mjui_add",
  "mjui_addToSection",
  "mjui_event",
  "mjr_readPixels",
  "mjr_drawPixels",
  "mj_setLengthRange",
  "mjr_findRect",
  "mj_copyModel",
  "mj_saveModel",
  "mj_sizeModel",
  "mj_copyData",
  "mj_stackAlloc",
  "mj_saveLastXML",
  "mj_freeLastXML",
  "mj_printSchema",
  // Not going to be implemented.
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

var sourceCodeMapping: [String?: String] = [:]

for apiDefinition in apiDefinitions {
  guard !FunctionDeny.contains(apiDefinition.name) else { continue }
  let (mainType, sourceCode) = functionExtension(
    apiDefinition,
    deny: ["mjrRect"],
    nameMapping: [
      "m": ["model"], "d": ["data"], "con": ["contact", "context"], "scn": ["scene"],
      "key": ["keyframe"], "opt": ["option"], "pert": ["perturb"], "cam": ["camera"],
    ])
  sourceCodeMapping[mainType] = sourceCodeMapping[mainType, default: ""] + sourceCode
}

for (mainType, sourceCode) in sourceCodeMapping {
  guard let mainType = mainType else {
    var code = "import C_mujoco\n\n"
    let lines = sourceCode.components(separatedBy: "\n")
    code += lines.map({ $0.dropFirst().dropFirst() }).joined(separator: "\n")
    try! code.write(
      to: URL(fileURLWithPath: WorkDir).appendingPathComponent("Mj+Functions.swift"),
      atomically: false, encoding: .utf8)
    continue
  }
  var code = "import C_mujoco\n\nextension \(mainType) {\n"
  code += sourceCode
  code += "}"
  try! code.write(
    to: URL(fileURLWithPath: WorkDir).appendingPathComponent("\(mainType)+Functions.swift"),
    atomically: false, encoding: .utf8)
}
