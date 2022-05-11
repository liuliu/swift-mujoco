import C_mujoco

public final class MjModel {
  let _model: UnsafeMutablePointer<mjModel>

  init(model: UnsafeMutablePointer<mjModel>) {
    _model = model
  }

  deinit {
    mj_deleteModel(_model)
  }

  public convenience init?(fromBinaryPath filePath: String) {
    guard let model = mj_loadModel(filePath, nil) else {
      return nil
    }
    self.init(model: model)
  }

  public convenience init?(fromXMLPath filePath: String) {
    guard let model = mj_loadXML(filePath, nil, nil, 0) else {
      return nil
    }
    self.init(model: model)
  }

  public func makeData() -> MjData {
    let data = mj_makeData(_model)!
    return MjData(data: data, nq: _model.pointee.nq, nv: _model.pointee.nv, na: _model.pointee.na, nu: _model.pointee.nu, nbody: _model.pointee.nbody, nmocap: _model.pointee.nmocap, nuserdata: _model.pointee.nuserdata, nsensordata: _model.pointee.nsensordata)
  }

  public func step(data: MjData) {
    mj_step(_model, data._data)
  }

  public func step1(data: MjData) {
    mj_step1(_model, data._data)
  }

  public func step2(data: MjData) {
    mj_step2(_model, data._data)
  }

  public func forward(data: MjData) {
    mj_forward(_model, data._data)
  }

  public func inverse(data: MjData) {
    mj_inverse(_model, data._data)
  }

  public func forwardSkip(data: MjData, skipStage: Int32, skipSensor: Int32) {
    mj_forwardSkip(_model, data._data, skipStage, skipSensor)
  }

  public func inverseSkip(data: MjData, skipStage: Int32, skipSensor: Int32) {
    mj_inverseSkip(_model, data._data, skipStage, skipSensor)
  }

  public func reset(data: MjData) {
    mj_resetData(_model, data._data)
  }

  public func reset(data: MjData, keyframe: Int32) {
    mj_resetDataKeyframe(_model, data._data, keyframe)
  }

  // Initial State.
  var qpos0: MjNumArray {
    get {
      MjNumArray(array: _model.pointee.qpos0, object: self, len: _model.pointee.nq)
    }
    set {
      guard _model.pointee.qpos0 != newValue._array else { return }
      _model.pointee.qpos0.assign(from: newValue._array, count: Int(_model.pointee.nq))
    }
  }

  var qpos_spring: MjNumArray {
    get {
      MjNumArray(array: _model.pointee.qpos_spring, object: self, len: _model.pointee.nq)
    }
    set {
      guard _model.pointee.qpos_spring != newValue._array else { return }
      _model.pointee.qpos_spring.assign(from: newValue._array, count: Int(_model.pointee.nq))
    }
  }
}
