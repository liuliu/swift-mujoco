import C_mujoco

extension MjvScene {
  @inlinable
  public func frustumHeight() {
    mjv_frustumHeight(&self._scene)
  }
  @inlinable
  public func makeLights(model: MjModel, data: MjData) {
    mjv_makeLights(model._model, data._data, &self._scene)
  }
  @inlinable
  public func updateSkin(model: MjModel, data: MjData) {
    mjv_updateSkin(model._model, data._data, &self._scene)
  }
}
