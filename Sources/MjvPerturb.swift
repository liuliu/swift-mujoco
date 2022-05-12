import C_mujoco

public struct MjvPerturb {
  @usableFromInline
  var _perturb: mjvPerturb
  public init() {
    _perturb = mjvPerturb()
    mjv_defaultPerturb(&_perturb)
  }
}
