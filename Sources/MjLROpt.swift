import C_mujoco

/// options for mj_setLengthRange()
public struct MjLROpt {
  @usableFromInline
  var _lropt: mjLROpt
  public init() {
    _lropt = mjLROpt()
    mj_defaultLROpt(&_lropt)
  }
}
