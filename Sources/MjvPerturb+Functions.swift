import C_mujoco

extension MjvPerturb {
  ///  Move perturb object with mouse; action is mjtMouse.
  @inlinable
  public mutating func movePerturb(
    model: MjModel, data: MjData, action: MjtMouse, reldx: Double, reldy: Double, scene: MjvScene
  ) {
    mjv_movePerturb(
      model._model, data._data, action.rawValue, reldx, reldy, scene._scene, &self._perturb)
  }
  ///  Copy perturb pos,quat from selected body; set scale for perturbation.
  @inlinable
  public mutating func initPerturb(model: MjModel, data: MjData, scene: MjvScene) {
    mjv_initPerturb(model._model, data._data, scene._scene, &self._perturb)
  }
  /// Set perturb pos,quat in d->mocap when selected body is mocap, and in d->qpos otherwise. Write d->qpos only if flg_paused and subtree root for selected body has free joint.
  @inlinable
  public func applyPerturbPose(model: MjModel, data: inout MjData, flgPaused: Int32) {
    var __perturb = self._perturb
    mjv_applyPerturbPose(model._model, data._data, &__perturb, flgPaused)
  }
  ///  Set perturb force,torque in d->xfrc_applied, if selected body is dynamic.
  @inlinable
  public func applyPerturbForce(model: MjModel, data: inout MjData) {
    var __perturb = self._perturb
    mjv_applyPerturbForce(model._model, data._data, &__perturb)
  }
}
