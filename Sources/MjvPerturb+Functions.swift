import C_mujoco

extension MjvPerturb {
  @inlinable
  public mutating func movePerturb(
    model: MjModel, data: MjData, action: Int32, reldx: Double, reldy: Double, scene: MjvScene
  ) {
    var scene__scene = scene._scene
    mjv_movePerturb(model._model, data._data, action, reldx, reldy, &scene__scene, &self._perturb)
  }
  @inlinable
  public mutating func initPerturb(model: MjModel, data: MjData, scene: MjvScene) {
    var scene__scene = scene._scene
    mjv_initPerturb(model._model, data._data, &scene__scene, &self._perturb)
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
