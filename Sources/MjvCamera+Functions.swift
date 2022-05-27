import C_mujoco

extension MjvCamera {
  @inlinable
  public mutating func moveCamera(
    model: MjModel, action: Int32, reldx: Double, reldy: Double, scene: MjvScene
  ) {
    var scene__scene = scene._scene
    mjv_moveCamera(model._model, action, reldx, reldy, &scene__scene, &self._camera)
  }
}
