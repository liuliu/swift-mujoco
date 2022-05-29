import C_mujoco

extension MjvPerturb {
  @inlinable
  public mutating func movePerturb(
    model: MjModel, data: MjData, action: MjtMouse, reldx: Double, reldy: Double, scene: MjvScene
  ) {
    mjv_movePerturb(
      model._model, data._data, action.rawValue, reldx, reldy, scene._scene, &self._perturb)
  }
  @inlinable
  public mutating func initPerturb(model: MjModel, data: MjData, scene: MjvScene) {
    mjv_initPerturb(model._model, data._data, scene._scene, &self._perturb)
  }
  @inlinable
  public func applyPerturbPose(model: MjModel, data: inout MjData, flgPaused: Int32) {
    var __perturb = self._perturb
    mjv_applyPerturbPose(model._model, data._data, &__perturb, flgPaused)
  }
  @inlinable
  public func applyPerturbForce(model: MjModel, data: inout MjData) {
    var __perturb = self._perturb
    mjv_applyPerturbForce(model._model, data._data, &__perturb)
  }
}
