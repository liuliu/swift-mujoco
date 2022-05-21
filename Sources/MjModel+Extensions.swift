import C_mujoco

extension MjModel {
  @inlinable
  public var nq: Int32 {
    get { _model.pointee.nq }
    set { _model.pointee.nq = newValue }
  }
  @inlinable
  public var nv: Int32 {
    get { _model.pointee.nv }
    set { _model.pointee.nv = newValue }
  }
  @inlinable
  public var nu: Int32 {
    get { _model.pointee.nu }
    set { _model.pointee.nu = newValue }
  }
  @inlinable
  public var na: Int32 {
    get { _model.pointee.na }
    set { _model.pointee.na = newValue }
  }
  @inlinable
  public var nbody: Int32 {
    get { _model.pointee.nbody }
    set { _model.pointee.nbody = newValue }
  }
  @inlinable
  public var njnt: Int32 {
    get { _model.pointee.njnt }
    set { _model.pointee.njnt = newValue }
  }
  @inlinable
  public var ngeom: Int32 {
    get { _model.pointee.ngeom }
    set { _model.pointee.ngeom = newValue }
  }
  @inlinable
  public var nsite: Int32 {
    get { _model.pointee.nsite }
    set { _model.pointee.nsite = newValue }
  }
  @inlinable
  public var ncam: Int32 {
    get { _model.pointee.ncam }
    set { _model.pointee.ncam = newValue }
  }
  @inlinable
  public var nlight: Int32 {
    get { _model.pointee.nlight }
    set { _model.pointee.nlight = newValue }
  }
  @inlinable
  public var nmesh: Int32 {
    get { _model.pointee.nmesh }
    set { _model.pointee.nmesh = newValue }
  }
  @inlinable
  public var nmeshvert: Int32 {
    get { _model.pointee.nmeshvert }
    set { _model.pointee.nmeshvert = newValue }
  }
  @inlinable
  public var nmeshtexvert: Int32 {
    get { _model.pointee.nmeshtexvert }
    set { _model.pointee.nmeshtexvert = newValue }
  }
  @inlinable
  public var nmeshface: Int32 {
    get { _model.pointee.nmeshface }
    set { _model.pointee.nmeshface = newValue }
  }
  @inlinable
  public var nmeshgraph: Int32 {
    get { _model.pointee.nmeshgraph }
    set { _model.pointee.nmeshgraph = newValue }
  }
  @inlinable
  public var nskin: Int32 {
    get { _model.pointee.nskin }
    set { _model.pointee.nskin = newValue }
  }
  @inlinable
  public var nskinvert: Int32 {
    get { _model.pointee.nskinvert }
    set { _model.pointee.nskinvert = newValue }
  }
  @inlinable
  public var nskintexvert: Int32 {
    get { _model.pointee.nskintexvert }
    set { _model.pointee.nskintexvert = newValue }
  }
  @inlinable
  public var nskinface: Int32 {
    get { _model.pointee.nskinface }
    set { _model.pointee.nskinface = newValue }
  }
  @inlinable
  public var nskinbone: Int32 {
    get { _model.pointee.nskinbone }
    set { _model.pointee.nskinbone = newValue }
  }
  @inlinable
  public var nskinbonevert: Int32 {
    get { _model.pointee.nskinbonevert }
    set { _model.pointee.nskinbonevert = newValue }
  }
  @inlinable
  public var nhfield: Int32 {
    get { _model.pointee.nhfield }
    set { _model.pointee.nhfield = newValue }
  }
  @inlinable
  public var nhfielddata: Int32 {
    get { _model.pointee.nhfielddata }
    set { _model.pointee.nhfielddata = newValue }
  }
  @inlinable
  public var ntex: Int32 {
    get { _model.pointee.ntex }
    set { _model.pointee.ntex = newValue }
  }
  @inlinable
  public var ntexdata: Int32 {
    get { _model.pointee.ntexdata }
    set { _model.pointee.ntexdata = newValue }
  }
  @inlinable
  public var nmat: Int32 {
    get { _model.pointee.nmat }
    set { _model.pointee.nmat = newValue }
  }
  @inlinable
  public var npair: Int32 {
    get { _model.pointee.npair }
    set { _model.pointee.npair = newValue }
  }
  @inlinable
  public var nexclude: Int32 {
    get { _model.pointee.nexclude }
    set { _model.pointee.nexclude = newValue }
  }
  @inlinable
  public var neq: Int32 {
    get { _model.pointee.neq }
    set { _model.pointee.neq = newValue }
  }
  @inlinable
  public var ntendon: Int32 {
    get { _model.pointee.ntendon }
    set { _model.pointee.ntendon = newValue }
  }
  @inlinable
  public var nwrap: Int32 {
    get { _model.pointee.nwrap }
    set { _model.pointee.nwrap = newValue }
  }
  @inlinable
  public var nsensor: Int32 {
    get { _model.pointee.nsensor }
    set { _model.pointee.nsensor = newValue }
  }
  @inlinable
  public var nnumeric: Int32 {
    get { _model.pointee.nnumeric }
    set { _model.pointee.nnumeric = newValue }
  }
  @inlinable
  public var nnumericdata: Int32 {
    get { _model.pointee.nnumericdata }
    set { _model.pointee.nnumericdata = newValue }
  }
  @inlinable
  public var ntext: Int32 {
    get { _model.pointee.ntext }
    set { _model.pointee.ntext = newValue }
  }
  @inlinable
  public var ntextdata: Int32 {
    get { _model.pointee.ntextdata }
    set { _model.pointee.ntextdata = newValue }
  }
  @inlinable
  public var ntuple: Int32 {
    get { _model.pointee.ntuple }
    set { _model.pointee.ntuple = newValue }
  }
  @inlinable
  public var ntupledata: Int32 {
    get { _model.pointee.ntupledata }
    set { _model.pointee.ntupledata = newValue }
  }
  @inlinable
  public var nkey: Int32 {
    get { _model.pointee.nkey }
    set { _model.pointee.nkey = newValue }
  }
  @inlinable
  public var nmocap: Int32 {
    get { _model.pointee.nmocap }
    set { _model.pointee.nmocap = newValue }
  }
  @inlinable
  public var nuserBody: Int32 {
    get { _model.pointee.nuser_body }
    set { _model.pointee.nuser_body = newValue }
  }
  @inlinable
  public var nuserJnt: Int32 {
    get { _model.pointee.nuser_jnt }
    set { _model.pointee.nuser_jnt = newValue }
  }
  @inlinable
  public var nuserGeom: Int32 {
    get { _model.pointee.nuser_geom }
    set { _model.pointee.nuser_geom = newValue }
  }
  @inlinable
  public var nuserSite: Int32 {
    get { _model.pointee.nuser_site }
    set { _model.pointee.nuser_site = newValue }
  }
  @inlinable
  public var nuserCam: Int32 {
    get { _model.pointee.nuser_cam }
    set { _model.pointee.nuser_cam = newValue }
  }
  @inlinable
  public var nuserTendon: Int32 {
    get { _model.pointee.nuser_tendon }
    set { _model.pointee.nuser_tendon = newValue }
  }
  @inlinable
  public var nuserActuator: Int32 {
    get { _model.pointee.nuser_actuator }
    set { _model.pointee.nuser_actuator = newValue }
  }
  @inlinable
  public var nuserSensor: Int32 {
    get { _model.pointee.nuser_sensor }
    set { _model.pointee.nuser_sensor = newValue }
  }
  @inlinable
  public var nnames: Int32 {
    get { _model.pointee.nnames }
    set { _model.pointee.nnames = newValue }
  }
  @inlinable
  public var nM: Int32 {
    get { _model.pointee.nM }
    set { _model.pointee.nM = newValue }
  }
  @inlinable
  public var nemax: Int32 {
    get { _model.pointee.nemax }
    set { _model.pointee.nemax = newValue }
  }
  @inlinable
  public var njmax: Int32 {
    get { _model.pointee.njmax }
    set { _model.pointee.njmax = newValue }
  }
  @inlinable
  public var nconmax: Int32 {
    get { _model.pointee.nconmax }
    set { _model.pointee.nconmax = newValue }
  }
  @inlinable
  public var nstack: Int32 {
    get { _model.pointee.nstack }
    set { _model.pointee.nstack = newValue }
  }
  @inlinable
  public var nuserdata: Int32 {
    get { _model.pointee.nuserdata }
    set { _model.pointee.nuserdata = newValue }
  }
  @inlinable
  public var nsensordata: Int32 {
    get { _model.pointee.nsensordata }
    set { _model.pointee.nsensordata = newValue }
  }
  @inlinable
  public var nbuffer: Int32 {
    get { _model.pointee.nbuffer }
    set { _model.pointee.nbuffer = newValue }
  }
  @inlinable
  public var opt: MjOption {
    get { MjOption(_model.pointee.opt) }
    set { _model.pointee.opt = newValue._option }
  }
  @inlinable
  public var vis: MjVisual {
    get { MjVisual(_model.pointee.vis) }
    set { _model.pointee.vis = newValue._visual }
  }
  @inlinable
  public var stat: MjStatistic {
    get { _model.pointee.stat }
    set { _model.pointee.stat = newValue }
  }
  @inlinable
  public var qpos0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.qpos0, object: self, len: nq * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.qpos0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nq * 1))
    }
  }
  @inlinable
  public var qposSpring: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.qpos_spring, object: self, len: nq * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.qpos_spring
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nq * 1))
    }
  }
  @inlinable
  public var bodyParentid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.body_parentid, object: self, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.body_parentid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  @inlinable
  public var bodyRootid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.body_rootid, object: self, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.body_rootid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  @inlinable
  public var bodyWeldid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.body_weldid, object: self, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.body_weldid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  @inlinable
  public var bodyMocapid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.body_mocapid, object: self, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.body_mocapid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  @inlinable
  public var bodyJntnum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.body_jntnum, object: self, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.body_jntnum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  @inlinable
  public var bodyJntadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.body_jntadr, object: self, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.body_jntadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  @inlinable
  public var bodyDofnum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.body_dofnum, object: self, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.body_dofnum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  @inlinable
  public var bodyDofadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.body_dofadr, object: self, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.body_dofadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  @inlinable
  public var bodyGeomnum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.body_geomnum, object: self, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.body_geomnum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  @inlinable
  public var bodyGeomadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.body_geomadr, object: self, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.body_geomadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  @inlinable
  public var bodySimple: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.body_simple, object: self, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.body_simple
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  @inlinable
  public var bodySameframe: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.body_sameframe, object: self, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.body_sameframe
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  @inlinable
  public var bodyPos: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.body_pos, object: self, len: nbody * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.body_pos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 3))
    }
  }
  @inlinable
  public var bodyQuat: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.body_quat, object: self, len: nbody * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.body_quat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 4))
    }
  }
  @inlinable
  public var bodyIpos: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.body_ipos, object: self, len: nbody * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.body_ipos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 3))
    }
  }
  @inlinable
  public var bodyIquat: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.body_iquat, object: self, len: nbody * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.body_iquat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 4))
    }
  }
  @inlinable
  public var bodyMass: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.body_mass, object: self, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.body_mass
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  @inlinable
  public var bodySubtreemass: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.body_subtreemass, object: self, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.body_subtreemass
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  @inlinable
  public var bodyInertia: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.body_inertia, object: self, len: nbody * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.body_inertia
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 3))
    }
  }
  @inlinable
  public var bodyInvweight0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.body_invweight0, object: self, len: nbody * 2) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.body_invweight0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 2))
    }
  }
  @inlinable
  public var bodyUser: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.body_user, object: self, len: nbody * nuserBody) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.body_user
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * nuserBody))
    }
  }
  @inlinable
  public var jntType: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.jnt_type, object: self, len: njnt * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.jnt_type
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 1))
    }
  }
  @inlinable
  public var jntQposadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.jnt_qposadr, object: self, len: njnt * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.jnt_qposadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 1))
    }
  }
  @inlinable
  public var jntDofadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.jnt_dofadr, object: self, len: njnt * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.jnt_dofadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 1))
    }
  }
  @inlinable
  public var jntBodyid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.jnt_bodyid, object: self, len: njnt * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.jnt_bodyid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 1))
    }
  }
  @inlinable
  public var jntGroup: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.jnt_group, object: self, len: njnt * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.jnt_group
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 1))
    }
  }
  @inlinable
  public var jntLimited: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.jnt_limited, object: self, len: njnt * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.jnt_limited
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 1))
    }
  }
  @inlinable
  public var jntSolref: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.jnt_solref, object: self, len: njnt * mjNREF) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.jnt_solref
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * mjNREF))
    }
  }
  @inlinable
  public var jntSolimp: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.jnt_solimp, object: self, len: njnt * mjNIMP) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.jnt_solimp
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * mjNIMP))
    }
  }
  @inlinable
  public var jntPos: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.jnt_pos, object: self, len: njnt * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.jnt_pos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 3))
    }
  }
  @inlinable
  public var jntAxis: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.jnt_axis, object: self, len: njnt * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.jnt_axis
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 3))
    }
  }
  @inlinable
  public var jntStiffness: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.jnt_stiffness, object: self, len: njnt * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.jnt_stiffness
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 1))
    }
  }
  @inlinable
  public var jntRange: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.jnt_range, object: self, len: njnt * 2) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.jnt_range
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 2))
    }
  }
  @inlinable
  public var jntMargin: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.jnt_margin, object: self, len: njnt * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.jnt_margin
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 1))
    }
  }
  @inlinable
  public var jntUser: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.jnt_user, object: self, len: njnt * nuserJnt) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.jnt_user
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * nuserJnt))
    }
  }
  @inlinable
  public var dofBodyid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.dof_bodyid, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.dof_bodyid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var dofJntid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.dof_jntid, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.dof_jntid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var dofParentid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.dof_parentid, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.dof_parentid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var dofMadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.dof_Madr, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.dof_Madr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var dofSimplenum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.dof_simplenum, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.dof_simplenum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var dofSolref: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.dof_solref, object: self, len: nv * mjNREF) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.dof_solref
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * mjNREF))
    }
  }
  @inlinable
  public var dofSolimp: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.dof_solimp, object: self, len: nv * mjNIMP) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.dof_solimp
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * mjNIMP))
    }
  }
  @inlinable
  public var dofFrictionloss: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.dof_frictionloss, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.dof_frictionloss
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var dofArmature: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.dof_armature, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.dof_armature
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var dofDamping: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.dof_damping, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.dof_damping
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var dofInvweight0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.dof_invweight0, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.dof_invweight0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var dofM0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.dof_M0, object: self, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.dof_M0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  @inlinable
  public var geomType: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.geom_type, object: self, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.geom_type
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  @inlinable
  public var geomContype: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.geom_contype, object: self, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.geom_contype
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  @inlinable
  public var geomConaffinity: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.geom_conaffinity, object: self, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.geom_conaffinity
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  @inlinable
  public var geomCondim: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.geom_condim, object: self, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.geom_condim
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  @inlinable
  public var geomBodyid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.geom_bodyid, object: self, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.geom_bodyid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  @inlinable
  public var geomDataid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.geom_dataid, object: self, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.geom_dataid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  @inlinable
  public var geomMatid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.geom_matid, object: self, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.geom_matid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  @inlinable
  public var geomGroup: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.geom_group, object: self, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.geom_group
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  @inlinable
  public var geomPriority: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.geom_priority, object: self, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.geom_priority
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  @inlinable
  public var geomSameframe: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.geom_sameframe, object: self, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.geom_sameframe
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  @inlinable
  public var geomSolmix: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.geom_solmix, object: self, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_solmix
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  @inlinable
  public var geomSolref: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.geom_solref, object: self, len: ngeom * mjNREF) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_solref
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * mjNREF))
    }
  }
  @inlinable
  public var geomSolimp: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.geom_solimp, object: self, len: ngeom * mjNIMP) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_solimp
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * mjNIMP))
    }
  }
  @inlinable
  public var geomSize: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.geom_size, object: self, len: ngeom * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_size
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 3))
    }
  }
  @inlinable
  public var geomRbound: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.geom_rbound, object: self, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_rbound
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  @inlinable
  public var geomPos: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.geom_pos, object: self, len: ngeom * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_pos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 3))
    }
  }
  @inlinable
  public var geomQuat: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.geom_quat, object: self, len: ngeom * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_quat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 4))
    }
  }
  @inlinable
  public var geomFriction: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.geom_friction, object: self, len: ngeom * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_friction
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 3))
    }
  }
  @inlinable
  public var geomMargin: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.geom_margin, object: self, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_margin
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  @inlinable
  public var geomGap: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.geom_gap, object: self, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_gap
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  @inlinable
  public var geomFluid: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.geom_fluid, object: self, len: ngeom * mjNFLUID) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_fluid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * mjNFLUID))
    }
  }
  @inlinable
  public var geomUser: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.geom_user, object: self, len: ngeom * nuserGeom) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_user
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * nuserGeom))
    }
  }
  @inlinable
  public var geomRgba: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.geom_rgba, object: self, len: ngeom * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.geom_rgba
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 4))
    }
  }
  @inlinable
  public var siteType: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.site_type, object: self, len: nsite * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.site_type
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 1))
    }
  }
  @inlinable
  public var siteBodyid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.site_bodyid, object: self, len: nsite * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.site_bodyid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 1))
    }
  }
  @inlinable
  public var siteMatid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.site_matid, object: self, len: nsite * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.site_matid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 1))
    }
  }
  @inlinable
  public var siteGroup: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.site_group, object: self, len: nsite * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.site_group
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 1))
    }
  }
  @inlinable
  public var siteSameframe: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.site_sameframe, object: self, len: nsite * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.site_sameframe
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 1))
    }
  }
  @inlinable
  public var siteSize: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.site_size, object: self, len: nsite * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.site_size
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 3))
    }
  }
  @inlinable
  public var sitePos: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.site_pos, object: self, len: nsite * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.site_pos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 3))
    }
  }
  @inlinable
  public var siteQuat: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.site_quat, object: self, len: nsite * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.site_quat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 4))
    }
  }
  @inlinable
  public var siteUser: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.site_user, object: self, len: nsite * nuserSite) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.site_user
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * nuserSite))
    }
  }
  @inlinable
  public var siteRgba: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.site_rgba, object: self, len: nsite * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.site_rgba
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 4))
    }
  }
  @inlinable
  public var camMode: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.cam_mode, object: self, len: ncam * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.cam_mode
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 1))
    }
  }
  @inlinable
  public var camBodyid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.cam_bodyid, object: self, len: ncam * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.cam_bodyid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 1))
    }
  }
  @inlinable
  public var camTargetbodyid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.cam_targetbodyid, object: self, len: ncam * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.cam_targetbodyid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 1))
    }
  }
  @inlinable
  public var camPos: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.cam_pos, object: self, len: ncam * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.cam_pos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 3))
    }
  }
  @inlinable
  public var camQuat: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.cam_quat, object: self, len: ncam * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.cam_quat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 4))
    }
  }
  @inlinable
  public var camPoscom0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.cam_poscom0, object: self, len: ncam * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.cam_poscom0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 3))
    }
  }
  @inlinable
  public var camPos0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.cam_pos0, object: self, len: ncam * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.cam_pos0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 3))
    }
  }
  @inlinable
  public var camMat0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.cam_mat0, object: self, len: ncam * 9) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.cam_mat0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 9))
    }
  }
  @inlinable
  public var camFovy: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.cam_fovy, object: self, len: ncam * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.cam_fovy
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 1))
    }
  }
  @inlinable
  public var camIpd: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.cam_ipd, object: self, len: ncam * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.cam_ipd
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 1))
    }
  }
  @inlinable
  public var camUser: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.cam_user, object: self, len: ncam * nuserCam) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.cam_user
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * nuserCam))
    }
  }
  @inlinable
  public var lightMode: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.light_mode, object: self, len: nlight * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.light_mode
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 1))
    }
  }
  @inlinable
  public var lightBodyid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.light_bodyid, object: self, len: nlight * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.light_bodyid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 1))
    }
  }
  @inlinable
  public var lightTargetbodyid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.light_targetbodyid, object: self, len: nlight * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.light_targetbodyid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 1))
    }
  }
  @inlinable
  public var lightDirectional: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.light_directional, object: self, len: nlight * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.light_directional
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 1))
    }
  }
  @inlinable
  public var lightCastshadow: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.light_castshadow, object: self, len: nlight * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.light_castshadow
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 1))
    }
  }
  @inlinable
  public var lightActive: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.light_active, object: self, len: nlight * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.light_active
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 1))
    }
  }
  @inlinable
  public var lightPos: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.light_pos, object: self, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.light_pos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  @inlinable
  public var lightDir: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.light_dir, object: self, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.light_dir
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  @inlinable
  public var lightPoscom0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.light_poscom0, object: self, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.light_poscom0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  @inlinable
  public var lightPos0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.light_pos0, object: self, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.light_pos0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  @inlinable
  public var lightDir0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.light_dir0, object: self, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.light_dir0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  @inlinable
  public var lightAttenuation: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.light_attenuation, object: self, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.light_attenuation
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  @inlinable
  public var lightCutoff: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.light_cutoff, object: self, len: nlight * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.light_cutoff
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 1))
    }
  }
  @inlinable
  public var lightExponent: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.light_exponent, object: self, len: nlight * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.light_exponent
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 1))
    }
  }
  @inlinable
  public var lightAmbient: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.light_ambient, object: self, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.light_ambient
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  @inlinable
  public var lightDiffuse: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.light_diffuse, object: self, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.light_diffuse
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  @inlinable
  public var lightSpecular: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.light_specular, object: self, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.light_specular
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  @inlinable
  public var meshVertadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.mesh_vertadr, object: self, len: nmesh * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.mesh_vertadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmesh * 1))
    }
  }
  @inlinable
  public var meshVertnum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.mesh_vertnum, object: self, len: nmesh * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.mesh_vertnum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmesh * 1))
    }
  }
  @inlinable
  public var meshTexcoordadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.mesh_texcoordadr, object: self, len: nmesh * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.mesh_texcoordadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmesh * 1))
    }
  }
  @inlinable
  public var meshFaceadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.mesh_faceadr, object: self, len: nmesh * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.mesh_faceadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmesh * 1))
    }
  }
  @inlinable
  public var meshFacenum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.mesh_facenum, object: self, len: nmesh * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.mesh_facenum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmesh * 1))
    }
  }
  @inlinable
  public var meshGraphadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.mesh_graphadr, object: self, len: nmesh * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.mesh_graphadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmesh * 1))
    }
  }
  @inlinable
  public var meshVert: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.mesh_vert, object: self, len: nmeshvert * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.mesh_vert
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmeshvert * 3))
    }
  }
  @inlinable
  public var meshNormal: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.mesh_normal, object: self, len: nmeshvert * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.mesh_normal
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmeshvert * 3))
    }
  }
  @inlinable
  public var meshTexcoord: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.mesh_texcoord, object: self, len: nmeshtexvert * 2) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.mesh_texcoord
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmeshtexvert * 2))
    }
  }
  @inlinable
  public var meshFace: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.mesh_face, object: self, len: nmeshface * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.mesh_face
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmeshface * 3))
    }
  }
  @inlinable
  public var meshGraph: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.mesh_graph, object: self, len: nmeshgraph * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.mesh_graph
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmeshgraph * 1))
    }
  }
  @inlinable
  public var skinMatid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_matid, object: self, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_matid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  @inlinable
  public var skinRgba: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.skin_rgba, object: self, len: nskin * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.skin_rgba
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 4))
    }
  }
  @inlinable
  public var skinInflate: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.skin_inflate, object: self, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.skin_inflate
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  @inlinable
  public var skinVertadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_vertadr, object: self, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_vertadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  @inlinable
  public var skinVertnum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_vertnum, object: self, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_vertnum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  @inlinable
  public var skinTexcoordadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_texcoordadr, object: self, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_texcoordadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  @inlinable
  public var skinFaceadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_faceadr, object: self, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_faceadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  @inlinable
  public var skinFacenum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_facenum, object: self, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_facenum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  @inlinable
  public var skinBoneadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_boneadr, object: self, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_boneadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  @inlinable
  public var skinBonenum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_bonenum, object: self, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_bonenum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  @inlinable
  public var skinVert: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.skin_vert, object: self, len: nskinvert * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.skin_vert
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskinvert * 3))
    }
  }
  @inlinable
  public var skinTexcoord: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.skin_texcoord, object: self, len: nskintexvert * 2) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.skin_texcoord
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskintexvert * 2))
    }
  }
  @inlinable
  public var skinFace: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_face, object: self, len: nskinface * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_face
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskinface * 3))
    }
  }
  @inlinable
  public var skinBonevertadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_bonevertadr, object: self, len: nskinbone * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_bonevertadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskinbone * 1))
    }
  }
  @inlinable
  public var skinBonevertnum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_bonevertnum, object: self, len: nskinbone * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_bonevertnum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskinbone * 1))
    }
  }
  @inlinable
  public var skinBonebindpos: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.skin_bonebindpos, object: self, len: nskinbone * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.skin_bonebindpos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskinbone * 3))
    }
  }
  @inlinable
  public var skinBonebindquat: MjArray<Float> {
    get {
      MjArray<Float>(array: _model.pointee.skin_bonebindquat, object: self, len: nskinbone * 4)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.skin_bonebindquat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskinbone * 4))
    }
  }
  @inlinable
  public var skinBonebodyid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_bonebodyid, object: self, len: nskinbone * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_bonebodyid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskinbone * 1))
    }
  }
  @inlinable
  public var skinBonevertid: MjArray<Int32> {
    get {
      MjArray<Int32>(array: _model.pointee.skin_bonevertid, object: self, len: nskinbonevert * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_bonevertid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskinbonevert * 1))
    }
  }
  @inlinable
  public var skinBonevertweight: MjArray<Float> {
    get {
      MjArray<Float>(
        array: _model.pointee.skin_bonevertweight, object: self, len: nskinbonevert * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.skin_bonevertweight
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskinbonevert * 1))
    }
  }
  @inlinable
  public var hfieldSize: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.hfield_size, object: self, len: nhfield * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.hfield_size
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nhfield * 4))
    }
  }
  @inlinable
  public var hfieldNrow: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.hfield_nrow, object: self, len: nhfield * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.hfield_nrow
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nhfield * 1))
    }
  }
  @inlinable
  public var hfieldNcol: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.hfield_ncol, object: self, len: nhfield * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.hfield_ncol
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nhfield * 1))
    }
  }
  @inlinable
  public var hfieldAdr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.hfield_adr, object: self, len: nhfield * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.hfield_adr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nhfield * 1))
    }
  }
  @inlinable
  public var hfieldData: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.hfield_data, object: self, len: nhfielddata * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.hfield_data
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nhfielddata * 1))
    }
  }
  @inlinable
  public var texType: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tex_type, object: self, len: ntex * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tex_type
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntex * 1))
    }
  }
  @inlinable
  public var texHeight: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tex_height, object: self, len: ntex * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tex_height
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntex * 1))
    }
  }
  @inlinable
  public var texWidth: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tex_width, object: self, len: ntex * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tex_width
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntex * 1))
    }
  }
  @inlinable
  public var texAdr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tex_adr, object: self, len: ntex * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tex_adr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntex * 1))
    }
  }
  @inlinable
  public var texRgb: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.tex_rgb, object: self, len: ntexdata * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.tex_rgb
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntexdata * 1))
    }
  }
  @inlinable
  public var matTexid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.mat_texid, object: self, len: nmat * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.mat_texid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmat * 1))
    }
  }
  @inlinable
  public var matTexuniform: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.mat_texuniform, object: self, len: nmat * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.mat_texuniform
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmat * 1))
    }
  }
  @inlinable
  public var matTexrepeat: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.mat_texrepeat, object: self, len: nmat * 2) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.mat_texrepeat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmat * 2))
    }
  }
  @inlinable
  public var matEmission: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.mat_emission, object: self, len: nmat * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.mat_emission
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmat * 1))
    }
  }
  @inlinable
  public var matSpecular: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.mat_specular, object: self, len: nmat * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.mat_specular
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmat * 1))
    }
  }
  @inlinable
  public var matShininess: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.mat_shininess, object: self, len: nmat * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.mat_shininess
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmat * 1))
    }
  }
  @inlinable
  public var matReflectance: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.mat_reflectance, object: self, len: nmat * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.mat_reflectance
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmat * 1))
    }
  }
  @inlinable
  public var matRgba: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.mat_rgba, object: self, len: nmat * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.mat_rgba
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmat * 4))
    }
  }
  @inlinable
  public var pairDim: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.pair_dim, object: self, len: npair * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.pair_dim
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npair * 1))
    }
  }
  @inlinable
  public var pairGeom1: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.pair_geom1, object: self, len: npair * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.pair_geom1
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npair * 1))
    }
  }
  @inlinable
  public var pairGeom2: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.pair_geom2, object: self, len: npair * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.pair_geom2
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npair * 1))
    }
  }
  @inlinable
  public var pairSignature: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.pair_signature, object: self, len: npair * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.pair_signature
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npair * 1))
    }
  }
  @inlinable
  public var pairSolref: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.pair_solref, object: self, len: npair * mjNREF) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.pair_solref
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npair * mjNREF))
    }
  }
  @inlinable
  public var pairSolimp: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.pair_solimp, object: self, len: npair * mjNIMP) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.pair_solimp
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npair * mjNIMP))
    }
  }
  @inlinable
  public var pairMargin: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.pair_margin, object: self, len: npair * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.pair_margin
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npair * 1))
    }
  }
  @inlinable
  public var pairGap: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.pair_gap, object: self, len: npair * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.pair_gap
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npair * 1))
    }
  }
  @inlinable
  public var pairFriction: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.pair_friction, object: self, len: npair * 5) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.pair_friction
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npair * 5))
    }
  }
  @inlinable
  public var excludeSignature: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.exclude_signature, object: self, len: nexclude * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.exclude_signature
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nexclude * 1))
    }
  }
  @inlinable
  public var eqType: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.eq_type, object: self, len: neq * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.eq_type
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(neq * 1))
    }
  }
  @inlinable
  public var eqObj1id: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.eq_obj1id, object: self, len: neq * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.eq_obj1id
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(neq * 1))
    }
  }
  @inlinable
  public var eqObj2id: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.eq_obj2id, object: self, len: neq * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.eq_obj2id
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(neq * 1))
    }
  }
  @inlinable
  public var eqActive: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.eq_active, object: self, len: neq * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.eq_active
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(neq * 1))
    }
  }
  @inlinable
  public var eqSolref: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.eq_solref, object: self, len: neq * mjNREF) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.eq_solref
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(neq * mjNREF))
    }
  }
  @inlinable
  public var eqSolimp: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.eq_solimp, object: self, len: neq * mjNIMP) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.eq_solimp
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(neq * mjNIMP))
    }
  }
  @inlinable
  public var eqData: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.eq_data, object: self, len: neq * mjNEQDATA) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.eq_data
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(neq * mjNEQDATA))
    }
  }
  @inlinable
  public var tendonAdr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tendon_adr, object: self, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tendon_adr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  @inlinable
  public var tendonNum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tendon_num, object: self, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tendon_num
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  @inlinable
  public var tendonMatid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tendon_matid, object: self, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tendon_matid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  @inlinable
  public var tendonGroup: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tendon_group, object: self, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tendon_group
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  @inlinable
  public var tendonLimited: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.tendon_limited, object: self, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.tendon_limited
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  @inlinable
  public var tendonWidth: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.tendon_width, object: self, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_width
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  @inlinable
  public var tendonSolrefLim: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.tendon_solref_lim, object: self, len: ntendon * mjNREF)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_solref_lim
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * mjNREF))
    }
  }
  @inlinable
  public var tendonSolimpLim: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.tendon_solimp_lim, object: self, len: ntendon * mjNIMP)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_solimp_lim
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * mjNIMP))
    }
  }
  @inlinable
  public var tendonSolrefFri: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.tendon_solref_fri, object: self, len: ntendon * mjNREF)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_solref_fri
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * mjNREF))
    }
  }
  @inlinable
  public var tendonSolimpFri: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.tendon_solimp_fri, object: self, len: ntendon * mjNIMP)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_solimp_fri
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * mjNIMP))
    }
  }
  @inlinable
  public var tendonRange: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.tendon_range, object: self, len: ntendon * 2) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_range
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 2))
    }
  }
  @inlinable
  public var tendonMargin: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.tendon_margin, object: self, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_margin
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  @inlinable
  public var tendonStiffness: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.tendon_stiffness, object: self, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_stiffness
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  @inlinable
  public var tendonDamping: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.tendon_damping, object: self, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_damping
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  @inlinable
  public var tendonFrictionloss: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.tendon_frictionloss, object: self, len: ntendon * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_frictionloss
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  @inlinable
  public var tendonLengthspring: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.tendon_lengthspring, object: self, len: ntendon * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_lengthspring
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  @inlinable
  public var tendonLength0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.tendon_length0, object: self, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_length0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  @inlinable
  public var tendonInvweight0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.tendon_invweight0, object: self, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_invweight0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  @inlinable
  public var tendonUser: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.tendon_user, object: self, len: ntendon * nuserTendon)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_user
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * nuserTendon))
    }
  }
  @inlinable
  public var tendonRgba: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.tendon_rgba, object: self, len: ntendon * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.tendon_rgba
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 4))
    }
  }
  @inlinable
  public var wrapType: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.wrap_type, object: self, len: nwrap * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.wrap_type
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nwrap * 1))
    }
  }
  @inlinable
  public var wrapObjid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.wrap_objid, object: self, len: nwrap * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.wrap_objid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nwrap * 1))
    }
  }
  @inlinable
  public var wrapPrm: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.wrap_prm, object: self, len: nwrap * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.wrap_prm
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nwrap * 1))
    }
  }
  @inlinable
  public var actuatorTrntype: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.actuator_trntype, object: self, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.actuator_trntype
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  @inlinable
  public var actuatorDyntype: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.actuator_dyntype, object: self, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.actuator_dyntype
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  @inlinable
  public var actuatorGaintype: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.actuator_gaintype, object: self, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.actuator_gaintype
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  @inlinable
  public var actuatorBiastype: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.actuator_biastype, object: self, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.actuator_biastype
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  @inlinable
  public var actuatorTrnid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.actuator_trnid, object: self, len: nu * 2) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.actuator_trnid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 2))
    }
  }
  @inlinable
  public var actuatorGroup: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.actuator_group, object: self, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.actuator_group
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  @inlinable
  public var actuatorCtrllimited: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.actuator_ctrllimited, object: self, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.actuator_ctrllimited
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  @inlinable
  public var actuatorForcelimited: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.actuator_forcelimited, object: self, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.actuator_forcelimited
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  @inlinable
  public var actuatorDynprm: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.actuator_dynprm, object: self, len: nu * mjNDYN) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_dynprm
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * mjNDYN))
    }
  }
  @inlinable
  public var actuatorGainprm: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.actuator_gainprm, object: self, len: nu * mjNGAIN) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_gainprm
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * mjNGAIN))
    }
  }
  @inlinable
  public var actuatorBiasprm: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.actuator_biasprm, object: self, len: nu * mjNBIAS) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_biasprm
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * mjNBIAS))
    }
  }
  @inlinable
  public var actuatorCtrlrange: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.actuator_ctrlrange, object: self, len: nu * 2) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_ctrlrange
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 2))
    }
  }
  @inlinable
  public var actuatorForcerange: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.actuator_forcerange, object: self, len: nu * 2) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_forcerange
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 2))
    }
  }
  @inlinable
  public var actuatorGear: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.actuator_gear, object: self, len: nu * 6) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_gear
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 6))
    }
  }
  @inlinable
  public var actuatorCranklength: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.actuator_cranklength, object: self, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_cranklength
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  @inlinable
  public var actuatorAcc0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.actuator_acc0, object: self, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_acc0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  @inlinable
  public var actuatorLength0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.actuator_length0, object: self, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_length0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  @inlinable
  public var actuatorLengthrange: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.actuator_lengthrange, object: self, len: nu * 2) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_lengthrange
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 2))
    }
  }
  @inlinable
  public var actuatorUser: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.actuator_user, object: self, len: nu * nuserActuator)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_user
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * nuserActuator))
    }
  }
  @inlinable
  public var sensorType: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.sensor_type, object: self, len: nsensor * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.sensor_type
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  @inlinable
  public var sensorDatatype: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.sensor_datatype, object: self, len: nsensor * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.sensor_datatype
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  @inlinable
  public var sensorNeedstage: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.sensor_needstage, object: self, len: nsensor * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.sensor_needstage
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  @inlinable
  public var sensorObjtype: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.sensor_objtype, object: self, len: nsensor * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.sensor_objtype
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  @inlinable
  public var sensorObjid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.sensor_objid, object: self, len: nsensor * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.sensor_objid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  @inlinable
  public var sensorReftype: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.sensor_reftype, object: self, len: nsensor * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.sensor_reftype
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  @inlinable
  public var sensorRefid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.sensor_refid, object: self, len: nsensor * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.sensor_refid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  @inlinable
  public var sensorDim: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.sensor_dim, object: self, len: nsensor * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.sensor_dim
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  @inlinable
  public var sensorAdr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.sensor_adr, object: self, len: nsensor * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.sensor_adr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  @inlinable
  public var sensorCutoff: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.sensor_cutoff, object: self, len: nsensor * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.sensor_cutoff
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  @inlinable
  public var sensorNoise: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.sensor_noise, object: self, len: nsensor * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.sensor_noise
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  @inlinable
  public var sensorUser: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.sensor_user, object: self, len: nsensor * nuserSensor)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.sensor_user
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * nuserSensor))
    }
  }
  @inlinable
  public var numericAdr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.numeric_adr, object: self, len: nnumeric * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.numeric_adr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nnumeric * 1))
    }
  }
  @inlinable
  public var numericSize: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.numeric_size, object: self, len: nnumeric * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.numeric_size
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nnumeric * 1))
    }
  }
  @inlinable
  public var numericData: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.numeric_data, object: self, len: nnumericdata * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.numeric_data
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nnumericdata * 1))
    }
  }
  @inlinable
  public var textAdr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.text_adr, object: self, len: ntext * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.text_adr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntext * 1))
    }
  }
  @inlinable
  public var textSize: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.text_size, object: self, len: ntext * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.text_size
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntext * 1))
    }
  }
  @inlinable
  public var textData: MjArray<Int8> {
    get { MjArray<Int8>(array: _model.pointee.text_data, object: self, len: ntextdata * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int8> = _model.pointee.text_data
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntextdata * 1))
    }
  }
  @inlinable
  public var tupleAdr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tuple_adr, object: self, len: ntuple * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tuple_adr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntuple * 1))
    }
  }
  @inlinable
  public var tupleSize: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tuple_size, object: self, len: ntuple * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tuple_size
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntuple * 1))
    }
  }
  @inlinable
  public var tupleObjtype: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tuple_objtype, object: self, len: ntupledata * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tuple_objtype
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntupledata * 1))
    }
  }
  @inlinable
  public var tupleObjid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tuple_objid, object: self, len: ntupledata * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tuple_objid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntupledata * 1))
    }
  }
  @inlinable
  public var tupleObjprm: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.tuple_objprm, object: self, len: ntupledata * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tuple_objprm
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntupledata * 1))
    }
  }
  @inlinable
  public var keyTime: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.key_time, object: self, len: nkey * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.key_time
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nkey * 1))
    }
  }
  @inlinable
  public var keyQpos: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.key_qpos, object: self, len: nkey * nq) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.key_qpos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nkey * nq))
    }
  }
  @inlinable
  public var keyQvel: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.key_qvel, object: self, len: nkey * nv) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.key_qvel
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nkey * nv))
    }
  }
  @inlinable
  public var keyAct: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.key_act, object: self, len: nkey * na) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.key_act
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nkey * na))
    }
  }
  @inlinable
  public var keyMpos: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.key_mpos, object: self, len: nkey * 3 * nmocap) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.key_mpos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nkey * 3 * nmocap))
    }
  }
  @inlinable
  public var keyMquat: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.key_mquat, object: self, len: nkey * 4 * nmocap) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.key_mquat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nkey * 4 * nmocap))
    }
  }
  @inlinable
  public var nameBodyadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_bodyadr, object: self, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_bodyadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  @inlinable
  public var nameJntadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_jntadr, object: self, len: njnt * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_jntadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 1))
    }
  }
  @inlinable
  public var nameGeomadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_geomadr, object: self, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_geomadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  @inlinable
  public var nameSiteadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_siteadr, object: self, len: nsite * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_siteadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 1))
    }
  }
  @inlinable
  public var nameCamadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_camadr, object: self, len: ncam * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_camadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 1))
    }
  }
  @inlinable
  public var nameLightadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_lightadr, object: self, len: nlight * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_lightadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 1))
    }
  }
  @inlinable
  public var nameMeshadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_meshadr, object: self, len: nmesh * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_meshadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmesh * 1))
    }
  }
  @inlinable
  public var nameSkinadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_skinadr, object: self, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_skinadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  @inlinable
  public var nameHfieldadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_hfieldadr, object: self, len: nhfield * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_hfieldadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nhfield * 1))
    }
  }
  @inlinable
  public var nameTexadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_texadr, object: self, len: ntex * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_texadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntex * 1))
    }
  }
  @inlinable
  public var nameMatadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_matadr, object: self, len: nmat * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_matadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmat * 1))
    }
  }
  @inlinable
  public var namePairadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_pairadr, object: self, len: npair * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_pairadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npair * 1))
    }
  }
  @inlinable
  public var nameExcludeadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_excludeadr, object: self, len: nexclude * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_excludeadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nexclude * 1))
    }
  }
  @inlinable
  public var nameEqadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_eqadr, object: self, len: neq * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_eqadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(neq * 1))
    }
  }
  @inlinable
  public var nameTendonadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_tendonadr, object: self, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_tendonadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  @inlinable
  public var nameActuatoradr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_actuatoradr, object: self, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_actuatoradr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  @inlinable
  public var nameSensoradr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_sensoradr, object: self, len: nsensor * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_sensoradr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  @inlinable
  public var nameNumericadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_numericadr, object: self, len: nnumeric * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_numericadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nnumeric * 1))
    }
  }
  @inlinable
  public var nameTextadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_textadr, object: self, len: ntext * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_textadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntext * 1))
    }
  }
  @inlinable
  public var nameTupleadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_tupleadr, object: self, len: ntuple * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_tupleadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntuple * 1))
    }
  }
  @inlinable
  public var nameKeyadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_keyadr, object: self, len: nkey * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_keyadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nkey * 1))
    }
  }
  @inlinable
  public var names: MjArray<Int8> {
    get { MjArray<Int8>(array: _model.pointee.names, object: self, len: nnames * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int8> = _model.pointee.names
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nnames * 1))
    }
  }
}
