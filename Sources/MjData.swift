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

  init(data: UnsafeMutablePointer<mjData>, nq: Int32, nv: Int32, na: Int32, nu: Int32, nbody: Int32, nmocap: Int32, nuserdata: Int32, nsensordata: Int32) {
    _data = data
    self.nq = nq
    self.nv = nv
    self.na = na
    self.nu = nu
    self.nbody = nbody
    self.nmocap = nmocap
    self.nuserdata = nuserdata
    self.nsensordata = nsensordata
  }

  deinit {
    mj_deleteData(_data)
  }

  @inlinable
  public var time: Double {
    get {
      _data.pointee.time
    }
    set {
      _data.pointee.time = newValue
    }
  }

  // State.
  @inlinable
  public var qpos: MjNumArray {
    get {
      MjNumArray(array: _data.pointee.qpos, object: self, len: nq)
    }
    set {
      guard _data.pointee.qpos != newValue._array else { return }
      _data.pointee.qpos.assign(from: newValue._array, count: Int(nq))
    }
  }

  @inlinable
  public var qvel: MjNumArray {
    get {
      MjNumArray(array: _data.pointee.qvel, object: self, len: nv)
    }
    set {
      guard _data.pointee.qvel != newValue._array else { return }
      _data.pointee.qvel.assign(from: newValue._array, count: Int(nv))
    }
  }

  @inlinable
  public var act: MjNumArray {
    get {
      MjNumArray(array: _data.pointee.act, object: self, len: na)
    }
    set {
      guard _data.pointee.act != newValue._array else { return }
      _data.pointee.act.assign(from: newValue._array, count: Int(na))
    }
  }

  @inlinable
  public var qaccWarmstart: MjNumArray {
    get {
      MjNumArray(array: _data.pointee.qacc_warmstart, object: self, len: nv)
    }
    set {
      guard _data.pointee.qacc_warmstart != newValue._array else { return }
      _data.pointee.qacc_warmstart.assign(from: newValue._array, count: Int(nv))
    }
  }

  // Control.
  @inlinable
  public var ctrl: MjNumArray {
    get {
      MjNumArray(array: _data.pointee.ctrl, object: self, len: nu)
    }
    set {
      guard _data.pointee.ctrl != newValue._array else { return }
      _data.pointee.ctrl.assign(from: newValue._array, count: Int(nu))
    }
  }

  @inlinable
  public var qfrcApplied: MjNumArray {
    get {
      MjNumArray(array: _data.pointee.qfrc_applied, object: self, len: nv)
    }
    set {
      guard _data.pointee.qfrc_applied != newValue._array else { return }
      _data.pointee.qfrc_applied.assign(from: newValue._array, count: Int(nv))
    }
  }

  @inlinable
  public var xfrcApplied: MjNumArray {
    get {
      MjNumArray(array: _data.pointee.xfrc_applied, object: self, len: nbody * 6)
    }
    set {
      guard _data.pointee.xfrc_applied != newValue._array else { return }
      _data.pointee.xfrc_applied.assign(from: newValue._array, count: Int(nbody * 6))
    }
  }

  // Mocap data.
  @inlinable
  public var mocapPos: MjNumArray {
    get {
      MjNumArray(array: _data.pointee.mocap_pos, object: self, len: nmocap * 3)
    }
    set {
      guard _data.pointee.mocap_pos != newValue._array else { return }
      _data.pointee.mocap_pos.assign(from: newValue._array, count: Int(nmocap * 3))
    }
  }

  @inlinable
  public var mocapQuat: MjNumArray {
    get {
      MjNumArray(array: _data.pointee.mocap_quat, object: self, len: nmocap * 4)
    }
    set {
      guard _data.pointee.mocap_quat != newValue._array else { return }
      _data.pointee.mocap_quat.assign(from: newValue._array, count: Int(nmocap * 4))
    }
  }

  // Dynamics.
  @inlinable
  public var qacc: MjNumArray {
    get {
      MjNumArray(array: _data.pointee.qacc, object: self, len: nv)
    }
    set {
      guard _data.pointee.qacc != newValue._array else { return }
      _data.pointee.qacc.assign(from: newValue._array, count: Int(nv))
    }
  }

  @inlinable
  public var actDot: MjNumArray {
    get {
      MjNumArray(array: _data.pointee.act_dot, object: self, len: na)
    }
    set {
      guard _data.pointee.act_dot != newValue._array else { return }
      _data.pointee.act_dot.assign(from: newValue._array, count: Int(na))
    }
  }

  // User data.
  @inlinable
  public var userdata: MjNumArray {
    get {
      MjNumArray(array: _data.pointee.userdata, object: self, len: nuserdata)
    }
    set {
      guard _data.pointee.userdata != newValue._array else { return }
      _data.pointee.userdata.assign(from: newValue._array, count: Int(nuserdata))
    }
  }

  // Sensors.
  @inlinable
  public var sensordata: MjNumArray {
    get {
      MjNumArray(array: _data.pointee.sensordata, object: self, len: nsensordata)
    }
    set {
      guard _data.pointee.sensordata != newValue._array else { return }
      _data.pointee.sensordata.assign(from: newValue._array, count: Int(nsensordata))
    }
  }
}
