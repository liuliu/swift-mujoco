import Dispatch
import MuJoCo

struct Settings {
  var exitrequest: Int32 = 0
  // option section of UI
  @MjuiItemState(.select, name: "Spacing", state: 1, other: "Tight\nWide")
  var spacing: Int32 = 0
  @MjuiItemState(.select, name: "Color", state: 1, other: "Default\nOrange\nWhite\nBlack")
  var color: Int32 = 0
  @MjuiItemState(.select, name: "Font", state: 1, other: "50 %\n100 %\n150 %\n200 %\n250 %\n300%")
  var font: Int32 = 0
  @MjuiItemState(.checkint, name: "Left UI (Tab)", state: 1, other: " #258")
  var ui0: Int32 = 1
  @MjuiItemState(.checkint, name: "Right UI", state: 1, other: "S#258")
  var ui1: Int32 = 1
  @MjuiItemState(.checkint, name: "Help", state: 2, other: " #290")
  var help: Int32 = 0
  @MjuiItemState(.checkint, name: "Info", state: 2, other: " #291")
  var info: Int32 = 0
  @MjuiItemState(.checkint, name: "Profiler", state: 2, other: " #292")
  var profiler: Int32 = 0
  @MjuiItemState(.checkint, name: "Sensor", state: 2, other: " #293")
  var sensor: Int32 = 0
  @MjuiItemState(.checkint, name: "Fullscreen", state: 1, other: " #294")
  var fullscreen: Int32 = 0
  @MjuiItemState(.checkint, name: "Vertical Sync", state: 1, other: "")
  var vsync: Int32 = 1
  @MjuiItemState(.checkint, name: "Busy Wait", state: 1, other: "")
  var busywait: Int32 = 0
  // simulation section of UI
  @MjuiItemState(.radio, name: "", state: 2, other: "Pause\nRun")
  var run: Int32 = 1
  @MjuiItemState(.sliderint, name: "Key", state: 3, other: "0 0")
  var key: Int32 = 0
  @MjuiItemState(.slidernum, name: "Noise scale", state: 2, other: "0 2")
  var ctrlnoisestd: Double = 0
  @MjuiItemState(.slidernum, name: "Noise rate", state: 2, other: "0 2")
  var ctrlnoiserate: Double = 0
  // watch section of UI
  @MjuiItemState(.edittxt, name: "Field", state: 2, other: "qpos")
  var field: String = "qpos"
  @MjuiItemState(.editint, name: "Index", state: 2, other: "1")
  var index: Int32 = 0
  var loadrequest: Int32 = 0
}

let glContext = GLContext(width: 1280, height: 720, title: "simulate")

// We will run this function off main thread on a default global queue.
func simulate() {
}

glContext.makeCurrent {
  var settings = Settings()
  var scene = MjvScene(model: nil, maxgeom: 1000)
  // The context need to be initialized after having a GL context.
  let context = MjrContext(model: nil, fontScale: ._100)
  DispatchQueue.global(qos: .default).async(execute: simulate)
  var ui0 = MjUI()
  ui0.spacing = MjuiThemeSpacing(0)
  ui0.color = MjuiThemeColor(0)
  ui0.rectid = 1
  ui0.auxid = 0
  var uistate = MjuiState()
  ui0.add(defs: [
    MjuiDef(.section, name: "File", state: 1, pdata: nil, other: "AF"),
    MjuiDef(.button, name: "Save xml", state: 2, pdata: nil, other: ""),
    MjuiDef(.button, name: "Save mjb", state: 2, pdata: nil, other: ""),
    MjuiDef(.button, name: "Print model", state: 2, pdata: nil, other: "CM"),
    MjuiDef(.button, name: "Print data", state: 2, pdata: nil, other: "CD"),
    MjuiDef(.button, name: "Quit", state: 1, pdata: nil, other: "CQ"),
  ])
  ui0.add(defs: [
    MjuiDef(.section, name: "Option", state: 1, pdata: nil, other: "AO"),
    settings.$spacing,
    settings.$color,
    settings.$font,
    settings.$ui0,
    settings.$ui1,
    settings.$help,
    settings.$info,
    settings.$profiler,
    settings.$sensor,
    settings.$fullscreen,
    settings.$vsync,
    settings.$busywait,
  ])
  ui0.add(defs: [
    MjuiDef(.section, name: "Simulation", state: 1, pdata: nil, other: "AS"),
    settings.$run,
    MjuiDef(.button, name: "Reset", state: 2, pdata: nil, other: " #259"),
    MjuiDef(.button, name: "Reload", state: 2, pdata: nil, other: "CL"),
    MjuiDef(.button, name: "Align", state: 2, pdata: nil, other: "CA"),
    MjuiDef(.button, name: "Copy pose", state: 2, pdata: nil, other: "CC"),
    settings.$key,
    MjuiDef(.button, name: "Load key", state: 3, pdata: nil, other: ""),
    MjuiDef(.button, name: "Save key", state: 3, pdata: nil, other: ""),
    settings.$ctrlnoisestd,
    settings.$ctrlnoiserate,
  ])
  ui0.add(defs: [
    MjuiDef(.section, name: "Watch", state: 0, pdata: nil, other: "AW"),
    settings.$field,
    settings.$index,
    MjuiDef(.static, name: "Value", state: 2, pdata: nil, other: " "),
  ])
  ui0.predicate = { _ in
    return true
  }
  ui0.resize(context: context)
  context.addAux(
    index: ui0.auxid, width: ui0.width, height: ui0.maxheight, samples: ui0.spacing.samples)
  glContext.runLoop(swapInterval: 1) { width, height in
    let viewport = MjrRect(left: 0, bottom: 0, width: width, height: height)
    rectangle(viewport: viewport, r: 0.2, g: 0.3, b: 0.4, a: 1)
    uistate.nrect = 2
    uistate.rect.0.left = 0
    uistate.rect.0.bottom = 0
    uistate.rect.0.width = width
    uistate.rect.0.height = height
    uistate.rect.1.left = 0
    uistate.rect.1.bottom = 0
    uistate.rect.1.width = ui0.width
    uistate.rect.1.height = height
    uistate.update(section: -1, item: -1, ui: ui0, context: context)
    ui0.render(state: uistate, context: context)
    context.overlay(
      font: .normal, gridpos: .bottomleft, viewport: viewport,
      overlay: "Drag-and-drop model file here", overlay2: "")
    context.render(viewport: viewport, scene: &scene)
  }
}
