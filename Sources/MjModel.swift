import C_mujoco
import Foundation

public enum MjError: Error {
  case xml(String?)
  case actuator(String?)
}

public struct MjModel {

  @usableFromInline
  let _storage: Storage
  @inlinable
  var _model: UnsafeMutablePointer<mjModel> { _storage._model }

  @usableFromInline
  final class Storage {
    @usableFromInline
    let _model: UnsafeMutablePointer<mjModel>

    init(model: UnsafeMutablePointer<mjModel>) {
      _model = model
    }

    deinit {
      mj_deleteModel(_model)
    }
  }

  @usableFromInline
  init(model: UnsafeMutablePointer<mjModel>) {
    _storage = Storage(model: model)
  }

  public init?(fromBinaryPath filePath: String, vfs: MjVFS? = nil) {
    guard let model = mj_loadModel(filePath, vfs?._vfs) else {
      return nil
    }
    self.init(model: model)
  }

  public init(fromXMLPath filePath: String, vfs: MjVFS? = nil) throws {
    let errorStr = UnsafeMutablePointer<CChar>.allocate(capacity: 256)
    guard let model = mj_loadXML(filePath, vfs?._vfs, errorStr, 256) else {
      let error = MjError.xml(String(cString: errorStr, encoding: .utf8))
      errorStr.deallocate()
      throw error
    }
    errorStr.deallocate()
    self.init(model: model)
  }

  public init(fromXML: String, assets: [String: Data]? = nil) throws {
    var xmlString = fromXML
    let errorStr = UnsafeMutablePointer<CChar>.allocate(capacity: 256)
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
      let model = mj_loadXML("model_.xml", vfs._vfs, errorStr, 256)
      return model
    }
    guard let model = model else {
      let error = MjError.xml(String(cString: errorStr, encoding: .utf8))
      errorStr.deallocate()
      throw error
    }
    errorStr.deallocate()
    self.init(model: model)
  }
}

// Name the same, but implemented manually.
extension MjModel {
  @inlinable
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
  public func setLengthRange(data: inout MjData, index: Int32, opt: MjLROpt) throws {
    var opt__lropt = opt._lropt
    let errorStr = UnsafeMutablePointer<CChar>.allocate(capacity: 256)
    guard 1 == mj_setLengthRange(_model, data._data, index, &opt__lropt, errorStr, 256) else {
      let error = MjError.actuator(String(cString: errorStr, encoding: .utf8))
      errorStr.deallocate()
      throw error
    }
    errorStr.deallocate()
  }
  @inlinable
  public func saveLastXML(filename: String) throws {
    let errorStr = UnsafeMutablePointer<CChar>.allocate(capacity: 256)
    guard 1 == mj_saveLastXML(filename, _model, errorStr, 256) else {
      let error = MjError.xml(String(cString: errorStr, encoding: .utf8))
      errorStr.deallocate()
      throw error
    }
    errorStr.deallocate()
  }
}

// Different name.
extension MjModel {
  @inlinable
  public func copied() -> MjModel {
    return MjModel(model: mj_copyModel(nil, _model))
  }
  @inlinable
  public mutating func copy(from src: MjModel) {
    // Don't need to know the return value, it is the same as the _model.
    mj_copyModel(_model, src._model)
  }
  @inlinable
  public func write(to filePath: String) {
    mj_saveModel(_model, filePath, nil, 0)
  }
  @inlinable
  public func toMemoryBuffer() -> UnsafeMutableRawBufferPointer {
    let buffer = UnsafeMutableRawBufferPointer.allocate(
      byteCount: Int(mj_sizeModel(_model)), alignment: 4)
    mj_saveModel(_model, nil, buffer.baseAddress, Int32(buffer.count))
    return buffer
  }
}
