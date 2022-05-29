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

}
