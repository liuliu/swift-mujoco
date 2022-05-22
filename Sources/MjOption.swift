import C_mujoco

public struct MjOption {
  @usableFromInline
  var _option: mjOption
  public init() {
    _option = mjOption()
    mj_defaultOption(&_option)
  }
  @usableFromInline
  init(_ option: mjOption) {
    _option = option
  }
}
