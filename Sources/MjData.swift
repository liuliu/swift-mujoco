import C_mujoco

/// Protocolize internal storage for MjData. Internal use only.
public protocol MjDataStorage: AnyObject {
  var _data: UnsafeMutablePointer<mjData> { get }
  var nq: Int32 { get }
  var nv: Int32 { get }
  var na: Int32 { get }
  var nu: Int32 { get }
  var nbody: Int32 { get }
  var nmocap: Int32 { get }
  var nuserdata: Int32 { get }
  var nsensordata: Int32 { get }
  var njnt: Int32 { get }
  var ngeom: Int32 { get }
  var nsite: Int32 { get }
  var ncam: Int32 { get }
  var nlight: Int32 { get }
  var ntendon: Int32 { get }
  var nwrap: Int32 { get }
  var nM: Int32 { get }
  var nconmax: Int32 { get }
  var njmax: Int32 { get }
  var nD: Int32 { get }
  var npluginstate: Int32 { get }
}

/// This is the main data structure holding the simulation state. It is the workspace where all functions read their modifiable inputs and write their outputs.
public struct MjData {

  @usableFromInline
  let _storage: MjDataStorage

  @inlinable
  var _data: UnsafeMutablePointer<mjData> { _storage._data }
  @inlinable
  var nq: Int32 { _storage.nq }
  @inlinable
  var nv: Int32 { _storage.nv }
  @inlinable
  var na: Int32 { _storage.na }
  @inlinable
  var nu: Int32 { _storage.nu }
  @inlinable
  var nbody: Int32 { _storage.nbody }
  @inlinable
  var nmocap: Int32 { _storage.nmocap }
  @inlinable
  var nuserdata: Int32 { _storage.nuserdata }
  @inlinable
  var nsensordata: Int32 { _storage.nsensordata }
  @inlinable
  var njnt: Int32 { _storage.njnt }
  @inlinable
  var ngeom: Int32 { _storage.ngeom }
  @inlinable
  var nsite: Int32 { _storage.nsite }
  @inlinable
  var ncam: Int32 { _storage.ncam }
  @inlinable
  var nlight: Int32 { _storage.nlight }
  @inlinable
  var ntendon: Int32 { _storage.ntendon }
  @inlinable
  var nwrap: Int32 { _storage.nwrap }
  @inlinable
  var nM: Int32 { _storage.nM }
  @inlinable
  var nconmax: Int32 { _storage.nconmax }
  @inlinable
  var njmax: Int32 { _storage.njmax }
  @inlinable
  var nD: Int32 { _storage.nD }
  @inlinable
  var npluginstate: Int32 { _storage.npluginstate }

  @usableFromInline
  init(
    data: UnsafeMutablePointer<mjData>, nq: Int32, nv: Int32, na: Int32, nu: Int32, nbody: Int32,
    nmocap: Int32, nuserdata: Int32, nsensordata: Int32, njnt: Int32, ngeom: Int32, nsite: Int32,
    ncam: Int32, nlight: Int32, ntendon: Int32, nwrap: Int32, nM: Int32, nconmax: Int32,
    njmax: Int32, nD: Int32, npluginstate: Int32
  ) {
    _storage = Storage(
      data: data, nq: nq, nv: nv, na: na, nu: nu, nbody: nbody, nmocap: nmocap,
      nuserdata: nuserdata, nsensordata: nsensordata, njnt: njnt, ngeom: ngeom, nsite: nsite,
      ncam: ncam, nlight: nlight, ntendon: ntendon, nwrap: nwrap, nM: nM, nconmax: nconmax,
      njmax: njmax, nD: nD, npluginstate: npluginstate)
  }

  @usableFromInline
  init(
    staticData: UnsafeMutablePointer<mjData>, nq: Int32, nv: Int32, na: Int32, nu: Int32,
    nbody: Int32,
    nmocap: Int32, nuserdata: Int32, nsensordata: Int32, njnt: Int32, ngeom: Int32, nsite: Int32,
    ncam: Int32, nlight: Int32, ntendon: Int32, nwrap: Int32, nM: Int32, nconmax: Int32,
    njmax: Int32, nD: Int32, npluginstate: Int32
  ) {
    _storage = StaticStorage(
      data: staticData, nq: nq, nv: nv, na: na, nu: nu, nbody: nbody, nmocap: nmocap,
      nuserdata: nuserdata, nsensordata: nsensordata, njnt: njnt, ngeom: ngeom, nsite: nsite,
      ncam: ncam, nlight: nlight, ntendon: ntendon, nwrap: nwrap, nM: nM, nconmax: nconmax,
      njmax: njmax, nD: nD, npluginstate: npluginstate)
  }

  @usableFromInline
  final class StaticStorage: MjDataStorage {
    @usableFromInline
    let _data: UnsafeMutablePointer<mjData>
    @usableFromInline
    let nq: Int32
    @usableFromInline
    let nv: Int32
    @usableFromInline
    let na: Int32
    @usableFromInline
    let nu: Int32
    @usableFromInline
    let nbody: Int32
    @usableFromInline
    let nmocap: Int32
    @usableFromInline
    let nuserdata: Int32
    @usableFromInline
    let nsensordata: Int32
    @usableFromInline
    let njnt: Int32
    @usableFromInline
    let ngeom: Int32
    @usableFromInline
    let nsite: Int32
    @usableFromInline
    let ncam: Int32
    @usableFromInline
    let nlight: Int32
    @usableFromInline
    let ntendon: Int32
    @usableFromInline
    let nwrap: Int32
    @usableFromInline
    let nM: Int32
    @usableFromInline
    let nconmax: Int32
    @usableFromInline
    let njmax: Int32
    @usableFromInline
    let nD: Int32
    @usableFromInline
    let npluginstate: Int32

