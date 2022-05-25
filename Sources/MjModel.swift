import C_mujoco
import Foundation

public final class MjModel {
  @usableFromInline
  let _model: UnsafeMutablePointer<mjModel>

  init(model: UnsafeMutablePointer<mjModel>) {
    _model = model
  }

  deinit {
    mj_deleteModel(_model)
  }

  public convenience init?(fromBinaryPath filePath: String, vfs: MjVFS? = nil) {
    guard let model = mj_loadModel(filePath, vfs?._vfs) else {
      return nil
    }
    self.init(model: model)
  }

  public convenience init?(fromXMLPath filePath: String, vfs: MjVFS? = nil) {
    let error = UnsafeMutablePointer<CChar>.allocate(capacity: 1024)
    guard let model = mj_loadXML(filePath, vfs?._vfs, error, 1024) else {
      Swift.print(error)
      error.deallocate()
      return nil
    }
    error.deallocate()
    self.init(model: model)
  }

  public convenience init?(fromXML: String, assets: [String: Data]? = nil) {
    var xmlString = fromXML
    let error = UnsafeMutablePointer<CChar>.allocate(capacity: 1024)
    let model: UnsafeMutablePointer<mjModel>? = xmlString.withUTF8 { utf8 in
      let vfs = assets.flatMap { MjVFS(assets: $0) } ?? MjVFS()
      // Avoid name duplication.
      var modelName = "model_"
      while assets?[modelName + ".xml"] != nil {
        modelName += "_"
      }
      vfs.makeEmptyFile(filename: "\(modelName).xml", filesize: Int32(utf8.count))
      vfs.filedata[Int(vfs.nfile - 1)]?.assumingMemoryBound(to: UInt8.self).assign(
        from: utf8.baseAddress!, count: utf8.count)
      let model = mj_loadXML("model_.xml", vfs._vfs, error, 1024)
      return model
    }
    guard let model = model else {
      Swift.print(error)
      error.deallocate()
      return nil
    }
    error.deallocate()
    self.init(model: model)
  }

  public func makeData() -> MjData {
    let data = mj_makeData(_model)!
    return MjData(
      data: data, nq: _model.pointee.nq, nv: _model.pointee.nv, na: _model.pointee.na,
      nu: _model.pointee.nu, nbody: _model.pointee.nbody, nmocap: _model.pointee.nmocap,
      nuserdata: _model.pointee.nuserdata, nsensordata: _model.pointee.nsensordata,
      njnt: _model.pointee.njnt, ngeom: _model.pointee.ngeom, nsite: _model.pointee.nsite,
      ncam: _model.pointee.ncam, nlight: _model.pointee.nlight, ntendon: _model.pointee.ntendon,
      nwrap: _model.pointee.nwrap, nM: _model.pointee.nM, nconmax: _model.pointee.nconmax,
      njmax: _model.pointee.njmax, nD: _model.pointee.nD)
  }

  @inlinable
  public func step(data: MjData) {
    mj_step(_model, data._data)
  }

  @inlinable
  public func step1(data: MjData) {
    mj_step1(_model, data._data)
  }

  @inlinable
  public func step2(data: MjData) {
    mj_step2(_model, data._data)
  }

  @inlinable
  public func forward(data: MjData) {
    mj_forward(_model, data._data)
  }

  @inlinable
  public func inverse(data: MjData) {
    mj_inverse(_model, data._data)
  }

  @inlinable
  public func forwardSkip(data: MjData, skipStage: Int32, skipSensor: Int32) {
    mj_forwardSkip(_model, data._data, skipStage, skipSensor)
  }

  @inlinable
  public func inverseSkip(data: MjData, skipStage: Int32, skipSensor: Int32) {
    mj_inverseSkip(_model, data._data, skipStage, skipSensor)
  }

  @inlinable
  public func reset(data: MjData) {
    mj_resetData(_model, data._data)
  }

  @inlinable
  public func reset(data: MjData, keyframe: Int32) {
    mj_resetDataKeyframe(_model, data._data, keyframe)
  }
}
