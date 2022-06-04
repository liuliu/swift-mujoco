import C_mujoco

/// abstract visualization options
///
/// This structure contains options that enable and disable the visualization of various elements.
public struct MjvOption {
  @usableFromInline
  var _option: mjvOption
  public init() {
    _option = mjvOption()
    mjv_defaultOption(&_option)
  }
}
