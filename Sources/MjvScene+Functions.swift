import C_mujoco

extension MjvScene {
  @inlinable
  public func room2model(
    modelpos: inout MjDoubleMutableBufferPointer, modelquat: inout MjDoubleMutableBufferPointer,
    roompos: MjDoubleBufferPointer, roomquat: MjDoubleBufferPointer
  ) {
    precondition(modelpos.count == 3)
    modelpos.withUnsafeMutableBufferPointer { modelpos__p in
      precondition(modelquat.count == 4)
      modelquat.withUnsafeMutableBufferPointer { modelquat__p in
        precondition(roompos.count == 3)
        roompos.withUnsafeBufferPointer { roompos__p in
          precondition(roomquat.count == 4)
          roomquat.withUnsafeBufferPointer { roomquat__p in
            mjv_room2model(
              modelpos__p.baseAddress, modelquat__p.baseAddress, roompos__p.baseAddress,
              roomquat__p.baseAddress, self._scene)
          }
        }
      }
    }
  }
  @inlinable
  public func model2room(
    roompos: inout MjDoubleMutableBufferPointer, roomquat: inout MjDoubleMutableBufferPointer,
    modelpos: MjDoubleBufferPointer, modelquat: MjDoubleBufferPointer
  ) {
    precondition(roompos.count == 3)
    roompos.withUnsafeMutableBufferPointer { roompos__p in
      precondition(roomquat.count == 4)
      roomquat.withUnsafeMutableBufferPointer { roomquat__p in
        precondition(modelpos.count == 3)
        modelpos.withUnsafeBufferPointer { modelpos__p in
          precondition(modelquat.count == 4)
          modelquat.withUnsafeBufferPointer { modelquat__p in
            mjv_model2room(
              roompos__p.baseAddress, roomquat__p.baseAddress, modelpos__p.baseAddress,
              modelquat__p.baseAddress, self._scene)
          }
        }
      }
    }
  }
  @inlinable
  public func cameraInModel(
    headpos: inout MjDoubleMutableBufferPointer, forward: inout MjDoubleMutableBufferPointer,
    up: inout MjDoubleMutableBufferPointer
  ) {
    precondition(headpos.count == 3)
    headpos.withUnsafeMutableBufferPointer { headpos__p in
      precondition(forward.count == 3)
      forward.withUnsafeMutableBufferPointer { forward__p in
        precondition(up.count == 3)
        up.withUnsafeMutableBufferPointer { up__p in
          mjv_cameraInModel(
            headpos__p.baseAddress, forward__p.baseAddress, up__p.baseAddress, self._scene)
        }
      }
    }
  }
  @inlinable
  public func cameraInRoom(
    headpos: inout MjDoubleMutableBufferPointer, forward: inout MjDoubleMutableBufferPointer,
    up: inout MjDoubleMutableBufferPointer
  ) {
    precondition(headpos.count == 3)
    headpos.withUnsafeMutableBufferPointer { headpos__p in
      precondition(forward.count == 3)
      forward.withUnsafeMutableBufferPointer { forward__p in
        precondition(up.count == 3)
        up.withUnsafeMutableBufferPointer { up__p in
          mjv_cameraInRoom(
            headpos__p.baseAddress, forward__p.baseAddress, up__p.baseAddress, self._scene)
        }
      }
    }
  }
  @inlinable
  public func frustumHeight() -> Double {
    return mjv_frustumHeight(self._scene)
  }
  @inlinable
  public func move(
    model: MjModel, action: Int32, reldx: Double, reldy: Double, roomup: MjDoubleBufferPointer
  ) {
    precondition(roomup.count == 3)
    roomup.withUnsafeBufferPointer { roomup__p in
      mjv_moveModel(model._model, action, reldx, reldy, roomup__p.baseAddress, self._scene)
    }
  }
  @inlinable
  public func select(
    model: MjModel, data: MjData, vopt: MjvOption, aspectratio: Double, relx: Double, rely: Double,
    selpnt: inout MjDoubleMutableBufferPointer, geomid: inout MjInt32MutableBufferPointer,
    skinid: inout MjInt32MutableBufferPointer
  ) -> Int32 {
    var vopt__option = vopt._option
    precondition(selpnt.count == 3)
    return selpnt.withUnsafeMutableBufferPointer { selpnt__p in
      precondition(geomid.count == 1)
      return geomid.withUnsafeMutableBufferPointer { geomid__p in
        precondition(skinid.count == 1)
        return skinid.withUnsafeMutableBufferPointer { skinid__p in
          return mjv_select(
            model._model, data._data, &vopt__option, aspectratio, relx, rely, self._scene,
            selpnt__p.baseAddress, geomid__p.baseAddress, skinid__p.baseAddress)
        }
      }
    }
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
