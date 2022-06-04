import C_mujoco

/// visualization options
///
/// This is the data structure with abstract visualization options. It corresponds to the MJCF element visual. One instance of it is embedded in mjModel.
public struct MjVisual {
  @usableFromInline
  var _visual: mjVisual
  public init() {
    _visual = mjVisual()
    mj_defaultVisual(&_visual)
  }
  @usableFromInline
  init(_ visual: mjVisual) {
    _visual = visual
  }
}
