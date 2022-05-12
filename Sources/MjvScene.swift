import C_mujoco

public final class MjvScene {
  @usableFromInline
  var _scene: mjvScene
  public init(model: MjModel, maxgeom: Int32) {
    _scene = mjvScene()
    mjv_defaultScene(&_scene)
    mjv_makeScene(model._model, &_scene, maxgeom)
  }
  deinit {
    mjv_freeScene(&_scene)
  }
  @inlinable
  public func update(model: MjModel, data: MjData, option: MjvOption, perturb: MjvPerturb?, camera: inout MjvCamera, catmask: MjCatBit = .all) {
    var _option = option
    guard var _perturb = perturb else {
      mjv_updateScene(model._model, data._data, &_option._option, nil, &camera._camera, catmask.rawValue, &_scene)
      return
    }
    mjv_updateScene(model._model, data._data, &_option._option, &_perturb._perturb, &camera._camera, catmask.rawValue, &_scene)
  }
}
