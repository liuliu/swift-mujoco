import C_mujoco

public struct MjLROpt {
  @usableFromInline
  var _lropt: mjLROpt
  public init() {
    _lropt = mjLROpt()
    mj_defaultLROpt(&_lropt)
  }
}
