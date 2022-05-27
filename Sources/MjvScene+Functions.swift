import C_mujoco

extension MjvScene {
  @inlinable
  public func frustumHeight() {
    mjv_frustumHeight(self._scene)
  }
  @inlinable
  public func updateScene(
    model: MjModel, data: inout MjData, opt: MjvOption, pert: MjvPerturb, cam: inout MjvCamera,
    catmask: Int32
  ) {
    var opt__option = opt._option
    var pert__perturb = pert._perturb
    mjv_updateScene(
      model._model, data._data, &opt__option, &pert__perturb, &cam._camera, catmask, self._scene)
  }
  @inlinable
  public func addGeoms(
    model: MjModel, data: inout MjData, opt: MjvOption, pert: MjvPerturb, catmask: Int32
  ) {
    var opt__option = opt._option
    var pert__perturb = pert._perturb
    mjv_addGeoms(model._model, data._data, &opt__option, &pert__perturb, catmask, self._scene)
  }
  @inlinable
  public func makeLights(model: MjModel, data: inout MjData) {
    mjv_makeLights(model._model, data._data, self._scene)
  }
  @inlinable
  public func updateCamera(model: MjModel, data: inout MjData, cam: inout MjvCamera) {
    mjv_updateCamera(model._model, data._data, &cam._camera, self._scene)
  }
  @inlinable
  public func updateSkin(model: MjModel, data: inout MjData) {
    mjv_updateSkin(model._model, data._data, self._scene)
  }
}
