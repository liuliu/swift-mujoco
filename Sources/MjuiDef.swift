import C_mujoco

public struct MjuiDef {
  @usableFromInline
  var _def: mjuiDef_
  init() {
    _def = mjuiDef_()
  }
  public init(_ type: MjtItem, name: String, state: Int32, other: String) {
    self.init()
    self.type = type
    self.name = name
    self.state = state
    self.other = other
  }
}
