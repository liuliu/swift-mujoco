import C_mujoco

public struct MjvOption {
  @usableFromInline
  var _option: mjvOption
  public init() {
    _option = mjvOption()
    mjv_defaultOption(&_option)
  }
}
