import C_mujoco

/// object selection and perturbation
///
/// This is the data structure holding information about mouse perturbations.
public struct MjvPerturb {
  @usableFromInline
  var _perturb: mjvPerturb
  public init() {
    _perturb = mjvPerturb()
    mjv_defaultPerturb(&_perturb)
  }
}
