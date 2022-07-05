import C_mujoco

extension MjModel {
  /// number of generalized coordinates = dim(qpos)
  @inlinable
  public var nq: Int32 {
    get { _model.pointee.nq }
    set { _model.pointee.nq = newValue }
  }
  /// number of degrees of freedom = dim(qvel)
  @inlinable
  public var nv: Int32 {
    get { _model.pointee.nv }
    set { _model.pointee.nv = newValue }
  }
  /// number of actuators/controls = dim(ctrl)
  @inlinable
  public var nu: Int32 {
    get { _model.pointee.nu }
    set { _model.pointee.nu = newValue }
  }
  /// number of activation states = dim(act)
  @inlinable
  public var na: Int32 {
    get { _model.pointee.na }
    set { _model.pointee.na = newValue }
  }
  /// number of bodies
  @inlinable
  public var nbody: Int32 {
    get { _model.pointee.nbody }
    set { _model.pointee.nbody = newValue }
  }
  /// number of joints
  @inlinable
  public var njnt: Int32 {
    get { _model.pointee.njnt }
    set { _model.pointee.njnt = newValue }
  }
  /// number of geoms
  @inlinable
  public var ngeom: Int32 {
    get { _model.pointee.ngeom }
    set { _model.pointee.ngeom = newValue }
  }
  /// number of sites
  @inlinable
  public var nsite: Int32 {
    get { _model.pointee.nsite }
    set { _model.pointee.nsite = newValue }
  }
  /// number of cameras
  @inlinable
  public var ncam: Int32 {
    get { _model.pointee.ncam }
    set { _model.pointee.ncam = newValue }
  }
  /// number of lights
  @inlinable
  public var nlight: Int32 {
    get { _model.pointee.nlight }
    set { _model.pointee.nlight = newValue }
  }
  /// number of meshes
  @inlinable
  public var nmesh: Int32 {
    get { _model.pointee.nmesh }
    set { _model.pointee.nmesh = newValue }
  }
  /// number of vertices in all meshes
  @inlinable
  public var nmeshvert: Int32 {
    get { _model.pointee.nmeshvert }
    set { _model.pointee.nmeshvert = newValue }
  }
  /// number of vertices with texcoords in all meshes
  @inlinable
  public var nmeshtexvert: Int32 {
    get { _model.pointee.nmeshtexvert }
    set { _model.pointee.nmeshtexvert = newValue }
  }
  /// number of triangular faces in all meshes
  @inlinable
  public var nmeshface: Int32 {
    get { _model.pointee.nmeshface }
    set { _model.pointee.nmeshface = newValue }
  }
  /// number of ints in mesh auxiliary data
  @inlinable
  public var nmeshgraph: Int32 {
    get { _model.pointee.nmeshgraph }
    set { _model.pointee.nmeshgraph = newValue }
  }
  /// number of skins
  @inlinable
  public var nskin: Int32 {
    get { _model.pointee.nskin }
    set { _model.pointee.nskin = newValue }
  }
  /// number of vertices in all skins
  @inlinable
  public var nskinvert: Int32 {
    get { _model.pointee.nskinvert }
    set { _model.pointee.nskinvert = newValue }
  }
  /// number of vertiex with texcoords in all skins
  @inlinable
  public var nskintexvert: Int32 {
    get { _model.pointee.nskintexvert }
    set { _model.pointee.nskintexvert = newValue }
  }
  /// number of triangular faces in all skins
  @inlinable
  public var nskinface: Int32 {
    get { _model.pointee.nskinface }
    set { _model.pointee.nskinface = newValue }
  }
  /// number of bones in all skins
  @inlinable
  public var nskinbone: Int32 {
    get { _model.pointee.nskinbone }
    set { _model.pointee.nskinbone = newValue }
  }
  /// number of vertices in all skin bones
  @inlinable
  public var nskinbonevert: Int32 {
    get { _model.pointee.nskinbonevert }
    set { _model.pointee.nskinbonevert = newValue }
  }
  /// number of heightfields
  @inlinable
  public var nhfield: Int32 {
    get { _model.pointee.nhfield }
    set { _model.pointee.nhfield = newValue }
  }
  /// number of data points in all heightfields
  @inlinable
  public var nhfielddata: Int32 {
    get { _model.pointee.nhfielddata }
    set { _model.pointee.nhfielddata = newValue }
  }
  /// number of textures
  @inlinable
  public var ntex: Int32 {
    get { _model.pointee.ntex }
    set { _model.pointee.ntex = newValue }
  }
  /// number of bytes in texture rgb data
  @inlinable
  public var ntexdata: Int32 {
    get { _model.pointee.ntexdata }
    set { _model.pointee.ntexdata = newValue }
  }
  /// number of materials
  @inlinable
  public var nmat: Int32 {
    get { _model.pointee.nmat }
    set { _model.pointee.nmat = newValue }
  }
  /// number of predefined geom pairs
  @inlinable
  public var npair: Int32 {
    get { _model.pointee.npair }
    set { _model.pointee.npair = newValue }
  }
  /// number of excluded geom pairs
  @inlinable
  public var nexclude: Int32 {
    get { _model.pointee.nexclude }
    set { _model.pointee.nexclude = newValue }
  }
  /// number of equality constraints
  @inlinable
  public var neq: Int32 {
    get { _model.pointee.neq }
    set { _model.pointee.neq = newValue }
  }
  /// number of tendons
  @inlinable
  public var ntendon: Int32 {
    get { _model.pointee.ntendon }
    set { _model.pointee.ntendon = newValue }
  }
  /// number of wrap objects in all tendon paths
  @inlinable
  public var nwrap: Int32 {
    get { _model.pointee.nwrap }
    set { _model.pointee.nwrap = newValue }
  }
  /// number of sensors
  @inlinable
  public var nsensor: Int32 {
    get { _model.pointee.nsensor }
    set { _model.pointee.nsensor = newValue }
  }
  /// number of numeric custom fields
  @inlinable
  public var nnumeric: Int32 {
    get { _model.pointee.nnumeric }
    set { _model.pointee.nnumeric = newValue }
  }
  /// number of mjtNums in all numeric fields
  @inlinable
  public var nnumericdata: Int32 {
    get { _model.pointee.nnumericdata }
    set { _model.pointee.nnumericdata = newValue }
  }
  /// number of text custom fields
  @inlinable
  public var ntext: Int32 {
    get { _model.pointee.ntext }
    set { _model.pointee.ntext = newValue }
  }
  /// number of mjtBytes in all text fields
  @inlinable
  public var ntextdata: Int32 {
    get { _model.pointee.ntextdata }
    set { _model.pointee.ntextdata = newValue }
  }
  /// number of tuple custom fields
  @inlinable
  public var ntuple: Int32 {
    get { _model.pointee.ntuple }
    set { _model.pointee.ntuple = newValue }
  }
  /// number of objects in all tuple fields
  @inlinable
  public var ntupledata: Int32 {
    get { _model.pointee.ntupledata }
    set { _model.pointee.ntupledata = newValue }
  }
  /// number of keyframes
  @inlinable
  public var nkey: Int32 {
    get { _model.pointee.nkey }
    set { _model.pointee.nkey = newValue }
  }
  /// number of mocap bodies
  @inlinable
  public var nmocap: Int32 {
    get { _model.pointee.nmocap }
    set { _model.pointee.nmocap = newValue }
  }
  /// number of mjtNums in body_user
  @inlinable
  public var nuserBody: Int32 {
    get { _model.pointee.nuser_body }
    set { _model.pointee.nuser_body = newValue }
  }
  /// number of mjtNums in jnt_user
  @inlinable
  public var nuserJnt: Int32 {
    get { _model.pointee.nuser_jnt }
    set { _model.pointee.nuser_jnt = newValue }
  }
  /// number of mjtNums in geom_user
  @inlinable
  public var nuserGeom: Int32 {
    get { _model.pointee.nuser_geom }
    set { _model.pointee.nuser_geom = newValue }
  }
  /// number of mjtNums in site_user
  @inlinable
  public var nuserSite: Int32 {
    get { _model.pointee.nuser_site }
    set { _model.pointee.nuser_site = newValue }
  }
  /// number of mjtNums in cam_user
  @inlinable
  public var nuserCam: Int32 {
    get { _model.pointee.nuser_cam }
    set { _model.pointee.nuser_cam = newValue }
  }
  /// number of mjtNums in tendon_user
  @inlinable
  public var nuserTendon: Int32 {
    get { _model.pointee.nuser_tendon }
    set { _model.pointee.nuser_tendon = newValue }
  }
  /// number of mjtNums in actuator_user
  @inlinable
  public var nuserActuator: Int32 {
    get { _model.pointee.nuser_actuator }
    set { _model.pointee.nuser_actuator = newValue }
  }
  /// number of mjtNums in sensor_user
  @inlinable
  public var nuserSensor: Int32 {
    get { _model.pointee.nuser_sensor }
    set { _model.pointee.nuser_sensor = newValue }
  }
  /// number of chars in all names
  @inlinable
  public var nnames: Int32 {
    get { _model.pointee.nnames }
    set { _model.pointee.nnames = newValue }
  }
  /// number of non-zeros in sparse inertia matrix
  @inlinable
  public var nM: Int32 {
    get { _model.pointee.nM }
    set { _model.pointee.nM = newValue }
  }
  /// number of non-zeros in sparse derivative matrix
  @inlinable
  public var nD: Int32 {
    get { _model.pointee.nD }
    set { _model.pointee.nD = newValue }
  }
  /// number of potential equality-constraint rows
  @inlinable
  public var nemax: Int32 {
    get { _model.pointee.nemax }
    set { _model.pointee.nemax = newValue }
  }
  /// number of available rows in constraint Jacobian
  @inlinable
  public var njmax: Int32 {
    get { _model.pointee.njmax }
    set { _model.pointee.njmax = newValue }
  }
  /// number of potential contacts in contact list
  @inlinable
  public var nconmax: Int32 {
    get { _model.pointee.nconmax }
    set { _model.pointee.nconmax = newValue }
  }
  /// number of fields in mjData stack
  @inlinable
  public var nstack: Int32 {
    get { _model.pointee.nstack }
    set { _model.pointee.nstack = newValue }
  }
  /// number of extra fields in mjData
  @inlinable
  public var nuserdata: Int32 {
    get { _model.pointee.nuserdata }
    set { _model.pointee.nuserdata = newValue }
  }
  /// number of fields in sensor data vector
  @inlinable
  public var nsensordata: Int32 {
    get { _model.pointee.nsensordata }
    set { _model.pointee.nsensordata = newValue }
  }
  /// number of bytes in buffer
  @inlinable
  public var nbuffer: Int32 {
    get { _model.pointee.nbuffer }
    set { _model.pointee.nbuffer = newValue }
  }
  /// physics options
  @inlinable
  public var opt: MjOption {
    get { MjOption(_model.pointee.opt) }
    set { _model.pointee.opt = newValue._option }
  }
  /// visualization options
  @inlinable
  public var vis: MjVisual {
    get { MjVisual(_model.pointee.vis) }
    set { _model.pointee.vis = newValue._visual }
  }
  /// model statistics
  @inlinable
  public var stat: MjStatistic {
    get { _model.pointee.stat }
    set { _model.pointee.stat = newValue }
  }
  /// qpos values at default pose              (nq x 1)
  @inlinable
  public var qpos0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.qpos0, object: _storage, len: nq * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.qpos0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nq * 1))
    }
  }
  /// reference pose for springs               (nq x 1)
  @inlinable
  public var qposSpring: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.qpos_spring, object: _storage, len: nq * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.qpos_spring
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nq * 1))
    }
  }
  /// id of body's parent                      (nbody x 1)
  @inlinable
  public var bodyParentid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.body_parentid, object: _storage, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.body_parentid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  /// id of root above body                    (nbody x 1)
  @inlinable
  public var bodyRootid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.body_rootid, object: _storage, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.body_rootid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  /// id of body that this body is welded to   (nbody x 1)
  @inlinable
  public var bodyWeldid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.body_weldid, object: _storage, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.body_weldid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  /// id of mocap data; -1: none               (nbody x 1)
  @inlinable
  public var bodyMocapid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.body_mocapid, object: _storage, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.body_mocapid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  /// number of joints for this body           (nbody x 1)
  @inlinable
  public var bodyJntnum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.body_jntnum, object: _storage, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.body_jntnum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  /// start addr of joints; -1: no joints      (nbody x 1)
  @inlinable
  public var bodyJntadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.body_jntadr, object: _storage, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.body_jntadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  /// number of motion degrees of freedom      (nbody x 1)
  @inlinable
  public var bodyDofnum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.body_dofnum, object: _storage, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.body_dofnum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  /// start addr of dofs; -1: no dofs          (nbody x 1)
  @inlinable
  public var bodyDofadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.body_dofadr, object: _storage, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.body_dofadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  /// number of geoms                          (nbody x 1)
  @inlinable
  public var bodyGeomnum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.body_geomnum, object: _storage, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.body_geomnum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  /// start addr of geoms; -1: no geoms        (nbody x 1)
  @inlinable
  public var bodyGeomadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.body_geomadr, object: _storage, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.body_geomadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  /// body is simple (has diagonal M)          (nbody x 1)
  @inlinable
  public var bodySimple: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.body_simple, object: _storage, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.body_simple
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  /// inertial frame is same as body frame     (nbody x 1)
  @inlinable
  public var bodySameframe: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.body_sameframe, object: _storage, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.body_sameframe
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  /// position offset rel. to parent body      (nbody x 3)
  @inlinable
  public var bodyPos: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.body_pos, object: _storage, len: nbody * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.body_pos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 3))
    }
  }
  /// orientation offset rel. to parent body   (nbody x 4)
  @inlinable
  public var bodyQuat: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.body_quat, object: _storage, len: nbody * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.body_quat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 4))
    }
  }
  /// local position of center of mass         (nbody x 3)
  @inlinable
  public var bodyIpos: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.body_ipos, object: _storage, len: nbody * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.body_ipos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 3))
    }
  }
  /// local orientation of inertia ellipsoid   (nbody x 4)
  @inlinable
  public var bodyIquat: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.body_iquat, object: _storage, len: nbody * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.body_iquat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 4))
    }
  }
  /// mass                                     (nbody x 1)
  @inlinable
  public var bodyMass: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.body_mass, object: _storage, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.body_mass
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  /// mass of subtree starting at this body    (nbody x 1)
  @inlinable
  public var bodySubtreemass: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.body_subtreemass, object: _storage, len: nbody * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.body_subtreemass
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  /// diagonal inertia in ipos/iquat frame     (nbody x 3)
  @inlinable
  public var bodyInertia: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.body_inertia, object: _storage, len: nbody * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.body_inertia
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 3))
    }
  }
  /// mean inv inert in qpos0 (trn, rot)       (nbody x 2)
  @inlinable
  public var bodyInvweight0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.body_invweight0, object: _storage, len: nbody * 2) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.body_invweight0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 2))
    }
  }
  /// user data                                (nbody x nuser_body)
  @inlinable
  public var bodyUser: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.body_user, object: _storage, len: nbody * nuserBody)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.body_user
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * nuserBody))
    }
  }
  /// type of joint (mjtJoint)                 (njnt x 1)
  @inlinable
  public var jntType: MjArray<MjtJoint> {
    get {
      MjArray<MjtJoint>(
        array: UnsafeMutableRawPointer(_model.pointee.jnt_type).assumingMemoryBound(
          to: MjtJoint.self), object: _storage, len: njnt * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjtJoint> = UnsafeMutableRawPointer(
        _model.pointee.jnt_type
      ).assumingMemoryBound(to: MjtJoint.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 1))
    }
  }
  /// start addr in 'qpos' for joint's data    (njnt x 1)
  @inlinable
  public var jntQposadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.jnt_qposadr, object: _storage, len: njnt * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.jnt_qposadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 1))
    }
  }
  /// start addr in 'qvel' for joint's data    (njnt x 1)
  @inlinable
  public var jntDofadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.jnt_dofadr, object: _storage, len: njnt * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.jnt_dofadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 1))
    }
  }
  /// id of joint's body                       (njnt x 1)
  @inlinable
  public var jntBodyid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.jnt_bodyid, object: _storage, len: njnt * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.jnt_bodyid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 1))
    }
  }
  /// group for visibility                     (njnt x 1)
  @inlinable
  public var jntGroup: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.jnt_group, object: _storage, len: njnt * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.jnt_group
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 1))
    }
  }
  /// does joint have limits                   (njnt x 1)
  @inlinable
  public var jntLimited: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.jnt_limited, object: _storage, len: njnt * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.jnt_limited
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 1))
    }
  }
  /// constraint solver reference: limit       (njnt x mjNREF)
  @inlinable
  public var jntSolref: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.jnt_solref, object: _storage, len: njnt * mjNREF) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.jnt_solref
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * mjNREF))
    }
  }
  /// constraint solver impedance: limit       (njnt x mjNIMP)
  @inlinable
  public var jntSolimp: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.jnt_solimp, object: _storage, len: njnt * mjNIMP) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.jnt_solimp
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * mjNIMP))
    }
  }
  /// local anchor position                    (njnt x 3)
  @inlinable
  public var jntPos: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.jnt_pos, object: _storage, len: njnt * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.jnt_pos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 3))
    }
  }
  /// local joint axis                         (njnt x 3)
  @inlinable
  public var jntAxis: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.jnt_axis, object: _storage, len: njnt * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.jnt_axis
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 3))
    }
  }
  /// stiffness coefficient                    (njnt x 1)
  @inlinable
  public var jntStiffness: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.jnt_stiffness, object: _storage, len: njnt * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.jnt_stiffness
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 1))
    }
  }
  /// joint limits                             (njnt x 2)
  @inlinable
  public var jntRange: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.jnt_range, object: _storage, len: njnt * 2) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.jnt_range
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 2))
    }
  }
  /// min distance for limit detection         (njnt x 1)
  @inlinable
  public var jntMargin: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.jnt_margin, object: _storage, len: njnt * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.jnt_margin
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 1))
    }
  }
  /// user data                                (njnt x nuser_jnt)
  @inlinable
  public var jntUser: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.jnt_user, object: _storage, len: njnt * nuserJnt) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.jnt_user
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * nuserJnt))
    }
  }
  /// id of dof's body                         (nv x 1)
  @inlinable
  public var dofBodyid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.dof_bodyid, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.dof_bodyid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// id of dof's joint                        (nv x 1)
  @inlinable
  public var dofJntid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.dof_jntid, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.dof_jntid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// id of dof's parent; -1: none             (nv x 1)
  @inlinable
  public var dofParentid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.dof_parentid, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.dof_parentid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// dof address in M-diagonal                (nv x 1)
  @inlinable
  public var dofMadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.dof_Madr, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.dof_Madr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// number of consecutive simple dofs        (nv x 1)
  @inlinable
  public var dofSimplenum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.dof_simplenum, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.dof_simplenum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// constraint solver reference:frictionloss (nv x mjNREF)
  @inlinable
  public var dofSolref: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.dof_solref, object: _storage, len: nv * mjNREF) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.dof_solref
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * mjNREF))
    }
  }
  /// constraint solver impedance:frictionloss (nv x mjNIMP)
  @inlinable
  public var dofSolimp: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.dof_solimp, object: _storage, len: nv * mjNIMP) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.dof_solimp
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * mjNIMP))
    }
  }
  /// dof friction loss                        (nv x 1)
  @inlinable
  public var dofFrictionloss: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.dof_frictionloss, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.dof_frictionloss
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// dof armature inertia/mass                (nv x 1)
  @inlinable
  public var dofArmature: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.dof_armature, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.dof_armature
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// damping coefficient                      (nv x 1)
  @inlinable
  public var dofDamping: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.dof_damping, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.dof_damping
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// diag. inverse inertia in qpos0           (nv x 1)
  @inlinable
  public var dofInvweight0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.dof_invweight0, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.dof_invweight0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// diag. inertia in qpos0                   (nv x 1)
  @inlinable
  public var dofM0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.dof_M0, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.dof_M0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// geometric type (mjtGeom)                 (ngeom x 1)
  @inlinable
  public var geomType: MjArray<MjtGeom> {
    get {
      MjArray<MjtGeom>(
        array: UnsafeMutableRawPointer(_model.pointee.geom_type).assumingMemoryBound(
          to: MjtGeom.self), object: _storage, len: ngeom * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjtGeom> = UnsafeMutableRawPointer(
        _model.pointee.geom_type
      ).assumingMemoryBound(to: MjtGeom.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  /// geom contact type                        (ngeom x 1)
  @inlinable
  public var geomContype: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.geom_contype, object: _storage, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.geom_contype
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  /// geom contact affinity                    (ngeom x 1)
  @inlinable
  public var geomConaffinity: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.geom_conaffinity, object: _storage, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.geom_conaffinity
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  /// contact dimensionality (1, 3, 4, 6)      (ngeom x 1)
  @inlinable
  public var geomCondim: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.geom_condim, object: _storage, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.geom_condim
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  /// id of geom's body                        (ngeom x 1)
  @inlinable
  public var geomBodyid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.geom_bodyid, object: _storage, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.geom_bodyid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  /// id of geom's mesh/hfield (-1: none)      (ngeom x 1)
  @inlinable
  public var geomDataid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.geom_dataid, object: _storage, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.geom_dataid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  /// material id for rendering                (ngeom x 1)
  @inlinable
  public var geomMatid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.geom_matid, object: _storage, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.geom_matid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  /// group for visibility                     (ngeom x 1)
  @inlinable
  public var geomGroup: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.geom_group, object: _storage, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.geom_group
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  /// geom contact priority                    (ngeom x 1)
  @inlinable
  public var geomPriority: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.geom_priority, object: _storage, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.geom_priority
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  /// same as body frame (1) or iframe (2)     (ngeom x 1)
  @inlinable
  public var geomSameframe: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.geom_sameframe, object: _storage, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.geom_sameframe
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  /// mixing coef for solref/imp in geom pair  (ngeom x 1)
  @inlinable
  public var geomSolmix: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.geom_solmix, object: _storage, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_solmix
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  /// constraint solver reference: contact     (ngeom x mjNREF)
  @inlinable
  public var geomSolref: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.geom_solref, object: _storage, len: ngeom * mjNREF)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_solref
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * mjNREF))
    }
  }
  /// constraint solver impedance: contact     (ngeom x mjNIMP)
  @inlinable
  public var geomSolimp: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.geom_solimp, object: _storage, len: ngeom * mjNIMP)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_solimp
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * mjNIMP))
    }
  }
  /// geom-specific size parameters            (ngeom x 3)
  @inlinable
  public var geomSize: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.geom_size, object: _storage, len: ngeom * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_size
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 3))
    }
  }
  /// radius of bounding sphere                (ngeom x 1)
  @inlinable
  public var geomRbound: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.geom_rbound, object: _storage, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_rbound
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  /// local position offset rel. to body       (ngeom x 3)
  @inlinable
  public var geomPos: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.geom_pos, object: _storage, len: ngeom * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_pos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 3))
    }
  }
  /// local orientation offset rel. to body    (ngeom x 4)
  @inlinable
  public var geomQuat: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.geom_quat, object: _storage, len: ngeom * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_quat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 4))
    }
  }
  /// friction for (slide, spin, roll)         (ngeom x 3)
  @inlinable
  public var geomFriction: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.geom_friction, object: _storage, len: ngeom * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_friction
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 3))
    }
  }
  /// detect contact if dist<margin            (ngeom x 1)
  @inlinable
  public var geomMargin: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.geom_margin, object: _storage, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_margin
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  /// include in solver if dist<margin-gap     (ngeom x 1)
  @inlinable
  public var geomGap: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.geom_gap, object: _storage, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_gap
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  /// fluid interaction parameters             (ngeom x mjNFLUID)
  @inlinable
  public var geomFluid: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.geom_fluid, object: _storage, len: ngeom * mjNFLUID)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_fluid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * mjNFLUID))
    }
  }
  /// user data                                (ngeom x nuser_geom)
  @inlinable
  public var geomUser: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.geom_user, object: _storage, len: ngeom * nuserGeom)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.geom_user
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * nuserGeom))
    }
  }
  /// rgba when material is omitted            (ngeom x 4)
  @inlinable
  public var geomRgba: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.geom_rgba, object: _storage, len: ngeom * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.geom_rgba
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 4))
    }
  }
  /// geom type for rendering (mjtGeom)        (nsite x 1)
  @inlinable
  public var siteType: MjArray<MjtGeom> {
    get {
      MjArray<MjtGeom>(
        array: UnsafeMutableRawPointer(_model.pointee.site_type).assumingMemoryBound(
          to: MjtGeom.self), object: _storage, len: nsite * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjtGeom> = UnsafeMutableRawPointer(
        _model.pointee.site_type
      ).assumingMemoryBound(to: MjtGeom.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 1))
    }
  }
  /// id of site's body                        (nsite x 1)
  @inlinable
  public var siteBodyid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.site_bodyid, object: _storage, len: nsite * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.site_bodyid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 1))
    }
  }
  /// material id for rendering                (nsite x 1)
  @inlinable
  public var siteMatid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.site_matid, object: _storage, len: nsite * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.site_matid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 1))
    }
  }
  /// group for visibility                     (nsite x 1)
  @inlinable
  public var siteGroup: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.site_group, object: _storage, len: nsite * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.site_group
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 1))
    }
  }
  /// same as body frame (1) or iframe (2)     (nsite x 1)
  @inlinable
  public var siteSameframe: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.site_sameframe, object: _storage, len: nsite * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.site_sameframe
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 1))
    }
  }
  /// geom size for rendering                  (nsite x 3)
  @inlinable
  public var siteSize: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.site_size, object: _storage, len: nsite * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.site_size
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 3))
    }
  }
  /// local position offset rel. to body       (nsite x 3)
  @inlinable
  public var sitePos: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.site_pos, object: _storage, len: nsite * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.site_pos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 3))
    }
  }
  /// local orientation offset rel. to body    (nsite x 4)
  @inlinable
  public var siteQuat: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.site_quat, object: _storage, len: nsite * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.site_quat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 4))
    }
  }
  /// user data                                (nsite x nuser_site)
  @inlinable
  public var siteUser: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.site_user, object: _storage, len: nsite * nuserSite)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.site_user
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * nuserSite))
    }
  }
  /// rgba when material is omitted            (nsite x 4)
  @inlinable
  public var siteRgba: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.site_rgba, object: _storage, len: nsite * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.site_rgba
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 4))
    }
  }
  /// camera tracking mode (mjtCamLight)       (ncam x 1)
  @inlinable
  public var camMode: MjArray<MjtCamLight> {
    get {
      MjArray<MjtCamLight>(
        array: UnsafeMutableRawPointer(_model.pointee.cam_mode).assumingMemoryBound(
          to: MjtCamLight.self), object: _storage, len: ncam * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjtCamLight> = UnsafeMutableRawPointer(
        _model.pointee.cam_mode
      ).assumingMemoryBound(to: MjtCamLight.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 1))
    }
  }
  /// id of camera's body                      (ncam x 1)
  @inlinable
  public var camBodyid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.cam_bodyid, object: _storage, len: ncam * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.cam_bodyid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 1))
    }
  }
  /// id of targeted body; -1: none            (ncam x 1)
  @inlinable
  public var camTargetbodyid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.cam_targetbodyid, object: _storage, len: ncam * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.cam_targetbodyid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 1))
    }
  }
  /// position rel. to body frame              (ncam x 3)
  @inlinable
  public var camPos: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.cam_pos, object: _storage, len: ncam * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.cam_pos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 3))
    }
  }
  /// orientation rel. to body frame           (ncam x 4)
  @inlinable
  public var camQuat: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.cam_quat, object: _storage, len: ncam * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.cam_quat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 4))
    }
  }
  /// global position rel. to sub-com in qpos0 (ncam x 3)
  @inlinable
  public var camPoscom0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.cam_poscom0, object: _storage, len: ncam * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.cam_poscom0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 3))
    }
  }
  /// global position rel. to body in qpos0    (ncam x 3)
  @inlinable
  public var camPos0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.cam_pos0, object: _storage, len: ncam * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.cam_pos0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 3))
    }
  }
  /// global orientation in qpos0              (ncam x 9)
  @inlinable
  public var camMat0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.cam_mat0, object: _storage, len: ncam * 9) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.cam_mat0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 9))
    }
  }
  /// y-field of view (deg)                    (ncam x 1)
  @inlinable
  public var camFovy: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.cam_fovy, object: _storage, len: ncam * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.cam_fovy
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 1))
    }
  }
  /// inter-pupilary distance                  (ncam x 1)
  @inlinable
  public var camIpd: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.cam_ipd, object: _storage, len: ncam * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.cam_ipd
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 1))
    }
  }
  /// user data                                (ncam x nuser_cam)
  @inlinable
  public var camUser: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.cam_user, object: _storage, len: ncam * nuserCam) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.cam_user
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * nuserCam))
    }
  }
  /// light tracking mode (mjtCamLight)        (nlight x 1)
  @inlinable
  public var lightMode: MjArray<MjtCamLight> {
    get {
      MjArray<MjtCamLight>(
        array: UnsafeMutableRawPointer(_model.pointee.light_mode).assumingMemoryBound(
          to: MjtCamLight.self), object: _storage, len: nlight * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjtCamLight> = UnsafeMutableRawPointer(
        _model.pointee.light_mode
      ).assumingMemoryBound(to: MjtCamLight.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 1))
    }
  }
  /// id of light's body                       (nlight x 1)
  @inlinable
  public var lightBodyid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.light_bodyid, object: _storage, len: nlight * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.light_bodyid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 1))
    }
  }
  /// id of targeted body; -1: none            (nlight x 1)
  @inlinable
  public var lightTargetbodyid: MjArray<Int32> {
    get {
      MjArray<Int32>(array: _model.pointee.light_targetbodyid, object: _storage, len: nlight * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.light_targetbodyid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 1))
    }
  }
  /// directional light                        (nlight x 1)
  @inlinable
  public var lightDirectional: MjArray<UInt8> {
    get {
      MjArray<UInt8>(array: _model.pointee.light_directional, object: _storage, len: nlight * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.light_directional
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 1))
    }
  }
  /// does light cast shadows                  (nlight x 1)
  @inlinable
  public var lightCastshadow: MjArray<UInt8> {
    get {
      MjArray<UInt8>(array: _model.pointee.light_castshadow, object: _storage, len: nlight * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.light_castshadow
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 1))
    }
  }
  /// is light on                              (nlight x 1)
  @inlinable
  public var lightActive: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.light_active, object: _storage, len: nlight * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.light_active
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 1))
    }
  }
  /// position rel. to body frame              (nlight x 3)
  @inlinable
  public var lightPos: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.light_pos, object: _storage, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.light_pos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  /// direction rel. to body frame             (nlight x 3)
  @inlinable
  public var lightDir: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.light_dir, object: _storage, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.light_dir
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  /// global position rel. to sub-com in qpos0 (nlight x 3)
  @inlinable
  public var lightPoscom0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.light_poscom0, object: _storage, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.light_poscom0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  /// global position rel. to body in qpos0    (nlight x 3)
  @inlinable
  public var lightPos0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.light_pos0, object: _storage, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.light_pos0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  /// global direction in qpos0                (nlight x 3)
  @inlinable
  public var lightDir0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.light_dir0, object: _storage, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.light_dir0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  /// OpenGL attenuation (quadratic model)     (nlight x 3)
  @inlinable
  public var lightAttenuation: MjArray<Float> {
    get {
      MjArray<Float>(array: _model.pointee.light_attenuation, object: _storage, len: nlight * 3)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.light_attenuation
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  /// OpenGL cutoff                            (nlight x 1)
  @inlinable
  public var lightCutoff: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.light_cutoff, object: _storage, len: nlight * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.light_cutoff
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 1))
    }
  }
  /// OpenGL exponent                          (nlight x 1)
  @inlinable
  public var lightExponent: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.light_exponent, object: _storage, len: nlight * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.light_exponent
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 1))
    }
  }
  /// ambient rgb (alpha=1)                    (nlight x 3)
  @inlinable
  public var lightAmbient: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.light_ambient, object: _storage, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.light_ambient
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  /// diffuse rgb (alpha=1)                    (nlight x 3)
  @inlinable
  public var lightDiffuse: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.light_diffuse, object: _storage, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.light_diffuse
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  /// specular rgb (alpha=1)                   (nlight x 3)
  @inlinable
  public var lightSpecular: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.light_specular, object: _storage, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.light_specular
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  /// first vertex address                     (nmesh x 1)
  @inlinable
  public var meshVertadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.mesh_vertadr, object: _storage, len: nmesh * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.mesh_vertadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmesh * 1))
    }
  }
  /// number of vertices                       (nmesh x 1)
  @inlinable
  public var meshVertnum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.mesh_vertnum, object: _storage, len: nmesh * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.mesh_vertnum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmesh * 1))
    }
  }
  /// texcoord data address; -1: no texcoord   (nmesh x 1)
  @inlinable
  public var meshTexcoordadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.mesh_texcoordadr, object: _storage, len: nmesh * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.mesh_texcoordadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmesh * 1))
    }
  }
  /// first face address                       (nmesh x 1)
  @inlinable
  public var meshFaceadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.mesh_faceadr, object: _storage, len: nmesh * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.mesh_faceadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmesh * 1))
    }
  }
  /// number of faces                          (nmesh x 1)
  @inlinable
  public var meshFacenum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.mesh_facenum, object: _storage, len: nmesh * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.mesh_facenum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmesh * 1))
    }
  }
  /// graph data address; -1: no graph         (nmesh x 1)
  @inlinable
  public var meshGraphadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.mesh_graphadr, object: _storage, len: nmesh * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.mesh_graphadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmesh * 1))
    }
  }
  /// vertex positions for all meshe           (nmeshvert x 3)
  @inlinable
  public var meshVert: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.mesh_vert, object: _storage, len: nmeshvert * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.mesh_vert
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmeshvert * 3))
    }
  }
  /// vertex normals for all meshes            (nmeshvert x 3)
  @inlinable
  public var meshNormal: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.mesh_normal, object: _storage, len: nmeshvert * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.mesh_normal
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmeshvert * 3))
    }
  }
  /// vertex texcoords for all meshes          (nmeshtexvert x 2)
  @inlinable
  public var meshTexcoord: MjArray<Float> {
    get {
      MjArray<Float>(array: _model.pointee.mesh_texcoord, object: _storage, len: nmeshtexvert * 2)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.mesh_texcoord
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmeshtexvert * 2))
    }
  }
  /// triangle face data                       (nmeshface x 3)
  @inlinable
  public var meshFace: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.mesh_face, object: _storage, len: nmeshface * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.mesh_face
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmeshface * 3))
    }
  }
  /// convex graph data                        (nmeshgraph x 1)
  @inlinable
  public var meshGraph: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.mesh_graph, object: _storage, len: nmeshgraph * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.mesh_graph
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmeshgraph * 1))
    }
  }
  /// skin material id; -1: none               (nskin x 1)
  @inlinable
  public var skinMatid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_matid, object: _storage, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_matid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  /// group for visibility                     (nskin x 1)
  @inlinable
  public var skinGroup: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_group, object: _storage, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_group
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  /// skin rgba                                (nskin x 4)
  @inlinable
  public var skinRgba: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.skin_rgba, object: _storage, len: nskin * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.skin_rgba
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 4))
    }
  }
  /// inflate skin in normal direction         (nskin x 1)
  @inlinable
  public var skinInflate: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.skin_inflate, object: _storage, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.skin_inflate
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  /// first vertex address                     (nskin x 1)
  @inlinable
  public var skinVertadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_vertadr, object: _storage, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_vertadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  /// number of vertices                       (nskin x 1)
  @inlinable
  public var skinVertnum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_vertnum, object: _storage, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_vertnum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  /// texcoord data address; -1: no texcoord   (nskin x 1)
  @inlinable
  public var skinTexcoordadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_texcoordadr, object: _storage, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_texcoordadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  /// first face address                       (nskin x 1)
  @inlinable
  public var skinFaceadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_faceadr, object: _storage, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_faceadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  /// number of faces                          (nskin x 1)
  @inlinable
  public var skinFacenum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_facenum, object: _storage, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_facenum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  /// first bone in skin                       (nskin x 1)
  @inlinable
  public var skinBoneadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_boneadr, object: _storage, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_boneadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  /// number of bones in skin                  (nskin x 1)
  @inlinable
  public var skinBonenum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_bonenum, object: _storage, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_bonenum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  /// vertex positions for all skin meshes     (nskinvert x 3)
  @inlinable
  public var skinVert: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.skin_vert, object: _storage, len: nskinvert * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.skin_vert
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskinvert * 3))
    }
  }
  /// vertex texcoords for all skin meshes     (nskintexvert x 2)
  @inlinable
  public var skinTexcoord: MjArray<Float> {
    get {
      MjArray<Float>(array: _model.pointee.skin_texcoord, object: _storage, len: nskintexvert * 2)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.skin_texcoord
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskintexvert * 2))
    }
  }
  /// triangle faces for all skin meshes       (nskinface x 3)
  @inlinable
  public var skinFace: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.skin_face, object: _storage, len: nskinface * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_face
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskinface * 3))
    }
  }
  /// first vertex in each bone                (nskinbone x 1)
  @inlinable
  public var skinBonevertadr: MjArray<Int32> {
    get {
      MjArray<Int32>(array: _model.pointee.skin_bonevertadr, object: _storage, len: nskinbone * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_bonevertadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskinbone * 1))
    }
  }
  /// number of vertices in each bone          (nskinbone x 1)
  @inlinable
  public var skinBonevertnum: MjArray<Int32> {
    get {
      MjArray<Int32>(array: _model.pointee.skin_bonevertnum, object: _storage, len: nskinbone * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_bonevertnum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskinbone * 1))
    }
  }
  /// bind pos of each bone                    (nskinbone x 3)
  @inlinable
  public var skinBonebindpos: MjArray<Float> {
    get {
      MjArray<Float>(array: _model.pointee.skin_bonebindpos, object: _storage, len: nskinbone * 3)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.skin_bonebindpos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskinbone * 3))
    }
  }
  /// bind quat of each bone                   (nskinbone x 4)
  @inlinable
  public var skinBonebindquat: MjArray<Float> {
    get {
      MjArray<Float>(array: _model.pointee.skin_bonebindquat, object: _storage, len: nskinbone * 4)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.skin_bonebindquat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskinbone * 4))
    }
  }
  /// body id of each bone                     (nskinbone x 1)
  @inlinable
  public var skinBonebodyid: MjArray<Int32> {
    get {
      MjArray<Int32>(array: _model.pointee.skin_bonebodyid, object: _storage, len: nskinbone * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_bonebodyid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskinbone * 1))
    }
  }
  /// mesh ids of vertices in each bone        (nskinbonevert x 1)
  @inlinable
  public var skinBonevertid: MjArray<Int32> {
    get {
      MjArray<Int32>(
        array: _model.pointee.skin_bonevertid, object: _storage, len: nskinbonevert * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.skin_bonevertid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskinbonevert * 1))
    }
  }
  /// weights of vertices in each bone         (nskinbonevert x 1)
  @inlinable
  public var skinBonevertweight: MjArray<Float> {
    get {
      MjArray<Float>(
        array: _model.pointee.skin_bonevertweight, object: _storage, len: nskinbonevert * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.skin_bonevertweight
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskinbonevert * 1))
    }
  }
  /// (x, y, z_top, z_bottom)                  (nhfield x 4)
  @inlinable
  public var hfieldSize: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.hfield_size, object: _storage, len: nhfield * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.hfield_size
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nhfield * 4))
    }
  }
  /// number of rows in grid                   (nhfield x 1)
  @inlinable
  public var hfieldNrow: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.hfield_nrow, object: _storage, len: nhfield * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.hfield_nrow
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nhfield * 1))
    }
  }
  /// number of columns in grid                (nhfield x 1)
  @inlinable
  public var hfieldNcol: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.hfield_ncol, object: _storage, len: nhfield * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.hfield_ncol
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nhfield * 1))
    }
  }
  /// address in hfield_data                   (nhfield x 1)
  @inlinable
  public var hfieldAdr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.hfield_adr, object: _storage, len: nhfield * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.hfield_adr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nhfield * 1))
    }
  }
  /// elevation data                           (nhfielddata x 1)
  @inlinable
  public var hfieldData: MjArray<Float> {
    get {
      MjArray<Float>(array: _model.pointee.hfield_data, object: _storage, len: nhfielddata * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.hfield_data
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nhfielddata * 1))
    }
  }
  /// texture type (mjtTexture)                (ntex x 1)
  @inlinable
  public var texType: MjArray<MjtTexture> {
    get {
      MjArray<MjtTexture>(
        array: UnsafeMutableRawPointer(_model.pointee.tex_type).assumingMemoryBound(
          to: MjtTexture.self), object: _storage, len: ntex * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjtTexture> = UnsafeMutableRawPointer(
        _model.pointee.tex_type
      ).assumingMemoryBound(to: MjtTexture.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntex * 1))
    }
  }
  /// number of rows in texture image          (ntex x 1)
  @inlinable
  public var texHeight: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tex_height, object: _storage, len: ntex * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tex_height
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntex * 1))
    }
  }
  /// number of columns in texture image       (ntex x 1)
  @inlinable
  public var texWidth: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tex_width, object: _storage, len: ntex * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tex_width
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntex * 1))
    }
  }
  /// address in rgb                           (ntex x 1)
  @inlinable
  public var texAdr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tex_adr, object: _storage, len: ntex * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tex_adr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntex * 1))
    }
  }
  /// rgb (alpha = 1)                          (ntexdata x 1)
  @inlinable
  public var texRgb: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.tex_rgb, object: _storage, len: ntexdata * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.tex_rgb
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntexdata * 1))
    }
  }
  /// texture id; -1: none                     (nmat x 1)
  @inlinable
  public var matTexid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.mat_texid, object: _storage, len: nmat * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.mat_texid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmat * 1))
    }
  }
  /// make texture cube uniform                (nmat x 1)
  @inlinable
  public var matTexuniform: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.mat_texuniform, object: _storage, len: nmat * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.mat_texuniform
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmat * 1))
    }
  }
  /// texture repetition for 2d mapping        (nmat x 2)
  @inlinable
  public var matTexrepeat: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.mat_texrepeat, object: _storage, len: nmat * 2) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.mat_texrepeat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmat * 2))
    }
  }
  /// emission (x rgb)                         (nmat x 1)
  @inlinable
  public var matEmission: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.mat_emission, object: _storage, len: nmat * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.mat_emission
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmat * 1))
    }
  }
  /// specular (x white)                       (nmat x 1)
  @inlinable
  public var matSpecular: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.mat_specular, object: _storage, len: nmat * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.mat_specular
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmat * 1))
    }
  }
  /// shininess coef                           (nmat x 1)
  @inlinable
  public var matShininess: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.mat_shininess, object: _storage, len: nmat * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.mat_shininess
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmat * 1))
    }
  }
  /// reflectance (0: disable)                 (nmat x 1)
  @inlinable
  public var matReflectance: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.mat_reflectance, object: _storage, len: nmat * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.mat_reflectance
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmat * 1))
    }
  }
  /// rgba                                     (nmat x 4)
  @inlinable
  public var matRgba: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.mat_rgba, object: _storage, len: nmat * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.mat_rgba
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmat * 4))
    }
  }
  /// contact dimensionality                   (npair x 1)
  @inlinable
  public var pairDim: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.pair_dim, object: _storage, len: npair * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.pair_dim
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npair * 1))
    }
  }
  /// id of geom1                              (npair x 1)
  @inlinable
  public var pairGeom1: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.pair_geom1, object: _storage, len: npair * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.pair_geom1
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npair * 1))
    }
  }
  /// id of geom2                              (npair x 1)
  @inlinable
  public var pairGeom2: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.pair_geom2, object: _storage, len: npair * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.pair_geom2
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npair * 1))
    }
  }
  /// (body1+1)<<16 + body2+1                  (npair x 1)
  @inlinable
  public var pairSignature: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.pair_signature, object: _storage, len: npair * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.pair_signature
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npair * 1))
    }
  }
  /// constraint solver reference: contact     (npair x mjNREF)
  @inlinable
  public var pairSolref: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.pair_solref, object: _storage, len: npair * mjNREF)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.pair_solref
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npair * mjNREF))
    }
  }
  /// constraint solver impedance: contact     (npair x mjNIMP)
  @inlinable
  public var pairSolimp: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.pair_solimp, object: _storage, len: npair * mjNIMP)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.pair_solimp
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npair * mjNIMP))
    }
  }
  /// detect contact if dist<margin            (npair x 1)
  @inlinable
  public var pairMargin: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.pair_margin, object: _storage, len: npair * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.pair_margin
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npair * 1))
    }
  }
  /// include in solver if dist<margin-gap     (npair x 1)
  @inlinable
  public var pairGap: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.pair_gap, object: _storage, len: npair * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.pair_gap
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npair * 1))
    }
  }
  /// tangent1, 2, spin, roll1, 2              (npair x 5)
  @inlinable
  public var pairFriction: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.pair_friction, object: _storage, len: npair * 5) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.pair_friction
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npair * 5))
    }
  }
  /// (body1+1)<<16 + body2+1                  (nexclude x 1)
  @inlinable
  public var excludeSignature: MjArray<Int32> {
    get {
      MjArray<Int32>(array: _model.pointee.exclude_signature, object: _storage, len: nexclude * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.exclude_signature
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nexclude * 1))
    }
  }
  /// constraint type (mjtEq)                  (neq x 1)
  @inlinable
  public var eqType: MjArray<MjtEq> {
    get {
      MjArray<MjtEq>(
        array: UnsafeMutableRawPointer(_model.pointee.eq_type).assumingMemoryBound(to: MjtEq.self),
        object: _storage, len: neq * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjtEq> = UnsafeMutableRawPointer(
        _model.pointee.eq_type
      ).assumingMemoryBound(to: MjtEq.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(neq * 1))
    }
  }
  /// id of object 1                           (neq x 1)
  @inlinable
  public var eqObj1id: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.eq_obj1id, object: _storage, len: neq * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.eq_obj1id
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(neq * 1))
    }
  }
  /// id of object 2                           (neq x 1)
  @inlinable
  public var eqObj2id: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.eq_obj2id, object: _storage, len: neq * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.eq_obj2id
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(neq * 1))
    }
  }
  /// enable/disable constraint                (neq x 1)
  @inlinable
  public var eqActive: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.eq_active, object: _storage, len: neq * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.eq_active
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(neq * 1))
    }
  }
  /// constraint solver reference              (neq x mjNREF)
  @inlinable
  public var eqSolref: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.eq_solref, object: _storage, len: neq * mjNREF) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.eq_solref
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(neq * mjNREF))
    }
  }
  /// constraint solver impedance              (neq x mjNIMP)
  @inlinable
  public var eqSolimp: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.eq_solimp, object: _storage, len: neq * mjNIMP) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.eq_solimp
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(neq * mjNIMP))
    }
  }
  /// numeric data for constraint              (neq x mjNEQDATA)
  @inlinable
  public var eqData: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.eq_data, object: _storage, len: neq * mjNEQDATA) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.eq_data
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(neq * mjNEQDATA))
    }
  }
  /// address of first object in tendon's path (ntendon x 1)
  @inlinable
  public var tendonAdr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tendon_adr, object: _storage, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tendon_adr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  /// number of objects in tendon's path       (ntendon x 1)
  @inlinable
  public var tendonNum: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tendon_num, object: _storage, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tendon_num
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  /// material id for rendering                (ntendon x 1)
  @inlinable
  public var tendonMatid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tendon_matid, object: _storage, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tendon_matid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  /// group for visibility                     (ntendon x 1)
  @inlinable
  public var tendonGroup: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tendon_group, object: _storage, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tendon_group
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  /// does tendon have length limits           (ntendon x 1)
  @inlinable
  public var tendonLimited: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.tendon_limited, object: _storage, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.tendon_limited
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  /// width for rendering                      (ntendon x 1)
  @inlinable
  public var tendonWidth: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.tendon_width, object: _storage, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_width
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  /// constraint solver reference: limit       (ntendon x mjNREF)
  @inlinable
  public var tendonSolrefLim: MjArray<Double> {
    get {
      MjArray<Double>(
        array: _model.pointee.tendon_solref_lim, object: _storage, len: ntendon * mjNREF)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_solref_lim
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * mjNREF))
    }
  }
  /// constraint solver impedance: limit       (ntendon x mjNIMP)
  @inlinable
  public var tendonSolimpLim: MjArray<Double> {
    get {
      MjArray<Double>(
        array: _model.pointee.tendon_solimp_lim, object: _storage, len: ntendon * mjNIMP)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_solimp_lim
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * mjNIMP))
    }
  }
  /// constraint solver reference: friction    (ntendon x mjNREF)
  @inlinable
  public var tendonSolrefFri: MjArray<Double> {
    get {
      MjArray<Double>(
        array: _model.pointee.tendon_solref_fri, object: _storage, len: ntendon * mjNREF)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_solref_fri
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * mjNREF))
    }
  }
  /// constraint solver impedance: friction    (ntendon x mjNIMP)
  @inlinable
  public var tendonSolimpFri: MjArray<Double> {
    get {
      MjArray<Double>(
        array: _model.pointee.tendon_solimp_fri, object: _storage, len: ntendon * mjNIMP)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_solimp_fri
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * mjNIMP))
    }
  }
  /// tendon length limits                     (ntendon x 2)
  @inlinable
  public var tendonRange: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.tendon_range, object: _storage, len: ntendon * 2) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_range
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 2))
    }
  }
  /// min distance for limit detection         (ntendon x 1)
  @inlinable
  public var tendonMargin: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.tendon_margin, object: _storage, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_margin
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  /// stiffness coefficient                    (ntendon x 1)
  @inlinable
  public var tendonStiffness: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.tendon_stiffness, object: _storage, len: ntendon * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_stiffness
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  /// damping coefficient                      (ntendon x 1)
  @inlinable
  public var tendonDamping: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.tendon_damping, object: _storage, len: ntendon * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_damping
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  /// loss due to friction                     (ntendon x 1)
  @inlinable
  public var tendonFrictionloss: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.tendon_frictionloss, object: _storage, len: ntendon * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_frictionloss
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  /// tendon length in qpos_spring             (ntendon x 1)
  @inlinable
  public var tendonLengthspring: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.tendon_lengthspring, object: _storage, len: ntendon * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_lengthspring
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  /// tendon length in qpos0                   (ntendon x 1)
  @inlinable
  public var tendonLength0: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.tendon_length0, object: _storage, len: ntendon * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_length0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  /// inv. weight in qpos0                     (ntendon x 1)
  @inlinable
  public var tendonInvweight0: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.tendon_invweight0, object: _storage, len: ntendon * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_invweight0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  /// user data                                (ntendon x nuser_tendon)
  @inlinable
  public var tendonUser: MjArray<Double> {
    get {
      MjArray<Double>(
        array: _model.pointee.tendon_user, object: _storage, len: ntendon * nuserTendon)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tendon_user
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * nuserTendon))
    }
  }
  /// rgba when material is omitted            (ntendon x 4)
  @inlinable
  public var tendonRgba: MjArray<Float> {
    get { MjArray<Float>(array: _model.pointee.tendon_rgba, object: _storage, len: ntendon * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _model.pointee.tendon_rgba
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 4))
    }
  }
  /// wrap object type (mjtWrap)               (nwrap x 1)
  @inlinable
  public var wrapType: MjArray<MjtWrap> {
    get {
      MjArray<MjtWrap>(
        array: UnsafeMutableRawPointer(_model.pointee.wrap_type).assumingMemoryBound(
          to: MjtWrap.self), object: _storage, len: nwrap * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjtWrap> = UnsafeMutableRawPointer(
        _model.pointee.wrap_type
      ).assumingMemoryBound(to: MjtWrap.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nwrap * 1))
    }
  }
  /// object id: geom, site, joint             (nwrap x 1)
  @inlinable
  public var wrapObjid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.wrap_objid, object: _storage, len: nwrap * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.wrap_objid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nwrap * 1))
    }
  }
  /// divisor, joint coef, or site id          (nwrap x 1)
  @inlinable
  public var wrapPrm: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.wrap_prm, object: _storage, len: nwrap * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.wrap_prm
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nwrap * 1))
    }
  }
  /// transmission type (mjtTrn)               (nu x 1)
  @inlinable
  public var actuatorTrntype: MjArray<MjtTrn> {
    get {
      MjArray<MjtTrn>(
        array: UnsafeMutableRawPointer(_model.pointee.actuator_trntype).assumingMemoryBound(
          to: MjtTrn.self), object: _storage, len: nu * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjtTrn> = UnsafeMutableRawPointer(
        _model.pointee.actuator_trntype
      ).assumingMemoryBound(to: MjtTrn.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  /// dynamics type (mjtDyn)                   (nu x 1)
  @inlinable
  public var actuatorDyntype: MjArray<MjtDyn> {
    get {
      MjArray<MjtDyn>(
        array: UnsafeMutableRawPointer(_model.pointee.actuator_dyntype).assumingMemoryBound(
          to: MjtDyn.self), object: _storage, len: nu * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjtDyn> = UnsafeMutableRawPointer(
        _model.pointee.actuator_dyntype
      ).assumingMemoryBound(to: MjtDyn.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  /// gain type (mjtGain)                      (nu x 1)
  @inlinable
  public var actuatorGaintype: MjArray<MjtGain> {
    get {
      MjArray<MjtGain>(
        array: UnsafeMutableRawPointer(_model.pointee.actuator_gaintype).assumingMemoryBound(
          to: MjtGain.self), object: _storage, len: nu * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjtGain> = UnsafeMutableRawPointer(
        _model.pointee.actuator_gaintype
      ).assumingMemoryBound(to: MjtGain.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  /// bias type (mjtBias)                      (nu x 1)
  @inlinable
  public var actuatorBiastype: MjArray<MjtBias> {
    get {
      MjArray<MjtBias>(
        array: UnsafeMutableRawPointer(_model.pointee.actuator_biastype).assumingMemoryBound(
          to: MjtBias.self), object: _storage, len: nu * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjtBias> = UnsafeMutableRawPointer(
        _model.pointee.actuator_biastype
      ).assumingMemoryBound(to: MjtBias.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  /// transmission id: joint, tendon, site     (nu x 2)
  @inlinable
  public var actuatorTrnid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.actuator_trnid, object: _storage, len: nu * 2) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.actuator_trnid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 2))
    }
  }
  /// group for visibility                     (nu x 1)
  @inlinable
  public var actuatorGroup: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.actuator_group, object: _storage, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.actuator_group
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  /// is control limited                       (nu x 1)
  @inlinable
  public var actuatorCtrllimited: MjArray<UInt8> {
    get {
      MjArray<UInt8>(array: _model.pointee.actuator_ctrllimited, object: _storage, len: nu * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.actuator_ctrllimited
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  /// is force limited                         (nu x 1)
  @inlinable
  public var actuatorForcelimited: MjArray<UInt8> {
    get {
      MjArray<UInt8>(array: _model.pointee.actuator_forcelimited, object: _storage, len: nu * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.actuator_forcelimited
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  /// is activation limited                    (nu x 1)
  @inlinable
  public var actuatorActlimited: MjArray<UInt8> {
    get { MjArray<UInt8>(array: _model.pointee.actuator_actlimited, object: _storage, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt8> = _model.pointee.actuator_actlimited
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  /// dynamics parameters                      (nu x mjNDYN)
  @inlinable
  public var actuatorDynprm: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.actuator_dynprm, object: _storage, len: nu * mjNDYN)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_dynprm
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * mjNDYN))
    }
  }
  /// gain parameters                          (nu x mjNGAIN)
  @inlinable
  public var actuatorGainprm: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.actuator_gainprm, object: _storage, len: nu * mjNGAIN)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_gainprm
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * mjNGAIN))
    }
  }
  /// bias parameters                          (nu x mjNBIAS)
  @inlinable
  public var actuatorBiasprm: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.actuator_biasprm, object: _storage, len: nu * mjNBIAS)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_biasprm
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * mjNBIAS))
    }
  }
  /// range of controls                        (nu x 2)
  @inlinable
  public var actuatorCtrlrange: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.actuator_ctrlrange, object: _storage, len: nu * 2) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_ctrlrange
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 2))
    }
  }
  /// range of forces                          (nu x 2)
  @inlinable
  public var actuatorForcerange: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.actuator_forcerange, object: _storage, len: nu * 2)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_forcerange
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 2))
    }
  }
  /// range of activations                     (nu x 2)
  @inlinable
  public var actuatorActrange: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.actuator_actrange, object: _storage, len: nu * 2) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_actrange
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 2))
    }
  }
  /// scale length and transmitted force       (nu x 6)
  @inlinable
  public var actuatorGear: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.actuator_gear, object: _storage, len: nu * 6) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_gear
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 6))
    }
  }
  /// crank length for slider-crank            (nu x 1)
  @inlinable
  public var actuatorCranklength: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.actuator_cranklength, object: _storage, len: nu * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_cranklength
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  /// acceleration from unit force in qpos0    (nu x 1)
  @inlinable
  public var actuatorAcc0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.actuator_acc0, object: _storage, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_acc0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  /// actuator length in qpos0                 (nu x 1)
  @inlinable
  public var actuatorLength0: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.actuator_length0, object: _storage, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_length0
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  /// feasible actuator length range           (nu x 2)
  @inlinable
  public var actuatorLengthrange: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.actuator_lengthrange, object: _storage, len: nu * 2)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_lengthrange
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 2))
    }
  }
  /// user data                                (nu x nuser_actuator)
  @inlinable
  public var actuatorUser: MjArray<Double> {
    get {
      MjArray<Double>(
        array: _model.pointee.actuator_user, object: _storage, len: nu * nuserActuator)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.actuator_user
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * nuserActuator))
    }
  }
  /// sensor type (mjtSensor)                  (nsensor x 1)
  @inlinable
  public var sensorType: MjArray<MjtSensor> {
    get {
      MjArray<MjtSensor>(
        array: UnsafeMutableRawPointer(_model.pointee.sensor_type).assumingMemoryBound(
          to: MjtSensor.self), object: _storage, len: nsensor * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjtSensor> = UnsafeMutableRawPointer(
        _model.pointee.sensor_type
      ).assumingMemoryBound(to: MjtSensor.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  /// numeric data type (mjtDataType)          (nsensor x 1)
  @inlinable
  public var sensorDatatype: MjArray<MjtDataType> {
    get {
      MjArray<MjtDataType>(
        array: UnsafeMutableRawPointer(_model.pointee.sensor_datatype).assumingMemoryBound(
          to: MjtDataType.self), object: _storage, len: nsensor * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjtDataType> = UnsafeMutableRawPointer(
        _model.pointee.sensor_datatype
      ).assumingMemoryBound(to: MjtDataType.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  /// required compute stage (mjtStage)        (nsensor x 1)
  @inlinable
  public var sensorNeedstage: MjArray<MjtStage> {
    get {
      MjArray<MjtStage>(
        array: UnsafeMutableRawPointer(_model.pointee.sensor_needstage).assumingMemoryBound(
          to: MjtStage.self), object: _storage, len: nsensor * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjtStage> = UnsafeMutableRawPointer(
        _model.pointee.sensor_needstage
      ).assumingMemoryBound(to: MjtStage.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  /// type of sensorized object (mjtObj)       (nsensor x 1)
  @inlinable
  public var sensorObjtype: MjArray<MjtObj> {
    get {
      MjArray<MjtObj>(
        array: UnsafeMutableRawPointer(_model.pointee.sensor_objtype).assumingMemoryBound(
          to: MjtObj.self), object: _storage, len: nsensor * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjtObj> = UnsafeMutableRawPointer(
        _model.pointee.sensor_objtype
      ).assumingMemoryBound(to: MjtObj.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  /// id of sensorized object                  (nsensor x 1)
  @inlinable
  public var sensorObjid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.sensor_objid, object: _storage, len: nsensor * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.sensor_objid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  /// type of reference frame (mjtObj)         (nsensor x 1)
  @inlinable
  public var sensorReftype: MjArray<MjtObj> {
    get {
      MjArray<MjtObj>(
        array: UnsafeMutableRawPointer(_model.pointee.sensor_reftype).assumingMemoryBound(
          to: MjtObj.self), object: _storage, len: nsensor * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjtObj> = UnsafeMutableRawPointer(
        _model.pointee.sensor_reftype
      ).assumingMemoryBound(to: MjtObj.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  /// id of reference frame; -1: global frame  (nsensor x 1)
  @inlinable
  public var sensorRefid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.sensor_refid, object: _storage, len: nsensor * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.sensor_refid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  /// number of scalar outputs                 (nsensor x 1)
  @inlinable
  public var sensorDim: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.sensor_dim, object: _storage, len: nsensor * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.sensor_dim
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  /// address in sensor array                  (nsensor x 1)
  @inlinable
  public var sensorAdr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.sensor_adr, object: _storage, len: nsensor * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.sensor_adr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  /// cutoff for real and positive; 0: ignore  (nsensor x 1)
  @inlinable
  public var sensorCutoff: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.sensor_cutoff, object: _storage, len: nsensor * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.sensor_cutoff
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  /// noise standard deviation                 (nsensor x 1)
  @inlinable
  public var sensorNoise: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.sensor_noise, object: _storage, len: nsensor * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.sensor_noise
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  /// user data                                (nsensor x nuser_sensor)
  @inlinable
  public var sensorUser: MjArray<Double> {
    get {
      MjArray<Double>(
        array: _model.pointee.sensor_user, object: _storage, len: nsensor * nuserSensor)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.sensor_user
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * nuserSensor))
    }
  }
  /// address of field in numeric_data         (nnumeric x 1)
  @inlinable
  public var numericAdr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.numeric_adr, object: _storage, len: nnumeric * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.numeric_adr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nnumeric * 1))
    }
  }
  /// size of numeric field                    (nnumeric x 1)
  @inlinable
  public var numericSize: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.numeric_size, object: _storage, len: nnumeric * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.numeric_size
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nnumeric * 1))
    }
  }
  /// array of all numeric fields              (nnumericdata x 1)
  @inlinable
  public var numericData: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.numeric_data, object: _storage, len: nnumericdata * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.numeric_data
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nnumericdata * 1))
    }
  }
  /// address of text in text_data             (ntext x 1)
  @inlinable
  public var textAdr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.text_adr, object: _storage, len: ntext * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.text_adr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntext * 1))
    }
  }
  /// size of text field (strlen+1)            (ntext x 1)
  @inlinable
  public var textSize: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.text_size, object: _storage, len: ntext * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.text_size
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntext * 1))
    }
  }
  /// array of all text fields (0-terminated)  (ntextdata x 1)
  @inlinable
  public var textData: MjArray<CChar> {
    get { MjArray<CChar>(array: _model.pointee.text_data, object: _storage, len: ntextdata * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<CChar> = _model.pointee.text_data
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntextdata * 1))
    }
  }
  /// address of text in text_data             (ntuple x 1)
  @inlinable
  public var tupleAdr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tuple_adr, object: _storage, len: ntuple * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tuple_adr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntuple * 1))
    }
  }
  /// number of objects in tuple               (ntuple x 1)
  @inlinable
  public var tupleSize: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tuple_size, object: _storage, len: ntuple * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tuple_size
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntuple * 1))
    }
  }
  /// array of object types in all tuples      (ntupledata x 1)
  @inlinable
  public var tupleObjtype: MjArray<Int32> {
    get {
      MjArray<Int32>(array: _model.pointee.tuple_objtype, object: _storage, len: ntupledata * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tuple_objtype
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntupledata * 1))
    }
  }
  /// array of object ids in all tuples        (ntupledata x 1)
  @inlinable
  public var tupleObjid: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.tuple_objid, object: _storage, len: ntupledata * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.tuple_objid
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntupledata * 1))
    }
  }
  /// array of object params in all tuples     (ntupledata x 1)
  @inlinable
  public var tupleObjprm: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.tuple_objprm, object: _storage, len: ntupledata * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.tuple_objprm
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntupledata * 1))
    }
  }
  /// key time                                 (nkey x 1)
  @inlinable
  public var keyTime: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.key_time, object: _storage, len: nkey * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.key_time
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nkey * 1))
    }
  }
  /// key position                             (nkey x nq)
  @inlinable
  public var keyQpos: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.key_qpos, object: _storage, len: nkey * nq) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.key_qpos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nkey * nq))
    }
  }
  /// key velocity                             (nkey x nv)
  @inlinable
  public var keyQvel: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.key_qvel, object: _storage, len: nkey * nv) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.key_qvel
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nkey * nv))
    }
  }
  /// key activation                           (nkey x na)
  @inlinable
  public var keyAct: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.key_act, object: _storage, len: nkey * na) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.key_act
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nkey * na))
    }
  }
  /// key mocap position                       (nkey x 3*nmocap)
  @inlinable
  public var keyMpos: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.key_mpos, object: _storage, len: nkey * 3 * nmocap)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.key_mpos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nkey * 3 * nmocap))
    }
  }
  /// key mocap quaternion                     (nkey x 4*nmocap)
  @inlinable
  public var keyMquat: MjArray<Double> {
    get {
      MjArray<Double>(array: _model.pointee.key_mquat, object: _storage, len: nkey * 4 * nmocap)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.key_mquat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nkey * 4 * nmocap))
    }
  }
  /// key control                              (nkey x nu)
  @inlinable
  public var keyCtrl: MjArray<Double> {
    get { MjArray<Double>(array: _model.pointee.key_ctrl, object: _storage, len: nkey * nu) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _model.pointee.key_ctrl
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nkey * nu))
    }
  }
  /// body name pointers                       (nbody x 1)
  @inlinable
  public var nameBodyadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_bodyadr, object: _storage, len: nbody * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_bodyadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 1))
    }
  }
  /// joint name pointers                      (njnt x 1)
  @inlinable
  public var nameJntadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_jntadr, object: _storage, len: njnt * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_jntadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 1))
    }
  }
  /// geom name pointers                       (ngeom x 1)
  @inlinable
  public var nameGeomadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_geomadr, object: _storage, len: ngeom * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_geomadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 1))
    }
  }
  /// site name pointers                       (nsite x 1)
  @inlinable
  public var nameSiteadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_siteadr, object: _storage, len: nsite * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_siteadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 1))
    }
  }
  /// camera name pointers                     (ncam x 1)
  @inlinable
  public var nameCamadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_camadr, object: _storage, len: ncam * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_camadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 1))
    }
  }
  /// light name pointers                      (nlight x 1)
  @inlinable
  public var nameLightadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_lightadr, object: _storage, len: nlight * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_lightadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 1))
    }
  }
  /// mesh name pointers                       (nmesh x 1)
  @inlinable
  public var nameMeshadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_meshadr, object: _storage, len: nmesh * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_meshadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmesh * 1))
    }
  }
  /// skin name pointers                       (nskin x 1)
  @inlinable
  public var nameSkinadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_skinadr, object: _storage, len: nskin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_skinadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin * 1))
    }
  }
  /// hfield name pointers                     (nhfield x 1)
  @inlinable
  public var nameHfieldadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_hfieldadr, object: _storage, len: nhfield * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_hfieldadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nhfield * 1))
    }
  }
  /// texture name pointers                    (ntex x 1)
  @inlinable
  public var nameTexadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_texadr, object: _storage, len: ntex * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_texadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntex * 1))
    }
  }
  /// material name pointers                   (nmat x 1)
  @inlinable
  public var nameMatadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_matadr, object: _storage, len: nmat * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_matadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmat * 1))
    }
  }
  /// geom pair name pointers                  (npair x 1)
  @inlinable
  public var namePairadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_pairadr, object: _storage, len: npair * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_pairadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npair * 1))
    }
  }
  /// exclude name pointers                    (nexclude x 1)
  @inlinable
  public var nameExcludeadr: MjArray<Int32> {
    get {
      MjArray<Int32>(array: _model.pointee.name_excludeadr, object: _storage, len: nexclude * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_excludeadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nexclude * 1))
    }
  }
  /// equality constraint name pointers        (neq x 1)
  @inlinable
  public var nameEqadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_eqadr, object: _storage, len: neq * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_eqadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(neq * 1))
    }
  }
  /// tendon name pointers                     (ntendon x 1)
  @inlinable
  public var nameTendonadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_tendonadr, object: _storage, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_tendonadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  /// actuator name pointers                   (nu x 1)
  @inlinable
  public var nameActuatoradr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_actuatoradr, object: _storage, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_actuatoradr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  /// sensor name pointers                     (nsensor x 1)
  @inlinable
  public var nameSensoradr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_sensoradr, object: _storage, len: nsensor * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_sensoradr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensor * 1))
    }
  }
  /// numeric name pointers                    (nnumeric x 1)
  @inlinable
  public var nameNumericadr: MjArray<Int32> {
    get {
      MjArray<Int32>(array: _model.pointee.name_numericadr, object: _storage, len: nnumeric * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_numericadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nnumeric * 1))
    }
  }
  /// text name pointers                       (ntext x 1)
  @inlinable
  public var nameTextadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_textadr, object: _storage, len: ntext * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_textadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntext * 1))
    }
  }
  /// tuple name pointers                      (ntuple x 1)
  @inlinable
  public var nameTupleadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_tupleadr, object: _storage, len: ntuple * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_tupleadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntuple * 1))
    }
  }
  /// keyframe name pointers                   (nkey x 1)
  @inlinable
  public var nameKeyadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _model.pointee.name_keyadr, object: _storage, len: nkey * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _model.pointee.name_keyadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nkey * 1))
    }
  }
  /// names of all objects, 0-terminated       (nnames x 1)
  @inlinable
  public var names: MjArray<CChar> {
    get { MjArray<CChar>(array: _model.pointee.names, object: _storage, len: nnames * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<CChar> = _model.pointee.names
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nnames * 1))
    }
  }
}
extension MjModel: CustomReflectable {
  public var customMirror: Mirror {
    Mirror(
      self,
      children: [
        "nq": nq, "nv": nv, "nu": nu, "na": na, "nbody": nbody, "njnt": njnt, "ngeom": ngeom,
        "nsite": nsite, "ncam": ncam, "nlight": nlight, "nmesh": nmesh, "nmeshvert": nmeshvert,
        "nmeshtexvert": nmeshtexvert, "nmeshface": nmeshface, "nmeshgraph": nmeshgraph,
        "nskin": nskin, "nskinvert": nskinvert, "nskintexvert": nskintexvert,
        "nskinface": nskinface, "nskinbone": nskinbone, "nskinbonevert": nskinbonevert,
        "nhfield": nhfield, "nhfielddata": nhfielddata, "ntex": ntex, "ntexdata": ntexdata,
        "nmat": nmat, "npair": npair, "nexclude": nexclude, "neq": neq, "ntendon": ntendon,
        "nwrap": nwrap, "nsensor": nsensor, "nnumeric": nnumeric, "nnumericdata": nnumericdata,
        "ntext": ntext, "ntextdata": ntextdata, "ntuple": ntuple, "ntupledata": ntupledata,
        "nkey": nkey, "nmocap": nmocap, "nuserBody": nuserBody, "nuserJnt": nuserJnt,
        "nuserGeom": nuserGeom, "nuserSite": nuserSite, "nuserCam": nuserCam,
        "nuserTendon": nuserTendon, "nuserActuator": nuserActuator, "nuserSensor": nuserSensor,
        "nnames": nnames, "nM": nM, "nD": nD, "nemax": nemax, "njmax": njmax, "nconmax": nconmax,
        "nstack": nstack, "nuserdata": nuserdata, "nsensordata": nsensordata, "nbuffer": nbuffer,
        "opt": opt, "vis": vis, "stat": stat, "qpos0": qpos0, "qposSpring": qposSpring,
        "bodyParentid": bodyParentid, "bodyRootid": bodyRootid, "bodyWeldid": bodyWeldid,
        "bodyMocapid": bodyMocapid, "bodyJntnum": bodyJntnum, "bodyJntadr": bodyJntadr,
        "bodyDofnum": bodyDofnum, "bodyDofadr": bodyDofadr, "bodyGeomnum": bodyGeomnum,
        "bodyGeomadr": bodyGeomadr, "bodySimple": bodySimple, "bodySameframe": bodySameframe,
        "bodyPos": bodyPos, "bodyQuat": bodyQuat, "bodyIpos": bodyIpos, "bodyIquat": bodyIquat,
        "bodyMass": bodyMass, "bodySubtreemass": bodySubtreemass, "bodyInertia": bodyInertia,
        "bodyInvweight0": bodyInvweight0, "bodyUser": bodyUser, "jntType": jntType,
        "jntQposadr": jntQposadr, "jntDofadr": jntDofadr, "jntBodyid": jntBodyid,
        "jntGroup": jntGroup, "jntLimited": jntLimited, "jntSolref": jntSolref,
        "jntSolimp": jntSolimp, "jntPos": jntPos, "jntAxis": jntAxis, "jntStiffness": jntStiffness,
        "jntRange": jntRange, "jntMargin": jntMargin, "jntUser": jntUser, "dofBodyid": dofBodyid,
        "dofJntid": dofJntid, "dofParentid": dofParentid, "dofMadr": dofMadr,
        "dofSimplenum": dofSimplenum, "dofSolref": dofSolref, "dofSolimp": dofSolimp,
        "dofFrictionloss": dofFrictionloss, "dofArmature": dofArmature, "dofDamping": dofDamping,
        "dofInvweight0": dofInvweight0, "dofM0": dofM0, "geomType": geomType,
        "geomContype": geomContype, "geomConaffinity": geomConaffinity, "geomCondim": geomCondim,
        "geomBodyid": geomBodyid, "geomDataid": geomDataid, "geomMatid": geomMatid,
        "geomGroup": geomGroup, "geomPriority": geomPriority, "geomSameframe": geomSameframe,
        "geomSolmix": geomSolmix, "geomSolref": geomSolref, "geomSolimp": geomSolimp,
        "geomSize": geomSize, "geomRbound": geomRbound, "geomPos": geomPos, "geomQuat": geomQuat,
        "geomFriction": geomFriction, "geomMargin": geomMargin, "geomGap": geomGap,
        "geomFluid": geomFluid, "geomUser": geomUser, "geomRgba": geomRgba, "siteType": siteType,
        "siteBodyid": siteBodyid, "siteMatid": siteMatid, "siteGroup": siteGroup,
        "siteSameframe": siteSameframe, "siteSize": siteSize, "sitePos": sitePos,
        "siteQuat": siteQuat, "siteUser": siteUser, "siteRgba": siteRgba, "camMode": camMode,
        "camBodyid": camBodyid, "camTargetbodyid": camTargetbodyid, "camPos": camPos,
        "camQuat": camQuat, "camPoscom0": camPoscom0, "camPos0": camPos0, "camMat0": camMat0,
        "camFovy": camFovy, "camIpd": camIpd, "camUser": camUser, "lightMode": lightMode,
        "lightBodyid": lightBodyid, "lightTargetbodyid": lightTargetbodyid,
        "lightDirectional": lightDirectional, "lightCastshadow": lightCastshadow,
        "lightActive": lightActive, "lightPos": lightPos, "lightDir": lightDir,
        "lightPoscom0": lightPoscom0, "lightPos0": lightPos0, "lightDir0": lightDir0,
        "lightAttenuation": lightAttenuation, "lightCutoff": lightCutoff,
        "lightExponent": lightExponent, "lightAmbient": lightAmbient, "lightDiffuse": lightDiffuse,
        "lightSpecular": lightSpecular, "meshVertadr": meshVertadr, "meshVertnum": meshVertnum,
        "meshTexcoordadr": meshTexcoordadr, "meshFaceadr": meshFaceadr, "meshFacenum": meshFacenum,
        "meshGraphadr": meshGraphadr, "meshVert": meshVert, "meshNormal": meshNormal,
        "meshTexcoord": meshTexcoord, "meshFace": meshFace, "meshGraph": meshGraph,
        "skinMatid": skinMatid, "skinGroup": skinGroup, "skinRgba": skinRgba,
        "skinInflate": skinInflate, "skinVertadr": skinVertadr, "skinVertnum": skinVertnum,
        "skinTexcoordadr": skinTexcoordadr, "skinFaceadr": skinFaceadr, "skinFacenum": skinFacenum,
        "skinBoneadr": skinBoneadr, "skinBonenum": skinBonenum, "skinVert": skinVert,
        "skinTexcoord": skinTexcoord, "skinFace": skinFace, "skinBonevertadr": skinBonevertadr,
        "skinBonevertnum": skinBonevertnum, "skinBonebindpos": skinBonebindpos,
        "skinBonebindquat": skinBonebindquat, "skinBonebodyid": skinBonebodyid,
        "skinBonevertid": skinBonevertid, "skinBonevertweight": skinBonevertweight,
        "hfieldSize": hfieldSize, "hfieldNrow": hfieldNrow, "hfieldNcol": hfieldNcol,
        "hfieldAdr": hfieldAdr, "hfieldData": hfieldData, "texType": texType,
        "texHeight": texHeight, "texWidth": texWidth, "texAdr": texAdr, "texRgb": texRgb,
        "matTexid": matTexid, "matTexuniform": matTexuniform, "matTexrepeat": matTexrepeat,
        "matEmission": matEmission, "matSpecular": matSpecular, "matShininess": matShininess,
        "matReflectance": matReflectance, "matRgba": matRgba, "pairDim": pairDim,
        "pairGeom1": pairGeom1, "pairGeom2": pairGeom2, "pairSignature": pairSignature,
        "pairSolref": pairSolref, "pairSolimp": pairSolimp, "pairMargin": pairMargin,
        "pairGap": pairGap, "pairFriction": pairFriction, "excludeSignature": excludeSignature,
        "eqType": eqType, "eqObj1id": eqObj1id, "eqObj2id": eqObj2id, "eqActive": eqActive,
        "eqSolref": eqSolref, "eqSolimp": eqSolimp, "eqData": eqData, "tendonAdr": tendonAdr,
        "tendonNum": tendonNum, "tendonMatid": tendonMatid, "tendonGroup": tendonGroup,
        "tendonLimited": tendonLimited, "tendonWidth": tendonWidth,
        "tendonSolrefLim": tendonSolrefLim, "tendonSolimpLim": tendonSolimpLim,
        "tendonSolrefFri": tendonSolrefFri, "tendonSolimpFri": tendonSolimpFri,
        "tendonRange": tendonRange, "tendonMargin": tendonMargin,
        "tendonStiffness": tendonStiffness, "tendonDamping": tendonDamping,
        "tendonFrictionloss": tendonFrictionloss, "tendonLengthspring": tendonLengthspring,
        "tendonLength0": tendonLength0, "tendonInvweight0": tendonInvweight0,
        "tendonUser": tendonUser, "tendonRgba": tendonRgba, "wrapType": wrapType,
        "wrapObjid": wrapObjid, "wrapPrm": wrapPrm, "actuatorTrntype": actuatorTrntype,
        "actuatorDyntype": actuatorDyntype, "actuatorGaintype": actuatorGaintype,
        "actuatorBiastype": actuatorBiastype, "actuatorTrnid": actuatorTrnid,
        "actuatorGroup": actuatorGroup, "actuatorCtrllimited": actuatorCtrllimited,
        "actuatorForcelimited": actuatorForcelimited, "actuatorActlimited": actuatorActlimited,
        "actuatorDynprm": actuatorDynprm, "actuatorGainprm": actuatorGainprm,
        "actuatorBiasprm": actuatorBiasprm, "actuatorCtrlrange": actuatorCtrlrange,
        "actuatorForcerange": actuatorForcerange, "actuatorActrange": actuatorActrange,
        "actuatorGear": actuatorGear, "actuatorCranklength": actuatorCranklength,
        "actuatorAcc0": actuatorAcc0, "actuatorLength0": actuatorLength0,
        "actuatorLengthrange": actuatorLengthrange, "actuatorUser": actuatorUser,
        "sensorType": sensorType, "sensorDatatype": sensorDatatype,
        "sensorNeedstage": sensorNeedstage, "sensorObjtype": sensorObjtype,
        "sensorObjid": sensorObjid, "sensorReftype": sensorReftype, "sensorRefid": sensorRefid,
        "sensorDim": sensorDim, "sensorAdr": sensorAdr, "sensorCutoff": sensorCutoff,
        "sensorNoise": sensorNoise, "sensorUser": sensorUser, "numericAdr": numericAdr,
        "numericSize": numericSize, "numericData": numericData, "textAdr": textAdr,
        "textSize": textSize, "textData": textData, "tupleAdr": tupleAdr, "tupleSize": tupleSize,
        "tupleObjtype": tupleObjtype, "tupleObjid": tupleObjid, "tupleObjprm": tupleObjprm,
        "keyTime": keyTime, "keyQpos": keyQpos, "keyQvel": keyQvel, "keyAct": keyAct,
        "keyMpos": keyMpos, "keyMquat": keyMquat, "keyCtrl": keyCtrl, "nameBodyadr": nameBodyadr,
        "nameJntadr": nameJntadr, "nameGeomadr": nameGeomadr, "nameSiteadr": nameSiteadr,
        "nameCamadr": nameCamadr, "nameLightadr": nameLightadr, "nameMeshadr": nameMeshadr,
        "nameSkinadr": nameSkinadr, "nameHfieldadr": nameHfieldadr, "nameTexadr": nameTexadr,
        "nameMatadr": nameMatadr, "namePairadr": namePairadr, "nameExcludeadr": nameExcludeadr,
        "nameEqadr": nameEqadr, "nameTendonadr": nameTendonadr, "nameActuatoradr": nameActuatoradr,
        "nameSensoradr": nameSensoradr, "nameNumericadr": nameNumericadr,
        "nameTextadr": nameTextadr, "nameTupleadr": nameTupleadr, "nameKeyadr": nameKeyadr,
        "names": names,
      ])
  }
}
