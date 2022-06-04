import C_mujoco

extension MjvScene {
  ///  Transform pose from room to model space.
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
  ///  Transform pose from model to room space.
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
  ///  Get camera info in model space; average left and right OpenGL cameras.
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
  ///  Get camera info in room space; average left and right OpenGL cameras.
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
  ///  Get frustum height at unit distance from camera; average left and right OpenGL cameras.
  @inlinable
  public func frustumHeight() -> Double {
    return mjv_frustumHeight(self._scene)
  }
  ///  Move model with mouse; action is mjtMouse.
  @inlinable
  public mutating func move(
    model: MjModel, action: MjtMouse, reldx: Double, reldy: Double, roomup: MjDoubleBufferPointer
  ) {
    precondition(roomup.count == 3)
    roomup.withUnsafeBufferPointer { roomup__p in
      mjv_moveModel(model._model, action.rawValue, reldx, reldy, roomup__p.baseAddress, self._scene)
    }
  }
  ///  Select geom or skin with mouse, return bodyid; -1: none selected.
  @inlinable
  public func select<
    T0: MjDoubleMutableBufferPointer, T1: MjInt32MutableBufferPointer,
    T2: MjInt32MutableBufferPointer
  >(
    model: MjModel, data: MjData, vopt: MjvOption, aspectratio: Double, relx: Double, rely: Double,
    selpnt: inout T0, geomid: inout T1,
    skinid: inout T2
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
  ///  Allocate resources in abstract scene.
  @inlinable
  public mutating func makeScene(model: MjModel, maxgeom: Int32) {
    mjv_makeScene(model._model, self._scene, maxgeom)
  }
  ///  Add geoms from selected categories. catmask is mjtCatBit.
  @inlinable
  public mutating func addGeoms(
    model: MjModel, data: inout MjData, option: MjvOption, perturb: MjvPerturb, catmask: MjtCatBit
  ) {
    var option__option = option._option
    var perturb__perturb = perturb._perturb
    mjv_addGeoms(
      model._model, data._data, &option__option, &perturb__perturb, catmask.rawValue, self._scene)
  }
  ///  Make list of lights.
  @inlinable
  public mutating func makeLights(model: MjModel, data: inout MjData) {
    mjv_makeLights(model._model, data._data, self._scene)
  }
  ///  Update camera.
  @inlinable
  public mutating func updateCamera(model: MjModel, data: inout MjData, camera: inout MjvCamera) {
    mjv_updateCamera(model._model, data._data, &camera._camera, self._scene)
  }
  ///  Update skins.
  @inlinable
  public mutating func updateSkin(model: MjModel, data: inout MjData) {
    mjv_updateSkin(model._model, data._data, self._scene)
  }
}
