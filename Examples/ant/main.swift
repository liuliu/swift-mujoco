import Mujoco

let model = MjModel(fromXMLPath: "Examples/assets/ant.xml")!
let data = model.makeData()
model.step(data: data)

