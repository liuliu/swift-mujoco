import MuJoCo

let model = MjModel(fromXMLPath: "Examples/assets/ant.xml")!
var data = model.makeData()

let glContext = GLContext(width: 1280, height: 720, title: "demo")

glContext.makeCurrent {
  var camera = MjvCamera()
  let option = MjvOption()
  var scene = MjvScene(model: model, maxgeom: 1000)
  // The context need to be initialized after having a GL context.
  let context = MjrContext(model: model, fontScale: ._100)
  glContext.runLoop(swapInterval: 1) { width, height in
    let simstart = data.time
    while data.time - simstart < 1.0 / 60.0 {
      model.step(data: &data)
    }
    let viewport = MjrRect(left: 0, bottom: 0, width: width, height: height)
    scene.update(model: model, data: data, option: option, perturb: nil, camera: &camera)
    context.render(viewport: viewport, scene: &scene)
  }
}
