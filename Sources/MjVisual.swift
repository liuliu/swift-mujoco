import C_mujoco

public struct MjVisual {
  @usableFromInline
  var _visual: mjVisual
  public init() {
    _visual = mjVisual()
    mj_defaultVisual(&_visual)
  }
}