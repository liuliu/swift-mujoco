import C_mujoco

extension MjvCamera {
  @inlinable
  public mutating func moveCamera(
    model: MjModel, action: Int32, reldx: Double, reldy: Double, scene: MjvScene
  ) {
    mjv_moveCamera(model._model, action, reldx, reldy, scene._scene, &self._camera)
  }
}
