import C_mujoco

/// physics options
///
/// This is the data structure with simulation options. It corresponds to the MJCF element option. One instance of it is embedded in mjModel.
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
