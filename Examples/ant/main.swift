import Mujoco

let model = MjModel(fromXMLPath: "Examples/assets/ant.xml")!
let data = model.makeData()
print("ok")
let glContext = GLContext(width: 1280, height: 720, title: "demo")
print("try to make glcontext")
let context = MjrContext(model: model, fontScale: ._100)
print("can we make the context?")
var camera = MjvCamera()
let option = MjvOption()
let scene = MjvScene(model: model, maxgeom: 1000)
print("start")

glContext.makeCurrent {
  print("made current")
  glContext.runLoop(swapInterval: 1) { width, height in
  print("inside runloop")
    let simstart = data.time
    while data.time - simstart < 1.0 / 60.0 {
      model.step(data: data)
    }
    let viewport = MjrRect(left: 0, bottom: 0, width: width, height: height)
    scene.update(model: model, data: data, option: option, perturb: nil, camera: &camera)
    context.render(viewport: viewport, scene: scene)
  }
}