    init(
      data: UnsafeMutablePointer<mjData>, nq: Int32, nv: Int32, na: Int32, nu: Int32, nbody: Int32,
      nmocap: Int32, nuserdata: Int32, nsensordata: Int32, njnt: Int32, ngeom: Int32, nsite: Int32,
      ncam: Int32, nlight: Int32, ntendon: Int32, nwrap: Int32, nM: Int32, nconmax: Int32,
      njmax: Int32, nD: Int32, npluginstate: Int32
    ) {
      _data = data
      self.nq = nq
      self.nv = nv
      self.na = na
      self.nu = nu
      self.nbody = nbody
      self.nmocap = nmocap
      self.nuserdata = nuserdata
      self.nsensordata = nsensordata
      self.njnt = njnt
      self.ngeom = ngeom
      self.nsite = nsite
      self.ncam = ncam
      self.nlight = nlight
      self.ntendon = ntendon
      self.nwrap = nwrap
      self.nM = nM
      self.nconmax = nconmax
      self.njmax = njmax
      self.nD = nD
      self.npluginstate = npluginstate
    }
  }

  @usableFromInline
  final class Storage: MjDataStorage {
    @usableFromInline
    let _data: UnsafeMutablePointer<mjData>
    @usableFromInline
    let nq: Int32
    @usableFromInline
    let nv: Int32
    @usableFromInline
    let na: Int32
    @usableFromInline
    let nu: Int32
    @usableFromInline
    let nbody: Int32
    @usableFromInline
    let nmocap: Int32
    @usableFromInline
    let nuserdata: Int32
    @usableFromInline
    let nsensordata: Int32
    @usableFromInline
    let njnt: Int32
    @usableFromInline
    let ngeom: Int32
    @usableFromInline
    let nsite: Int32
    @usableFromInline
    let ncam: Int32
    @usableFromInline
    let nlight: Int32
    @usableFromInline
    let ntendon: Int32
    @usableFromInline
    let nwrap: Int32
    @usableFromInline
    let nM: Int32
    @usableFromInline
    let nconmax: Int32
    @usableFromInline
    let njmax: Int32
    @usableFromInline
    let nD: Int32
    @usableFromInline
    let npluginstate: Int32

    init(
      data: UnsafeMutablePointer<mjData>, nq: Int32, nv: Int32, na: Int32, nu: Int32, nbody: Int32,
      nmocap: Int32, nuserdata: Int32, nsensordata: Int32, njnt: Int32, ngeom: Int32, nsite: Int32,
      ncam: Int32, nlight: Int32, ntendon: Int32, nwrap: Int32, nM: Int32, nconmax: Int32,
      njmax: Int32, nD: Int32, npluginstate: Int32
    ) {
      _data = data
      self.nq = nq
      self.nv = nv
      self.na = na
      self.nu = nu
      self.nbody = nbody
      self.nmocap = nmocap
      self.nuserdata = nuserdata
      self.nsensordata = nsensordata
      self.njnt = njnt
      self.ngeom = ngeom
      self.nsite = nsite
      self.ncam = ncam
      self.nlight = nlight
      self.ntendon = ntendon
      self.nwrap = nwrap
      self.nM = nM
      self.nconmax = nconmax
      self.njmax = njmax
      self.nD = nD
      self.npluginstate = npluginstate
    }

    deinit {
      mj_deleteData(_data)
    }
  }
}

// Name the same, but implemented manually.
extension MjData {
  /// Allocate array of specified size on mjData stack. Call mju_error on stack overflow.
  @inlinable
  public func stackAlloc(size: Int32) -> MjArray<Double> {
    return MjArray(array: mj_stackAlloc(self._data, size), object: _storage, len: size)
  }
}

// Different name.
extension MjData {
  /// Copy mjData. m is only required to contain the size fields from MJMODEL_INTS.
  @inlinable
  public func copied(model: MjModel) -> MjData {
    return MjData(
      data: mj_copyData(nil, model._model, _data), nq: nq, nv: nv, na: na, nu: nu, nbody: nbody,
      nmocap: nmocap, nuserdata: nuserdata, nsensordata: nsensordata, njnt: njnt, ngeom: ngeom,
      nsite: nsite, ncam: ncam, nlight: nlight, ntendon: ntendon, nwrap: nwrap, nM: nM,
      nconmax: nconmax, njmax: njmax, nD: nD, npluginstate: npluginstate)
  }
  /// Copy mjData. m is only required to contain the size fields from MJMODEL_INTS.
  @inlinable
  public mutating func copy(from src: MjData, model: MjModel) {
    // Don't need to know the return value, it is the same as the _model.
    mj_copyData(_data, model._model, src._data)
  }
}
