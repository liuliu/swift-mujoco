extension MjData {
  @inlinable
  public var nstack: Int32 {
    get { _data.pointee.nstack }
    set { _data.pointee.nstack = newValue }
  }
  @inlinable
  public var nbuffer: Int32 {
    get { _data.pointee.nbuffer }
    set { _data.pointee.nbuffer = newValue }
  }
  @inlinable
  public var pstack: Int32 {
    get { _data.pointee.pstack }
    set { _data.pointee.pstack = newValue }
  }
  @inlinable
  public var maxuseStack: Int32 {
    get { _data.pointee.maxuse_stack }
    set { _data.pointee.maxuse_stack = newValue }
  }
  @inlinable
  public var maxuseCon: Int32 {
    get { _data.pointee.maxuse_con }
    set { _data.pointee.maxuse_con = newValue }
  }
  @inlinable
  public var maxuseEfc: Int32 {
    get { _data.pointee.maxuse_efc }
    set { _data.pointee.maxuse_efc = newValue }
  }
  @inlinable
  public var solverIter: Int32 {
    get { _data.pointee.solver_iter }
    set { _data.pointee.solver_iter = newValue }
  }
  @inlinable
  public var solverNnz: Int32 {
    get { _data.pointee.solver_nnz }
    set { _data.pointee.solver_nnz = newValue }
  }
  @inlinable
  public var solverFwdinv: (Double, Double) {
    get { _data.pointee.solver_fwdinv }
    set { _data.pointee.solver_fwdinv = newValue }
  }
  @inlinable
  public var ne: Int32 {
    get { _data.pointee.ne }
    set { _data.pointee.ne = newValue }
  }
  @inlinable
  public var nf: Int32 {
    get { _data.pointee.nf }
    set { _data.pointee.nf = newValue }
  }
  @inlinable
  public var nefc: Int32 {
    get { _data.pointee.nefc }
    set { _data.pointee.nefc = newValue }
  }
  @inlinable
  public var ncon: Int32 {
    get { _data.pointee.ncon }
    set { _data.pointee.ncon = newValue }
  }
  @inlinable
  public var time: Double {
    get { _data.pointee.time }
    set { _data.pointee.time = newValue }
  }
  @inlinable
  public var energy: (Double, Double) {
    get { _data.pointee.energy }
    set { _data.pointee.energy = newValue }
  }
  @inlinable
  public var qpos: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qpos, object: self, len: nq * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qpos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nq * 1))
    }
  }
  @inlinable
  public var qvel: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qvel, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qvel
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var act: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.act, object: self, len: na * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.act
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(na * 1))
    }
  }
  @inlinable
  public var qaccWarmstart: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qacc_warmstart, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qacc_warmstart
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var ctrl: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.ctrl, object: self, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.ctrl
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  @inlinable
  public var qfrcApplied: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qfrc_applied, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qfrc_applied
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var xfrcApplied: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.xfrc_applied, object: self, len: nbody * 6) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.xfrc_applied
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 6))
    }
  }
  @inlinable
  public var mocapPos: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.mocap_pos, object: self, len: nmocap * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.mocap_pos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmocap * 3))
    }
  }
  @inlinable
  public var mocapQuat: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.mocap_quat, object: self, len: nmocap * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.mocap_quat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmocap * 4))
    }
  }
  @inlinable
  public var qacc: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qacc, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qacc
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var actDot: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.act_dot, object: self, len: na * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.act_dot
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(na * 1))
    }
  }
  @inlinable
  public var userdata: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.userdata, object: self, len: nuserdata * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.userdata
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nuserdata * 1))
    }
  }
  @inlinable
  public var sensordata: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.sensordata, object: self, len: nsensordata * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.sensordata
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensordata * 1))
    }
  }
  @inlinable
  public var xpos: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.xpos, object: self, len: nbody * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.xpos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 3))
    }
  }
  @inlinable
  public var xquat: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.xquat, object: self, len: nbody * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.xquat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 4))
    }
  }
  @inlinable
  public var xmat: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.xmat, object: self, len: nbody * 9) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.xmat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 9))
    }
  }
  @inlinable
  public var xipos: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.xipos, object: self, len: nbody * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.xipos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 3))
    }
  }
  @inlinable
  public var ximat: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.ximat, object: self, len: nbody * 9) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.ximat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 9))
    }
  }
  @inlinable
  public var xanchor: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.xanchor, object: self, len: njnt * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.xanchor
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 3))
    }
  }
  @inlinable
  public var xaxis: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.xaxis, object: self, len: njnt * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.xaxis
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 3))
    }
  }
  @inlinable
  public var geomXpos: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.geom_xpos, object: self, len: ngeom * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.geom_xpos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 3))
    }
  }
  @inlinable
  public var geomXmat: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.geom_xmat, object: self, len: ngeom * 9) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.geom_xmat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 9))
    }
  }
  @inlinable
  public var siteXpos: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.site_xpos, object: self, len: nsite * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.site_xpos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 3))
    }
  }
  @inlinable
  public var siteXmat: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.site_xmat, object: self, len: nsite * 9) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.site_xmat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 9))
    }
  }
  @inlinable
  public var camXpos: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.cam_xpos, object: self, len: ncam * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.cam_xpos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 3))
    }
  }
  @inlinable
  public var camXmat: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.cam_xmat, object: self, len: ncam * 9) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.cam_xmat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 9))
    }
  }
  @inlinable
  public var lightXpos: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.light_xpos, object: self, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.light_xpos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  @inlinable
  public var lightXdir: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.light_xdir, object: self, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.light_xdir
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  @inlinable
  public var subtreeCom: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.subtree_com, object: self, len: nbody * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.subtree_com
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 3))
    }
  }
  @inlinable
  public var cdof: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.cdof, object: self, len: nv * 6) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.cdof
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 6))
    }
  }
  @inlinable
  public var cinert: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.cinert, object: self, len: nbody * 10) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.cinert
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 10))
    }
  }
  @inlinable
  public var tenWrapadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.ten_wrapadr, object: self, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.ten_wrapadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  @inlinable
  public var tenWrapnum: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.ten_wrapnum, object: self, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.ten_wrapnum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  @inlinable
  public var tenJRownnz: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.ten_J_rownnz, object: self, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.ten_J_rownnz
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  @inlinable
  public var tenJRowadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.ten_J_rowadr, object: self, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.ten_J_rowadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  @inlinable
  public var tenJColind: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.ten_J_colind, object: self, len: ntendon * nv) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.ten_J_colind
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * nv))
    }
  }
  @inlinable
  public var tenLength: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.ten_length, object: self, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.ten_length
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  @inlinable
  public var tenJ: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.ten_J, object: self, len: ntendon * nv) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.ten_J
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * nv))
    }
  }
  @inlinable
  public var wrapObj: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.wrap_obj, object: self, len: nwrap * 2 * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.wrap_obj
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nwrap * 2 * 1))
    }
  }
  @inlinable
  public var wrapXpos: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.wrap_xpos, object: self, len: nwrap * 2 * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.wrap_xpos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nwrap * 2 * 3))
    }
  }
  @inlinable
  public var actuatorLength: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.actuator_length, object: self, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.actuator_length
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  @inlinable
  public var actuatorMoment: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.actuator_moment, object: self, len: nu * nv) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.actuator_moment
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * nv))
    }
  }
  @inlinable
  public var crb: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.crb, object: self, len: nbody * 10) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.crb
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 10))
    }
  }
  @inlinable
  public var qM: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qM, object: self, len: nM * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qM
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nM * 1))
    }
  }
  @inlinable
  public var qLd: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qLD, object: self, len: nM * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qLD
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nM * 1))
    }
  }
  @inlinable
  public var qLDiagInv: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qLDiagInv, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qLDiagInv
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var qLDiagSqrtInv: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qLDiagSqrtInv, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qLDiagSqrtInv
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var contact: MjArray<MjContact> {
    get {
      MjArray<MjContact>(
        array: UnsafeMutableRawPointer(_data.pointee.contact).assumingMemoryBound(
          to: MjContact.self), object: self, len: nconmax * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjContact> = UnsafeMutableRawPointer(
        _data.pointee.contact
      ).assumingMemoryBound(to: MjContact.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nconmax * 1))
    }
  }
  @inlinable
  public var efcType: MjArray<MjConstraint> {
    get {
      MjArray<MjConstraint>(
        array: UnsafeMutableRawPointer(_data.pointee.efc_type).assumingMemoryBound(
          to: MjConstraint.self), object: self, len: njmax * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjConstraint> = UnsafeMutableRawPointer(
        _data.pointee.efc_type
      ).assumingMemoryBound(to: MjConstraint.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * 1))
    }
  }
  @inlinable
  public var efcId: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_id, object: self, len: njmax * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_id
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * 1))
    }
  }
  @inlinable
  public var efcJRownnz: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_J_rownnz, object: self, len: njmax * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_J_rownnz
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * 1))
    }
  }
  @inlinable
  public var efcJRowadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_J_rowadr, object: self, len: njmax * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_J_rowadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * 1))
    }
  }
  @inlinable
  public var efcJRowsuper: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_J_rowsuper, object: self, len: njmax * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_J_rowsuper
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * 1))
    }
  }
  @inlinable
  public var efcJColind: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_J_colind, object: self, len: njmax * nv) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_J_colind
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * nv))
    }
  }
  @inlinable
  public var efcJtRownnz: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_JT_rownnz, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_JT_rownnz
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var efcJtRowadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_JT_rowadr, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_JT_rowadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var efcJtRowsuper: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_JT_rowsuper, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_JT_rowsuper
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var efcJtColind: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_JT_colind, object: self, len: nv * njmax) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_JT_colind
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * njmax))
    }
  }
  @inlinable
  public var efcJ: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_J, object: self, len: njmax * nv) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_J
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * nv))
    }
  }
  @inlinable
  public var efcJt: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_JT, object: self, len: nv * njmax) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_JT
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * njmax))
    }
  }
  @inlinable
  public var efcPos: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_pos, object: self, len: njmax * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_pos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * 1))
    }
  }
  @inlinable
  public var efcMargin: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_margin, object: self, len: njmax * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_margin
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * 1))
    }
  }
  @inlinable
  public var efcFrictionloss: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_frictionloss, object: self, len: njmax * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_frictionloss
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * 1))
    }
  }
  @inlinable
  public var efcDiagApprox: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_diagApprox, object: self, len: njmax * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_diagApprox
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * 1))
    }
  }
  @inlinable
  public var efcKbip: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_KBIP, object: self, len: njmax * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_KBIP
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * 4))
    }
  }
  @inlinable
  public var efcD: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_D, object: self, len: njmax * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_D
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * 1))
    }
  }
  @inlinable
  public var efcR: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_R, object: self, len: njmax * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_R
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * 1))
    }
  }
  @inlinable
  public var efcArRownnz: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_AR_rownnz, object: self, len: njmax * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_AR_rownnz
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * 1))
    }
  }
  @inlinable
  public var efcArRowadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_AR_rowadr, object: self, len: njmax * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_AR_rowadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * 1))
    }
  }
  @inlinable
  public var efcArColind: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_AR_colind, object: self, len: njmax * njmax) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_AR_colind
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * njmax))
    }
  }
  @inlinable
  public var efcAr: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_AR, object: self, len: njmax * njmax) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_AR
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * njmax))
    }
  }
  @inlinable
  public var tenVelocity: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.ten_velocity, object: self, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.ten_velocity
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  @inlinable
  public var actuatorVelocity: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.actuator_velocity, object: self, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.actuator_velocity
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  @inlinable
  public var cvel: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.cvel, object: self, len: nbody * 6) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.cvel
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 6))
    }
  }
  @inlinable
  public var cdofDot: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.cdof_dot, object: self, len: nv * 6) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.cdof_dot
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 6))
    }
  }
  @inlinable
  public var qfrcBias: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qfrc_bias, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qfrc_bias
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var qfrcPassive: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qfrc_passive, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qfrc_passive
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var efcVel: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_vel, object: self, len: njmax * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_vel
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * 1))
    }
  }
  @inlinable
  public var efcAref: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_aref, object: self, len: njmax * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_aref
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * 1))
    }
  }
  @inlinable
  public var subtreeLinvel: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.subtree_linvel, object: self, len: nbody * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.subtree_linvel
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 3))
    }
  }
  @inlinable
  public var subtreeAngmom: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.subtree_angmom, object: self, len: nbody * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.subtree_angmom
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 3))
    }
  }
  @inlinable
  public var dRownnz: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.D_rownnz, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.D_rownnz
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var dRowadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.D_rowadr, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.D_rowadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var dColind: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.D_colind, object: self, len: nD * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.D_colind
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nD * 1))
    }
  }
  @inlinable
  public var qDeriv: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qDeriv, object: self, len: nD * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qDeriv
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nD * 1))
    }
  }
  @inlinable
  public var qLu: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qLU, object: self, len: nD * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qLU
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nD * 1))
    }
  }
  @inlinable
  public var actuatorForce: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.actuator_force, object: self, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.actuator_force
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  @inlinable
  public var qfrcActuator: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qfrc_actuator, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qfrc_actuator
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var qfrcSmooth: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qfrc_smooth, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qfrc_smooth
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var qaccSmooth: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qacc_smooth, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qacc_smooth
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var efcB: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_b, object: self, len: njmax * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_b
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * 1))
    }
  }
  @inlinable
  public var efcForce: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_force, object: self, len: njmax * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_force
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * 1))
    }
  }
  @inlinable
  public var efcState: MjArray<MjConstraintState> {
    get {
      MjArray<MjConstraintState>(
        array: UnsafeMutableRawPointer(_data.pointee.efc_state).assumingMemoryBound(
          to: MjConstraintState.self), object: self, len: njmax * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjConstraintState> = UnsafeMutableRawPointer(
        _data.pointee.efc_state
      ).assumingMemoryBound(to: MjConstraintState.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njmax * 1))
    }
  }
  @inlinable
  public var qfrcConstraint: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qfrc_constraint, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qfrc_constraint
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var qfrcInverse: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qfrc_inverse, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qfrc_inverse
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var cacc: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.cacc, object: self, len: nbody * 6) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.cacc
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 6))
    }
  }
  @inlinable
  public var cfrcInt: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.cfrc_int, object: self, len: nbody * 6) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.cfrc_int
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 6))
    }
  }
  @inlinable
  public var cfrcExt: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.cfrc_ext, object: self, len: nbody * 6) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.cfrc_ext
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 6))
    }
  }
}
