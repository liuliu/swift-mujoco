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

glContext.makeCurrent {
  var scene = MjvScene(model: nil, maxgeom: 1000)
  // The context need to be initialized after having a GL context.
  let context = MjrContext(model: nil, fontScale: ._100)
  glContext.runLoop(swapInterval: 1) { width, height in
    let viewport = MjrRect(left: 0, bottom: 0, width: width, height: height)
    rectangle(viewport: viewport, r: 0.2, g: 0.3, b: 0.4, a: 1)
    context.overlay(
      font: .normal, gridpos: .bottomleft, viewport: viewport,
      overlay: "Drag-and-drop model file here", overlay2: "")
    context.render(viewport: viewport, scene: &scene)
  }
}
