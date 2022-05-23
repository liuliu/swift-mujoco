import C_mujoco

public final class MjData {
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

  init(
    data: UnsafeMutablePointer<mjData>, nq: Int32, nv: Int32, na: Int32, nu: Int32, nbody: Int32,
    nmocap: Int32, nuserdata: Int32, nsensordata: Int32, njnt: Int32, ngeom: Int32, nsite: Int32,
    ncam: Int32, nlight: Int32, ntendon: Int32, nwrap: Int32, nM: Int32, nconmax: Int32,
    njmax: Int32, nD: Int32
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
  }

  deinit {
    mj_deleteData(_data)
  }
}
