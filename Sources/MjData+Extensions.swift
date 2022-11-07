extension MjData {
  /// number of mjtNums that can fit in the arena+stack space
  @inlinable
  public var nstack: Int32 {
    get { _data.pointee.nstack }
    set { _data.pointee.nstack = newValue }
  }
  /// size of main buffer in bytes
  @inlinable
  public var nbuffer: Int32 {
    get { _data.pointee.nbuffer }
    set { _data.pointee.nbuffer = newValue }
  }
  /// number of plugin instances
  @inlinable
  public var nplugin: Int32 {
    get { _data.pointee.nplugin }
    set { _data.pointee.nplugin = newValue }
  }
  /// first available mjtNum address in stack
  @inlinable
  public var pstack: Int {
    get { _data.pointee.pstack }
    set { _data.pointee.pstack = newValue }
  }
  /// first available byte in arena
  @inlinable
  public var parena: Int {
    get { _data.pointee.parena }
    set { _data.pointee.parena = newValue }
  }
  /// maximum stack allocation
  @inlinable
  public var maxuseStack: Int32 {
    get { _data.pointee.maxuse_stack }
    set { _data.pointee.maxuse_stack = newValue }
  }
  /// maximum arena allocation
  @inlinable
  public var maxuseArena: Int {
    get { _data.pointee.maxuse_arena }
    set { _data.pointee.maxuse_arena = newValue }
  }
  /// maximum number of contacts
  @inlinable
  public var maxuseCon: Int32 {
    get { _data.pointee.maxuse_con }
    set { _data.pointee.maxuse_con = newValue }
  }
  /// maximum number of scalar constraints
  @inlinable
  public var maxuseEfc: Int32 {
    get { _data.pointee.maxuse_efc }
    set { _data.pointee.maxuse_efc = newValue }
  }
  /// warning statistics
  @inlinable
  public var warning: MjArray<MjWarningStat> {
    get {
      MjArray<MjWarningStat>(
        array: withUnsafeMutablePointer(
          to: &_data.pointee.warning,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: MjWarningStat.self) }),
        object: _storage, len: 8)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjWarningStat> = withUnsafeMutablePointer(
        to: &_data.pointee.warning,
        { UnsafeMutableRawPointer($0).assumingMemoryBound(to: MjWarningStat.self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(8))
    }
  }
  /// timer statistics
  @inlinable
  public var timer: MjArray<MjTimerStat> {
    get {
      MjArray<MjTimerStat>(
        array: withUnsafeMutablePointer(
          to: &_data.pointee.timer,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: MjTimerStat.self) }),
        object: _storage, len: 13)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjTimerStat> = withUnsafeMutablePointer(
        to: &_data.pointee.timer,
        { UnsafeMutableRawPointer($0).assumingMemoryBound(to: MjTimerStat.self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(13))
    }
  }
  /// solver statistics per iteration
  @inlinable
  public var solver: MjArray<MjSolverStat> {
    get {
      MjArray<MjSolverStat>(
        array: withUnsafeMutablePointer(
          to: &_data.pointee.solver,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: MjSolverStat.self) }),
        object: _storage, len: 1000)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjSolverStat> = withUnsafeMutablePointer(
        to: &_data.pointee.solver,
        { UnsafeMutableRawPointer($0).assumingMemoryBound(to: MjSolverStat.self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(1000))
    }
  }
  /// number of solver iterations
  @inlinable
  public var solverIter: Int32 {
    get { _data.pointee.solver_iter }
    set { _data.pointee.solver_iter = newValue }
  }
  /// number of non-zeros in Hessian or efc_AR
  @inlinable
  public var solverNnz: Int32 {
    get { _data.pointee.solver_nnz }
    set { _data.pointee.solver_nnz = newValue }
  }
  /// forward-inverse comparison: qfrc, efc
  @inlinable
  public var solverFwdinv: (Double, Double) {
    get { _data.pointee.solver_fwdinv }
    set { _data.pointee.solver_fwdinv = newValue }
  }
  /// number of equality constraints
  @inlinable
  public var ne: Int32 {
    get { _data.pointee.ne }
    set { _data.pointee.ne = newValue }
  }
  /// number of friction constraints
  @inlinable
  public var nf: Int32 {
    get { _data.pointee.nf }
    set { _data.pointee.nf = newValue }
  }
  /// number of constraints
  @inlinable
  public var nefc: Int32 {
    get { _data.pointee.nefc }
    set { _data.pointee.nefc = newValue }
  }
  /// number of detected contacts
  @inlinable
  public var ncon: Int32 {
    get { _data.pointee.ncon }
    set { _data.pointee.ncon = newValue }
  }
  /// simulation time
  @inlinable
  public var time: Double {
    get { _data.pointee.time }
    set { _data.pointee.time = newValue }
  }
  /// potential, kinetic energy
  @inlinable
  public var energy: (Double, Double) {
    get { _data.pointee.energy }
    set { _data.pointee.energy = newValue }
  }
  /// position                                 (nq x 1)
  @inlinable
  public var qpos: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qpos, object: _storage, len: nq * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qpos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nq * 1))
    }
  }
  /// velocity                                 (nv x 1)
  @inlinable
  public var qvel: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qvel, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qvel
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// actuator activation                      (na x 1)
  @inlinable
  public var act: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.act, object: _storage, len: na * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.act
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(na * 1))
    }
  }
  /// acceleration used for warmstart          (nv x 1)
  @inlinable
  public var qaccWarmstart: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qacc_warmstart, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qacc_warmstart
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// plugin state                             (npluginstate x 1)
  @inlinable
  public var pluginState: MjArray<Double> {
    get {
      MjArray<Double>(array: _data.pointee.plugin_state, object: _storage, len: npluginstate * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.plugin_state
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(npluginstate * 1))
    }
  }
  /// control                                  (nu x 1)
  @inlinable
  public var ctrl: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.ctrl, object: _storage, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.ctrl
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  /// applied generalized force                (nv x 1)
  @inlinable
  public var qfrcApplied: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qfrc_applied, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qfrc_applied
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// applied Cartesian force/torque           (nbody x 6)
  @inlinable
  public var xfrcApplied: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.xfrc_applied, object: _storage, len: nbody * 6) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.xfrc_applied
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 6))
    }
  }
  /// positions of mocap bodies                (nmocap x 3)
  @inlinable
  public var mocapPos: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.mocap_pos, object: _storage, len: nmocap * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.mocap_pos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmocap * 3))
    }
  }
  /// orientations of mocap bodies             (nmocap x 4)
  @inlinable
  public var mocapQuat: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.mocap_quat, object: _storage, len: nmocap * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.mocap_quat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nmocap * 4))
    }
  }
  /// acceleration                             (nv x 1)
  @inlinable
  public var qacc: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qacc, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qacc
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// time-derivative of actuator activation   (na x 1)
  @inlinable
  public var actDot: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.act_dot, object: _storage, len: na * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.act_dot
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(na * 1))
    }
  }
  /// user data, not touched by engine         (nuserdata x 1)
  @inlinable
  public var userdata: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.userdata, object: _storage, len: nuserdata * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.userdata
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nuserdata * 1))
    }
  }
  /// sensor data array                        (nsensordata x 1)
  @inlinable
  public var sensordata: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.sensordata, object: _storage, len: nsensordata * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.sensordata
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsensordata * 1))
    }
  }
  /// copy of m->plugin, required for deletion (nplugin x 1)
  @inlinable
  public var plugin: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.plugin, object: _storage, len: nplugin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.plugin
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nplugin * 1))
    }
  }
  /// pointer to plugin-managed data structure (nplugin x 1)
  @inlinable
  public var pluginData: MjArray<UInt> {
    get { MjArray<UInt>(array: _data.pointee.plugin_data, object: _storage, len: nplugin * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt> = _data.pointee.plugin_data
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nplugin * 1))
    }
  }
  /// Cartesian position of body frame         (nbody x 3)
  @inlinable
  public var xpos: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.xpos, object: _storage, len: nbody * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.xpos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 3))
    }
  }
  /// Cartesian orientation of body frame      (nbody x 4)
  @inlinable
  public var xquat: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.xquat, object: _storage, len: nbody * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.xquat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 4))
    }
  }
  /// Cartesian orientation of body frame      (nbody x 9)
  @inlinable
  public var xmat: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.xmat, object: _storage, len: nbody * 9) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.xmat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 9))
    }
  }
  /// Cartesian position of body com           (nbody x 3)
  @inlinable
  public var xipos: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.xipos, object: _storage, len: nbody * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.xipos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 3))
    }
  }
  /// Cartesian orientation of body inertia    (nbody x 9)
  @inlinable
  public var ximat: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.ximat, object: _storage, len: nbody * 9) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.ximat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 9))
    }
  }
  /// Cartesian position of joint anchor       (njnt x 3)
  @inlinable
  public var xanchor: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.xanchor, object: _storage, len: njnt * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.xanchor
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 3))
    }
  }
  /// Cartesian joint axis                     (njnt x 3)
  @inlinable
  public var xaxis: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.xaxis, object: _storage, len: njnt * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.xaxis
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(njnt * 3))
    }
  }
  /// Cartesian geom position                  (ngeom x 3)
  @inlinable
  public var geomXpos: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.geom_xpos, object: _storage, len: ngeom * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.geom_xpos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 3))
    }
  }
  /// Cartesian geom orientation               (ngeom x 9)
  @inlinable
  public var geomXmat: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.geom_xmat, object: _storage, len: ngeom * 9) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.geom_xmat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom * 9))
    }
  }
  /// Cartesian site position                  (nsite x 3)
  @inlinable
  public var siteXpos: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.site_xpos, object: _storage, len: nsite * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.site_xpos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 3))
    }
  }
  /// Cartesian site orientation               (nsite x 9)
  @inlinable
  public var siteXmat: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.site_xmat, object: _storage, len: nsite * 9) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.site_xmat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nsite * 9))
    }
  }
  /// Cartesian camera position                (ncam x 3)
  @inlinable
  public var camXpos: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.cam_xpos, object: _storage, len: ncam * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.cam_xpos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 3))
    }
  }
  /// Cartesian camera orientation             (ncam x 9)
  @inlinable
  public var camXmat: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.cam_xmat, object: _storage, len: ncam * 9) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.cam_xmat
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncam * 9))
    }
  }
  /// Cartesian light position                 (nlight x 3)
  @inlinable
  public var lightXpos: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.light_xpos, object: _storage, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.light_xpos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  /// Cartesian light direction                (nlight x 3)
  @inlinable
  public var lightXdir: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.light_xdir, object: _storage, len: nlight * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.light_xdir
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight * 3))
    }
  }
  /// center of mass of each subtree           (nbody x 3)
  @inlinable
  public var subtreeCom: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.subtree_com, object: _storage, len: nbody * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.subtree_com
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 3))
    }
  }
  /// com-based motion axis of each dof        (nv x 6)
  @inlinable
  public var cdof: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.cdof, object: _storage, len: nv * 6) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.cdof
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 6))
    }
  }
  /// com-based body inertia and mass          (nbody x 10)
  @inlinable
  public var cinert: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.cinert, object: _storage, len: nbody * 10) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.cinert
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 10))
    }
  }
  /// start address of tendon's path           (ntendon x 1)
  @inlinable
  public var tenWrapadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.ten_wrapadr, object: _storage, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.ten_wrapadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  /// number of wrap points in path            (ntendon x 1)
  @inlinable
  public var tenWrapnum: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.ten_wrapnum, object: _storage, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.ten_wrapnum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  /// number of non-zeros in Jacobian row      (ntendon x 1)
  @inlinable
  public var tenJRownnz: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.ten_J_rownnz, object: _storage, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.ten_J_rownnz
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  /// row start address in colind array        (ntendon x 1)
  @inlinable
  public var tenJRowadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.ten_J_rowadr, object: _storage, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.ten_J_rowadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  /// column indices in sparse Jacobian        (ntendon x nv)
  @inlinable
  public var tenJColind: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.ten_J_colind, object: _storage, len: ntendon * nv) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.ten_J_colind
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * nv))
    }
  }
  /// tendon lengths                           (ntendon x 1)
  @inlinable
  public var tenLength: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.ten_length, object: _storage, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.ten_length
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  /// tendon Jacobian                          (ntendon x nv)
  @inlinable
  public var tenJ: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.ten_J, object: _storage, len: ntendon * nv) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.ten_J
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * nv))
    }
  }
  /// geom id; -1: site; -2: pulley            (nwrap*2 x 1)
  @inlinable
  public var wrapObj: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.wrap_obj, object: _storage, len: nwrap * 2 * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.wrap_obj
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nwrap * 2 * 1))
    }
  }
  /// Cartesian 3D points in all path          (nwrap*2 x 3)
  @inlinable
  public var wrapXpos: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.wrap_xpos, object: _storage, len: nwrap * 2 * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.wrap_xpos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nwrap * 2 * 3))
    }
  }
  /// actuator lengths                         (nu x 1)
  @inlinable
  public var actuatorLength: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.actuator_length, object: _storage, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.actuator_length
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  /// actuator moments                         (nu x nv)
  @inlinable
  public var actuatorMoment: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.actuator_moment, object: _storage, len: nu * nv) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.actuator_moment
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * nv))
    }
  }
  /// com-based composite inertia and mass     (nbody x 10)
  @inlinable
  public var crb: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.crb, object: _storage, len: nbody * 10) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.crb
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 10))
    }
  }
  /// total inertia (sparse)                   (nM x 1)
  @inlinable
  public var qM: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qM, object: _storage, len: nM * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qM
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nM * 1))
    }
  }
  /// L'*D*L factorization of M (sparse)       (nM x 1)
  @inlinable
  public var qLd: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qLD, object: _storage, len: nM * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qLD
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nM * 1))
    }
  }
  /// 1/diag(D)                                (nv x 1)
  @inlinable
  public var qLDiagInv: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qLDiagInv, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qLDiagInv
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// 1/sqrt(diag(D))                          (nv x 1)
  @inlinable
  public var qLDiagSqrtInv: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qLDiagSqrtInv, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qLDiagSqrtInv
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// tendon velocities                        (ntendon x 1)
  @inlinable
  public var tenVelocity: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.ten_velocity, object: _storage, len: ntendon * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.ten_velocity
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntendon * 1))
    }
  }
  /// actuator velocities                      (nu x 1)
  @inlinable
  public var actuatorVelocity: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.actuator_velocity, object: _storage, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.actuator_velocity
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  /// com-based velocity [3D rot; 3D tran]     (nbody x 6)
  @inlinable
  public var cvel: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.cvel, object: _storage, len: nbody * 6) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.cvel
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 6))
    }
  }
  /// time-derivative of cdof                  (nv x 6)
  @inlinable
  public var cdofDot: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.cdof_dot, object: _storage, len: nv * 6) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.cdof_dot
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 6))
    }
  }
  /// C(qpos,qvel)                             (nv x 1)
  @inlinable
  public var qfrcBias: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qfrc_bias, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qfrc_bias
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// passive force                            (nv x 1)
  @inlinable
  public var qfrcPassive: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qfrc_passive, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qfrc_passive
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// velocity in constraint space: J*qvel     (nefc x 1)
  @inlinable
  public var efcVel: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_vel, object: _storage, len: nefc * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_vel
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * 1))
    }
  }
  /// reference pseudo-acceleration            (nefc x 1)
  @inlinable
  public var efcAref: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_aref, object: _storage, len: nefc * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_aref
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * 1))
    }
  }
  /// linear velocity of subtree com           (nbody x 3)
  @inlinable
  public var subtreeLinvel: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.subtree_linvel, object: _storage, len: nbody * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.subtree_linvel
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 3))
    }
  }
  /// angular momentum about subtree com       (nbody x 3)
  @inlinable
  public var subtreeAngmom: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.subtree_angmom, object: _storage, len: nbody * 3) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.subtree_angmom
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 3))
    }
  }
  /// L'*D*L factorization of modified M       (nM x 1)
  @inlinable
  public var qH: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qH, object: _storage, len: nM * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qH
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nM * 1))
    }
  }
  /// 1/diag(D) of modified M                  (nv x 1)
  @inlinable
  public var qHDiagInv: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qHDiagInv, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qHDiagInv
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// non-zeros in each row                    (nv x 1)
  @inlinable
  public var dRownnz: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.D_rownnz, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.D_rownnz
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// address of each row in D_colind          (nv x 1)
  @inlinable
  public var dRowadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.D_rowadr, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.D_rowadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// column indices of non-zeros              (nD x 1)
  @inlinable
  public var dColind: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.D_colind, object: _storage, len: nD * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.D_colind
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nD * 1))
    }
  }
  /// d (passive + actuator - bias) / d qvel   (nD x 1)
  @inlinable
  public var qDeriv: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qDeriv, object: _storage, len: nD * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qDeriv
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nD * 1))
    }
  }
  /// sparse LU of (qM - dt*qDeriv)            (nD x 1)
  @inlinable
  public var qLu: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qLU, object: _storage, len: nD * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qLU
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nD * 1))
    }
  }
  /// actuator force in actuation space        (nu x 1)
  @inlinable
  public var actuatorForce: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.actuator_force, object: _storage, len: nu * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.actuator_force
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nu * 1))
    }
  }
  /// actuator force                           (nv x 1)
  @inlinable
  public var qfrcActuator: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qfrc_actuator, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qfrc_actuator
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// net unconstrained force                  (nv x 1)
  @inlinable
  public var qfrcSmooth: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qfrc_smooth, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qfrc_smooth
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// unconstrained acceleration               (nv x 1)
  @inlinable
  public var qaccSmooth: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qacc_smooth, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qacc_smooth
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// constraint force                         (nv x 1)
  @inlinable
  public var qfrcConstraint: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qfrc_constraint, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qfrc_constraint
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// net external force; should equal:        (nv x 1)
  @inlinable
  public var qfrcInverse: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.qfrc_inverse, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.qfrc_inverse
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// com-based acceleration                   (nbody x 6)
  @inlinable
  public var cacc: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.cacc, object: _storage, len: nbody * 6) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.cacc
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 6))
    }
  }
  /// com-based interaction force with parent  (nbody x 6)
  @inlinable
  public var cfrcInt: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.cfrc_int, object: _storage, len: nbody * 6) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.cfrc_int
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 6))
    }
  }
  /// com-based external force on body         (nbody x 6)
  @inlinable
  public var cfrcExt: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.cfrc_ext, object: _storage, len: nbody * 6) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.cfrc_ext
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nbody * 6))
    }
  }
  /// list of all detected contacts            (ncon x 1)
  @inlinable
  public var contact: MjArray<MjContact> {
    get {
      MjArray<MjContact>(
        array: UnsafeMutableRawPointer(_data.pointee.contact).assumingMemoryBound(
          to: MjContact.self), object: _storage, len: ncon * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjContact> = UnsafeMutableRawPointer(
        _data.pointee.contact
      ).assumingMemoryBound(to: MjContact.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ncon * 1))
    }
  }
  /// constraint type (mjtConstraint)          (nefc x 1)
  @inlinable
  public var efcType: MjArray<MjtConstraint> {
    get {
      MjArray<MjtConstraint>(
        array: UnsafeMutableRawPointer(_data.pointee.efc_type).assumingMemoryBound(
          to: MjtConstraint.self), object: _storage, len: nefc * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjtConstraint> = UnsafeMutableRawPointer(
        _data.pointee.efc_type
      ).assumingMemoryBound(to: MjtConstraint.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * 1))
    }
  }
  /// id of object of specified type           (nefc x 1)
  @inlinable
  public var efcId: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_id, object: _storage, len: nefc * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_id
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * 1))
    }
  }
  /// number of non-zeros in Jacobian row      (nefc x 1)
  @inlinable
  public var efcJRownnz: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_J_rownnz, object: _storage, len: nefc * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_J_rownnz
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * 1))
    }
  }
  /// row start address in colind array        (nefc x 1)
  @inlinable
  public var efcJRowadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_J_rowadr, object: _storage, len: nefc * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_J_rowadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * 1))
    }
  }
  /// number of subsequent rows in supernode   (nefc x 1)
  @inlinable
  public var efcJRowsuper: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_J_rowsuper, object: _storage, len: nefc * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_J_rowsuper
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * 1))
    }
  }
  /// column indices in Jacobian               (nefc x nv)
  @inlinable
  public var efcJColind: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_J_colind, object: _storage, len: nefc * nv) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_J_colind
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * nv))
    }
  }
  /// number of non-zeros in Jacobian row    T (nv x 1)
  @inlinable
  public var efcJtRownnz: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_JT_rownnz, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_JT_rownnz
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// row start address in colind array      T (nv x 1)
  @inlinable
  public var efcJtRowadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_JT_rowadr, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_JT_rowadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// number of subsequent rows in supernode T (nv x 1)
  @inlinable
  public var efcJtRowsuper: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_JT_rowsuper, object: _storage, len: nv * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_JT_rowsuper
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * 1))
    }
  }
  /// column indices in Jacobian             T (nv x nefc)
  @inlinable
  public var efcJtColind: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_JT_colind, object: _storage, len: nv * nefc) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_JT_colind
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * nefc))
    }
  }
  /// constraint Jacobian                      (nefc x nv)
  @inlinable
  public var efcJ: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_J, object: _storage, len: nefc * nv) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_J
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * nv))
    }
  }
  /// constraint Jacobian transposed           (nv x nefc)
  @inlinable
  public var efcJt: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_JT, object: _storage, len: nv * nefc) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_JT
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nv * nefc))
    }
  }
  /// constraint position (equality, contact)  (nefc x 1)
  @inlinable
  public var efcPos: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_pos, object: _storage, len: nefc * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_pos
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * 1))
    }
  }
  /// inclusion margin (contact)               (nefc x 1)
  @inlinable
  public var efcMargin: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_margin, object: _storage, len: nefc * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_margin
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * 1))
    }
  }
  /// frictionloss (friction)                  (nefc x 1)
  @inlinable
  public var efcFrictionloss: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_frictionloss, object: _storage, len: nefc * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_frictionloss
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * 1))
    }
  }
  /// approximation to diagonal of A           (nefc x 1)
  @inlinable
  public var efcDiagApprox: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_diagApprox, object: _storage, len: nefc * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_diagApprox
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * 1))
    }
  }
  /// stiffness, damping, impedance, imp'      (nefc x 4)
  @inlinable
  public var efcKbip: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_KBIP, object: _storage, len: nefc * 4) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_KBIP
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * 4))
    }
  }
  /// constraint mass                          (nefc x 1)
  @inlinable
  public var efcD: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_D, object: _storage, len: nefc * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_D
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * 1))
    }
  }
  /// inverse constraint mass                  (nefc x 1)
  @inlinable
  public var efcR: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_R, object: _storage, len: nefc * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_R
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * 1))
    }
  }
  /// linear cost term: J*qacc_smooth - aref   (nefc x 1)
  @inlinable
  public var efcB: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_b, object: _storage, len: nefc * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_b
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * 1))
    }
  }
  /// constraint force in constraint space     (nefc x 1)
  @inlinable
  public var efcForce: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_force, object: _storage, len: nefc * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_force
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * 1))
    }
  }
  /// constraint state (mjtConstraintState)    (nefc x 1)
  @inlinable
  public var efcState: MjArray<MjtConstraintState> {
    get {
      MjArray<MjtConstraintState>(
        array: UnsafeMutableRawPointer(_data.pointee.efc_state).assumingMemoryBound(
          to: MjtConstraintState.self), object: _storage, len: nefc * 1)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjtConstraintState> = UnsafeMutableRawPointer(
        _data.pointee.efc_state
      ).assumingMemoryBound(to: MjtConstraintState.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * 1))
    }
  }
  /// number of non-zeros in AR                (nefc x 1)
  @inlinable
  public var efcArRownnz: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_AR_rownnz, object: _storage, len: nefc * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_AR_rownnz
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * 1))
    }
  }
  /// row start address in colind array        (nefc x 1)
  @inlinable
  public var efcArRowadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_AR_rowadr, object: _storage, len: nefc * 1) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_AR_rowadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * 1))
    }
  }
  /// column indices in sparse AR              (nefc x nefc)
  @inlinable
  public var efcArColind: MjArray<Int32> {
    get { MjArray<Int32>(array: _data.pointee.efc_AR_colind, object: _storage, len: nefc * nefc) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _data.pointee.efc_AR_colind
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * nefc))
    }
  }
  /// J*inv(M)*J' + R                          (nefc x nefc)
  @inlinable
  public var efcAr: MjArray<Double> {
    get { MjArray<Double>(array: _data.pointee.efc_AR, object: _storage, len: nefc * nefc) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Double> = _data.pointee.efc_AR
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nefc * nefc))
    }
  }
}
extension MjData: CustomReflectable {
  public var customMirror: Mirror {
    Mirror(
      self,
      children: [
        "nstack": nstack, "nbuffer": nbuffer, "nplugin": nplugin, "pstack": pstack,
        "parena": parena, "maxuseStack": maxuseStack, "maxuseArena": maxuseArena,
        "maxuseCon": maxuseCon, "maxuseEfc": maxuseEfc, "warning": warning, "timer": timer,
        "solver": solver, "solverIter": solverIter, "solverNnz": solverNnz,
        "solverFwdinv": solverFwdinv, "ne": ne, "nf": nf, "nefc": nefc, "ncon": ncon, "time": time,
        "energy": energy, "qpos": qpos, "qvel": qvel, "act": act, "qaccWarmstart": qaccWarmstart,
        "pluginState": pluginState, "ctrl": ctrl, "qfrcApplied": qfrcApplied,
        "xfrcApplied": xfrcApplied, "mocapPos": mocapPos, "mocapQuat": mocapQuat, "qacc": qacc,
        "actDot": actDot, "userdata": userdata, "sensordata": sensordata, "plugin": plugin,
        "pluginData": pluginData, "xpos": xpos, "xquat": xquat, "xmat": xmat, "xipos": xipos,
        "ximat": ximat, "xanchor": xanchor, "xaxis": xaxis, "geomXpos": geomXpos,
        "geomXmat": geomXmat, "siteXpos": siteXpos, "siteXmat": siteXmat, "camXpos": camXpos,
        "camXmat": camXmat, "lightXpos": lightXpos, "lightXdir": lightXdir,
        "subtreeCom": subtreeCom, "cdof": cdof, "cinert": cinert, "tenWrapadr": tenWrapadr,
        "tenWrapnum": tenWrapnum, "tenJRownnz": tenJRownnz, "tenJRowadr": tenJRowadr,
        "tenJColind": tenJColind, "tenLength": tenLength, "tenJ": tenJ, "wrapObj": wrapObj,
        "wrapXpos": wrapXpos, "actuatorLength": actuatorLength, "actuatorMoment": actuatorMoment,
        "crb": crb, "qM": qM, "qLd": qLd, "qLDiagInv": qLDiagInv, "qLDiagSqrtInv": qLDiagSqrtInv,
        "tenVelocity": tenVelocity, "actuatorVelocity": actuatorVelocity, "cvel": cvel,
        "cdofDot": cdofDot, "qfrcBias": qfrcBias, "qfrcPassive": qfrcPassive, "efcVel": efcVel,
        "efcAref": efcAref, "subtreeLinvel": subtreeLinvel, "subtreeAngmom": subtreeAngmom,
        "qH": qH, "qHDiagInv": qHDiagInv, "dRownnz": dRownnz, "dRowadr": dRowadr,
        "dColind": dColind, "qDeriv": qDeriv, "qLu": qLu, "actuatorForce": actuatorForce,
        "qfrcActuator": qfrcActuator, "qfrcSmooth": qfrcSmooth, "qaccSmooth": qaccSmooth,
        "qfrcConstraint": qfrcConstraint, "qfrcInverse": qfrcInverse, "cacc": cacc,
        "cfrcInt": cfrcInt, "cfrcExt": cfrcExt, "contact": contact, "efcType": efcType,
        "efcId": efcId, "efcJRownnz": efcJRownnz, "efcJRowadr": efcJRowadr,
        "efcJRowsuper": efcJRowsuper, "efcJColind": efcJColind, "efcJtRownnz": efcJtRownnz,
        "efcJtRowadr": efcJtRowadr, "efcJtRowsuper": efcJtRowsuper, "efcJtColind": efcJtColind,
        "efcJ": efcJ, "efcJt": efcJt, "efcPos": efcPos, "efcMargin": efcMargin,
        "efcFrictionloss": efcFrictionloss, "efcDiagApprox": efcDiagApprox, "efcKbip": efcKbip,
        "efcD": efcD, "efcR": efcR, "efcB": efcB, "efcForce": efcForce, "efcState": efcState,
        "efcArRownnz": efcArRownnz, "efcArRowadr": efcArRowadr, "efcArColind": efcArColind,
        "efcAr": efcAr,
      ])
  }
}
