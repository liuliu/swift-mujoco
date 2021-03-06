import C_mujoco

extension MjvCamera {
  ///  Move camera with mouse; action is mjtMouse.
  @inlinable
  public mutating func moveCamera(
    model: MjModel, action: MjtMouse, reldx: Double, reldy: Double, scene: MjvScene
  ) {
    mjv_moveCamera(model._model, action.rawValue, reldx, reldy, scene._scene, &self._camera)
  }
}
