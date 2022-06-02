import Dispatch
import MuJoCo

struct Settings {
  var exitrequest: Int32
  var spacing: Int32
  var color: Int32
  var font: Int32
  var ui0: Bool
  var ui1: Bool
  var loadrequest: Int32
}

let glContext = GLContext(width: 1280, height: 720, title: "simulate")

// We will run this function off main thread on a default global queue.
func simulate() {
}

glContext.makeCurrent {
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
