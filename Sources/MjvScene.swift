import C_mujoco

public struct MjvScene {
  @usableFromInline
  let _storage: Storage
  @inlinable
  var _scene: UnsafeMutablePointer<mjvScene> {
    withUnsafeMutablePointer(to: &_storage._scene) { $0 }
  }

  @usableFromInline
  final class Storage {
    @usableFromInline
    var _scene: mjvScene
    init(model: MjModel, maxgeom: Int32) {
      _scene = mjvScene()
      mjv_defaultScene(&_scene)
      mjv_makeScene(model._model, &_scene, maxgeom)
    }
    deinit {
      mjv_freeScene(&_scene)
    }
  }

  public init(model: MjModel, maxgeom: Int32) {
    _storage = Storage(model: model, maxgeom: maxgeom)
  }

  @inlinable
  public func updateScene(
    model: MjModel, data: inout MjData, option: MjvOption, perturb: MjvPerturb?,
    camera: inout MjvCamera, catmask: MjtCatBit = .all
  ) {
    var _option = option
    guard var _perturb = perturb else {
      mjv_updateScene(
        model._model, data._data, &_option._option, nil, &camera._camera, catmask.rawValue, _scene)
      return
    }
    mjv_updateScene(
      model._model, data._data, &_option._option, &_perturb._perturb, &camera._camera,
      catmask.rawValue, _scene)
  }
}
