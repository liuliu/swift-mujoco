import C_mujoco

extension MjModel {
  ///  Advance simulation, use control callback to obtain external force and control.
  @inlinable
  public func step(data: inout MjData) {
    mj_step(self._model, data._data)
  }
  ///  Advance simulation in two steps: before external force and control is set by user.
  @inlinable
  public func step1(data: inout MjData) {
    mj_step1(self._model, data._data)
  }
  ///  Advance simulation in two steps: after external force and control is set by user.
  @inlinable
  public func step2(data: inout MjData) {
    mj_step2(self._model, data._data)
  }
  ///  Forward dynamics: same as mj_step but do not integrate in time.
  @inlinable
  public func forward(data: inout MjData) {
    mj_forward(self._model, data._data)
  }
  ///  Inverse dynamics: qacc must be set before calling.
  @inlinable
  public func inverse(data: inout MjData) {
    mj_inverse(self._model, data._data)
  }
  ///  Forward dynamics with skip; skipstage is mjtStage.
  @inlinable
  public func forwardSkip(data: inout MjData, skipstage: MjtStage, skipsensor: Int32) {
    mj_forwardSkip(self._model, data._data, skipstage.rawValue, skipsensor)
  }
  ///  Inverse dynamics with skip; skipstage is mjtStage.
  @inlinable
  public func inverseSkip(data: inout MjData, skipstage: MjtStage, skipsensor: Int32) {
    mj_inverseSkip(self._model, data._data, skipstage.rawValue, skipsensor)
  }
  ///  Reset data to defaults.
  @inlinable
  public func reset(data: inout MjData) {
    mj_resetData(self._model, data._data)
  }
  ///  Reset data to defaults, fill everything else with debug_value.
  @inlinable
  public func resetDataDebug(data: inout MjData, debugValue: UInt8) {
    mj_resetDataDebug(self._model, data._data, debugValue)
  }
  ///  Reset data, set fields from specified keyframe.
  @inlinable
  public func reset(data: inout MjData, keyframe: Int32) {
    mj_resetDataKeyframe(self._model, data._data, keyframe)
  }
  ///  Set constant fields of mjModel, corresponding to qpos0 configuration.
  @inlinable
  public mutating func setConst(data: inout MjData) {
    mj_setConst(self._model, data._data)
  }
  /// Print mjModel to text file, specifying format. float_format must be a valid printf-style format string for a single float value.
  @inlinable
  public func printFormattedModel(filename: String, floatFormat: String) {
    mj_printFormattedModel(self._model, filename, floatFormat)
  }
  ///  Print model to text file.
  @inlinable
  public func printModel(filename: String) {
    mj_printModel(self._model, filename)
  }
  /// Print mjData to text file, specifying format. float_format must be a valid printf-style format string for a single float value
  @inlinable
  public func printFormatted(data: inout MjData, filename: String, floatFormat: String) {
    mj_printFormattedData(self._model, data._data, filename, floatFormat)
  }
  ///  Print data to text file.
  @inlinable
  public func print(data: inout MjData, filename: String) {
    mj_printData(self._model, data._data, filename)
  }
  ///  Run position-dependent computations.
  @inlinable
  public func fwdPosition(data: inout MjData) {
    mj_fwdPosition(self._model, data._data)
  }
  ///  Run velocity-dependent computations.
  @inlinable
  public func fwdVelocity(data: inout MjData) {
    mj_fwdVelocity(self._model, data._data)
  }
  ///  Compute actuator force qfrc_actuator.
  @inlinable
  public func fwdActuation(data: inout MjData) {
    mj_fwdActuation(self._model, data._data)
  }
  ///  Add up all non-constraint forces, compute qacc_unc.
  @inlinable
  public func fwdAcceleration(data: inout MjData) {
    mj_fwdAcceleration(self._model, data._data)
  }
  ///  Run selected constraint solver.
  @inlinable
  public func fwdConstraint(data: inout MjData) {
    mj_fwdConstraint(self._model, data._data)
  }
  ///  Euler integrator, semi-implicit in velocity.
  @inlinable
  public func Euler(data: inout MjData) {
    mj_Euler(self._model, data._data)
  }
  ///  Runge-Kutta explicit order-N integrator.
  @inlinable
  public func RungeKutta(data: inout MjData, n: Int32) {
    mj_RungeKutta(self._model, data._data, n)
  }
  ///  Run position-dependent computations in inverse dynamics.
  @inlinable
  public func invPosition(data: inout MjData) {
    mj_invPosition(self._model, data._data)
  }
  ///  Run velocity-dependent computations in inverse dynamics.
  @inlinable
  public func invVelocity(data: inout MjData) {
    mj_invVelocity(self._model, data._data)
  }
  ///  Apply the analytical formula for inverse constraint dynamics.
  @inlinable
  public func invConstraint(data: inout MjData) {
    mj_invConstraint(self._model, data._data)
  }
  ///  Compare forward and inverse dynamics, save results in fwdinv.
  @inlinable
  public func compareFwdInv(data: inout MjData) {
    mj_compareFwdInv(self._model, data._data)
  }
  ///  Evaluate position-dependent sensors.
  @inlinable
  public func sensorPos(data: inout MjData) {
    mj_sensorPos(self._model, data._data)
  }
  ///  Evaluate velocity-dependent sensors.
  @inlinable
  public func sensorVel(data: inout MjData) {
    mj_sensorVel(self._model, data._data)
  }
  ///  Evaluate acceleration and force-dependent sensors.
  @inlinable
  public func sensorAcc(data: inout MjData) {
    mj_sensorAcc(self._model, data._data)
  }
  ///  Evaluate position-dependent energy (potential).
  @inlinable
  public func energyPos(data: inout MjData) {
    mj_energyPos(self._model, data._data)
  }
  ///  Evaluate velocity-dependent energy (kinetic).
  @inlinable
  public func energyVel(data: inout MjData) {
    mj_energyVel(self._model, data._data)
  }
  ///  Check qpos, reset if any element is too big or nan.
  @inlinable
  public func checkPos(data: inout MjData) {
    mj_checkPos(self._model, data._data)
  }
  ///  Check qvel, reset if any element is too big or nan.
  @inlinable
  public func checkVel(data: inout MjData) {
    mj_checkVel(self._model, data._data)
  }
  ///  Check qacc, reset if any element is too big or nan.
  @inlinable
  public func checkAcc(data: inout MjData) {
    mj_checkAcc(self._model, data._data)
  }
  ///  Run forward kinematics.
  @inlinable
  public func kinematics(data: inout MjData) {
    mj_kinematics(self._model, data._data)
  }
  ///  Map inertias and motion dofs to global frame centered at CoM.
  @inlinable
  public func comPos(data: inout MjData) {
    mj_comPos(self._model, data._data)
  }
  ///  Compute camera and light positions and orientations.
  @inlinable
  public func camlight(data: inout MjData) {
    mj_camlight(self._model, data._data)
  }
  ///  Compute tendon lengths, velocities and moment arms.
  @inlinable
  public func tendon(data: inout MjData) {
    mj_tendon(self._model, data._data)
  }
  ///  Compute actuator transmission lengths and moments.
  @inlinable
  public func transmission(data: inout MjData) {
    mj_transmission(self._model, data._data)
  }
  ///  Run composite rigid body inertia algorithm (CRB).
  @inlinable
  public func crb(data: inout MjData) {
    mj_crb(self._model, data._data)
  }
  ///  Compute sparse L'*D*L factorizaton of inertia matrix.
  @inlinable
  public func factorM(data: inout MjData) {
    mj_factorM(self._model, data._data)
  }
  ///  Solve linear system M * x = y using factorization:  x = inv(L'*D*L)*y
  @inlinable
  public func solveM<T0: MjDoubleMutableBufferPointer>(
    data: inout MjData, x: inout T0, y: MjDoubleBufferPointer, n: Int32
  ) {
    x.withUnsafeMutableBufferPointer { x__p in
      y.withUnsafeBufferPointer { y__p in
        mj_solveM(self._model, data._data, x__p.baseAddress, y__p.baseAddress, n)
      }
    }
  }
  ///  Half of linear solve:  x = sqrt(inv(D))*inv(L')*y
  @inlinable
  public func solveM2<T0: MjDoubleMutableBufferPointer>(
    data: inout MjData, x: inout T0, y: MjDoubleBufferPointer, n: Int32
  ) {
    x.withUnsafeMutableBufferPointer { x__p in
      y.withUnsafeBufferPointer { y__p in
        mj_solveM2(self._model, data._data, x__p.baseAddress, y__p.baseAddress, n)
      }
    }
  }
  ///  Compute cvel, cdof_dot.
  @inlinable
  public func comVel(data: inout MjData) {
    mj_comVel(self._model, data._data)
  }
  ///  Compute qfrc_passive from spring-dampers, viscosity and density.
  @inlinable
  public func passive(data: inout MjData) {
    mj_passive(self._model, data._data)
  }
  ///  subtree linear velocity and angular momentum
  @inlinable
  public func subtreeVel(data: inout MjData) {
    mj_subtreeVel(self._model, data._data)
  }
  ///  RNE: compute M(qpos)*qacc + C(qpos,qvel); flg_acc=0 removes inertial term.
  @inlinable
  public func rne<T0: MjDoubleMutableBufferPointer>(
    data: inout MjData, flgAcc: Int32, result: inout T0
  ) {
    result.withUnsafeMutableBufferPointer { result__p in
      mj_rne(self._model, data._data, flgAcc, result__p.baseAddress)
    }
  }
  ///  RNE with complete data: compute cacc, cfrc_ext, cfrc_int.
  @inlinable
  public func rnePostConstraint(data: inout MjData) {
    mj_rnePostConstraint(self._model, data._data)
  }
  ///  Run collision detection.
  @inlinable
  public func collision(data: inout MjData) {
    mj_collision(self._model, data._data)
  }
  ///  Construct constraints.
  @inlinable
  public func makeConstraint(data: inout MjData) {
    mj_makeConstraint(self._model, data._data)
  }
  ///  Compute inverse constaint inertia efc_AR.
  @inlinable
  public func projectConstraint(data: inout MjData) {
    mj_projectConstraint(self._model, data._data)
  }
  ///  Compute efc_vel, efc_aref.
  @inlinable
  public func referenceConstraint(data: inout MjData) {
    mj_referenceConstraint(self._model, data._data)
  }
  /// Compute efc_state, efc_force, qfrc_constraint, and (optionally) cone Hessians. If cost is not NULL, set *cost = s(jar) where jar = Jac*qacc-aref.
  @inlinable
  public func constraintUpdate<T0: MjDoubleMutableBufferPointer>(
    data: inout MjData, jar: MjDoubleBufferPointer, cost: inout T0, flgConeHessian: Int32
  ) {
    jar.withUnsafeBufferPointer { jar__p in
      precondition(cost.count == 1)
      cost.withUnsafeMutableBufferPointer { cost__p in
        mj_constraintUpdate(
          self._model, data._data, jar__p.baseAddress, cost__p.baseAddress, flgConeHessian)
      }
    }
  }
  ///  Add contact to d->contact list; return 0 if success; 1 if buffer full.
  @inlinable
  public func addContact(data: inout MjData, contact: MjContact) -> Int32 {
    var contact__contact = contact._contact
    return mj_addContact(self._model, data._data, &contact__contact)
  }
  ///  Determine type of friction cone.
  @inlinable
  public func isPyramidal() -> Bool {
    return (0 != mj_isPyramidal(self._model))
  }
  ///  Determine type of constraint Jacobian.
  @inlinable
  public func isSparse() -> Bool {
    return (0 != mj_isSparse(self._model))
  }
  ///  Determine type of solver (PGS is dual, CG and Newton are primal).
  @inlinable
  public func isDual() -> Bool {
    return (0 != mj_isDual(self._model))
  }
  ///  Multiply dense or sparse constraint Jacobian by vector.
  @inlinable
  public func mulJacVec<T0: MjDoubleMutableBufferPointer>(
    data: inout MjData, res: inout T0, vec: MjDoubleBufferPointer
  ) {
    res.withUnsafeMutableBufferPointer { res__p in
      vec.withUnsafeBufferPointer { vec__p in
        mj_mulJacVec(self._model, data._data, res__p.baseAddress, vec__p.baseAddress)
      }
    }
  }
  ///  Multiply dense or sparse constraint Jacobian transpose by vector.
  @inlinable
  public func mulJacTVec<T0: MjDoubleMutableBufferPointer>(
    data: inout MjData, res: inout T0, vec: MjDoubleBufferPointer
  ) {
    res.withUnsafeMutableBufferPointer { res__p in
      vec.withUnsafeBufferPointer { vec__p in
        mj_mulJacTVec(self._model, data._data, res__p.baseAddress, vec__p.baseAddress)
      }
    }
  }
  ///  Compute 3/6-by-nv end-effector Jacobian of global point attached to given body.
  @inlinable
  public func jac<T0: MjDoubleMutableBufferPointer, T1: MjDoubleMutableBufferPointer>(
    data: MjData, jacp: inout T0, jacr: inout T1, point: MjDoubleBufferPointer, body: Int32
  ) {
    jacp.withUnsafeMutableBufferPointer { jacp__p in
      jacr.withUnsafeMutableBufferPointer { jacr__p in
        precondition(point.count == 3)
        point.withUnsafeBufferPointer { point__p in
          mj_jac(
            self._model, data._data, jacp__p.baseAddress, jacr__p.baseAddress, point__p.baseAddress,
            body)
        }
      }
    }
  }
  ///  Compute body frame end-effector Jacobian.
  @inlinable
  public func jacBody<T0: MjDoubleMutableBufferPointer, T1: MjDoubleMutableBufferPointer>(
    data: MjData, jacp: inout T0, jacr: inout T1, body: Int32
  ) {
    jacp.withUnsafeMutableBufferPointer { jacp__p in
      jacr.withUnsafeMutableBufferPointer { jacr__p in
        mj_jacBody(self._model, data._data, jacp__p.baseAddress, jacr__p.baseAddress, body)
      }
    }
  }
  ///  Compute body center-of-mass end-effector Jacobian.
  @inlinable
  public func jacBodyCom<T0: MjDoubleMutableBufferPointer, T1: MjDoubleMutableBufferPointer>(
    data: MjData, jacp: inout T0, jacr: inout T1, body: Int32
  ) {
    jacp.withUnsafeMutableBufferPointer { jacp__p in
      jacr.withUnsafeMutableBufferPointer { jacr__p in
        mj_jacBodyCom(self._model, data._data, jacp__p.baseAddress, jacr__p.baseAddress, body)
      }
    }
  }
  ///  Compute geom end-effector Jacobian.
  @inlinable
  public func jacGeom<T0: MjDoubleMutableBufferPointer, T1: MjDoubleMutableBufferPointer>(
    data: MjData, jacp: inout T0, jacr: inout T1, geom: Int32
  ) {
    jacp.withUnsafeMutableBufferPointer { jacp__p in
      jacr.withUnsafeMutableBufferPointer { jacr__p in
        mj_jacGeom(self._model, data._data, jacp__p.baseAddress, jacr__p.baseAddress, geom)
      }
    }
  }
  ///  Compute site end-effector Jacobian.
  @inlinable
  public func jacSite<T0: MjDoubleMutableBufferPointer, T1: MjDoubleMutableBufferPointer>(
    data: MjData, jacp: inout T0, jacr: inout T1, site: Int32
  ) {
    jacp.withUnsafeMutableBufferPointer { jacp__p in
      jacr.withUnsafeMutableBufferPointer { jacr__p in
        mj_jacSite(self._model, data._data, jacp__p.baseAddress, jacr__p.baseAddress, site)
      }
    }
  }
  ///  Compute translation end-effector Jacobian of point, and rotation Jacobian of axis.
  @inlinable
  public func jacPointAxis<T0: MjDoubleMutableBufferPointer, T1: MjDoubleMutableBufferPointer>(
    data: inout MjData, jacPoint: inout T0, jacAxis: inout T1, point: MjDoubleBufferPointer,
    axis: MjDoubleBufferPointer, body: Int32
  ) {
    jacPoint.withUnsafeMutableBufferPointer { jacPoint__p in
      jacAxis.withUnsafeMutableBufferPointer { jacAxis__p in
        precondition(point.count == 3)
        point.withUnsafeBufferPointer { point__p in
          precondition(axis.count == 3)
          axis.withUnsafeBufferPointer { axis__p in
            mj_jacPointAxis(
              self._model, data._data, jacPoint__p.baseAddress, jacAxis__p.baseAddress,
              point__p.baseAddress, axis__p.baseAddress, body)
          }
        }
      }
    }
  }
  ///  Get id of object with specified name, return -1 if not found; type is mjtObj.
  @inlinable
  public func name2id(type: MjtObj, name: String) -> Int32 {
    return mj_name2id(self._model, type.rawValue, name)
  }
  ///  Get name of object with specified id, return 0 if invalid type or id; type is mjtObj.
  @inlinable
  public func id2name(type: MjtObj, id: Int32) -> String? {
    return String(cString: mj_id2name(self._model, type.rawValue, id), encoding: .utf8)
  }
  ///  Convert sparse inertia matrix M into full (i.e. dense) matrix.
  @inlinable
  public func fullM<T0: MjDoubleMutableBufferPointer>(dst: inout T0, m: MjDoubleBufferPointer) {
    dst.withUnsafeMutableBufferPointer { dst__p in
      m.withUnsafeBufferPointer { m__p in
        mj_fullM(self._model, dst__p.baseAddress, m__p.baseAddress)
      }
    }
  }
  ///  Multiply vector by inertia matrix.
  @inlinable
  public func mulM<T0: MjDoubleMutableBufferPointer>(
    data: MjData, res: inout T0, vec: MjDoubleBufferPointer
  ) {
    res.withUnsafeMutableBufferPointer { res__p in
      vec.withUnsafeBufferPointer { vec__p in
        mj_mulM(self._model, data._data, res__p.baseAddress, vec__p.baseAddress)
      }
    }
  }
  ///  Multiply vector by (inertia matrix)^(1/2).
  @inlinable
  public func mulM2<T0: MjDoubleMutableBufferPointer>(
    data: MjData, res: inout T0, vec: MjDoubleBufferPointer
  ) {
    res.withUnsafeMutableBufferPointer { res__p in
      vec.withUnsafeBufferPointer { vec__p in
        mj_mulM2(self._model, data._data, res__p.baseAddress, vec__p.baseAddress)
      }
    }
  }
  /// Add inertia matrix to destination matrix. Destination can be sparse uncompressed, or dense when all int* are NULL
  @inlinable
  public func addM<
    T0: MjDoubleMutableBufferPointer, T1: MjInt32MutableBufferPointer,
    T2: MjInt32MutableBufferPointer, T3: MjInt32MutableBufferPointer
  >(data: inout MjData, dst: inout T0, rownnz: inout T1, rowadr: inout T2, colind: inout T3) {
    dst.withUnsafeMutableBufferPointer { dst__p in
      rownnz.withUnsafeMutableBufferPointer { rownnz__p in
        rowadr.withUnsafeMutableBufferPointer { rowadr__p in
          colind.withUnsafeMutableBufferPointer { colind__p in
            mj_addM(
              self._model, data._data, dst__p.baseAddress, rownnz__p.baseAddress,
              rowadr__p.baseAddress, colind__p.baseAddress)
          }
        }
      }
    }
  }
  ///  Apply cartesian force and torque (outside xfrc_applied mechanism).
  @inlinable
  public func applyFT<T0: MjDoubleMutableBufferPointer>(
    data: inout MjData, force: MjDoubleBufferPointer, torque: MjDoubleBufferPointer,
    point: MjDoubleBufferPointer, body: Int32, qfrcTarget: inout T0
  ) {
    precondition(force.count == 3)
    force.withUnsafeBufferPointer { force__p in
      precondition(torque.count == 3)
      torque.withUnsafeBufferPointer { torque__p in
        precondition(point.count == 3)
        point.withUnsafeBufferPointer { point__p in
          qfrcTarget.withUnsafeMutableBufferPointer { qfrcTarget__p in
            mj_applyFT(
              self._model, data._data, force__p.baseAddress, torque__p.baseAddress,
              point__p.baseAddress, body, qfrcTarget__p.baseAddress)
          }
        }
      }
    }
  }
  ///  Compute object 6D velocity in object-centered frame, world/local orientation.
  @inlinable
  public func objectVelocity<T0: MjDoubleMutableBufferPointer>(
    data: MjData, objtype: Int32, objid: Int32, res: inout T0, flgLocal: Int32
  ) {
    precondition(res.count == 6)
    res.withUnsafeMutableBufferPointer { res__p in
      mj_objectVelocity(self._model, data._data, objtype, objid, res__p.baseAddress, flgLocal)
    }
  }
  ///  Compute object 6D acceleration in object-centered frame, world/local orientation.
  @inlinable
  public func objectAcceleration<T0: MjDoubleMutableBufferPointer>(
    data: MjData, objtype: Int32, objid: Int32, res: inout T0, flgLocal: Int32
  ) {
    precondition(res.count == 6)
    res.withUnsafeMutableBufferPointer { res__p in
      mj_objectAcceleration(self._model, data._data, objtype, objid, res__p.baseAddress, flgLocal)
    }
  }
  ///  Extract 6D force:torque given contact id, in the contact frame.
  @inlinable
  public func contactForce<T0: MjDoubleMutableBufferPointer>(
    data: MjData, id: Int32, result: inout T0
  ) {
    precondition(result.count == 6)
    result.withUnsafeMutableBufferPointer { result__p in
      mj_contactForce(self._model, data._data, id, result__p.baseAddress)
    }
  }
  ///  Compute velocity by finite-differencing two positions.
  @inlinable
  public func differentiatePos<T0: MjDoubleMutableBufferPointer>(
    qvel: inout T0, dt: Double, qpos1: MjDoubleBufferPointer, qpos2: MjDoubleBufferPointer
  ) {
    qvel.withUnsafeMutableBufferPointer { qvel__p in
      qpos1.withUnsafeBufferPointer { qpos1__p in
        qpos2.withUnsafeBufferPointer { qpos2__p in
          mj_differentiatePos(
            self._model, qvel__p.baseAddress, dt, qpos1__p.baseAddress, qpos2__p.baseAddress)
        }
      }
    }
  }
  ///  Integrate position with given velocity.
  @inlinable
  public func integratePos<T0: MjDoubleMutableBufferPointer>(
    qpos: inout T0, qvel: MjDoubleBufferPointer, dt: Double
  ) {
    qpos.withUnsafeMutableBufferPointer { qpos__p in
      qvel.withUnsafeBufferPointer { qvel__p in
        mj_integratePos(self._model, qpos__p.baseAddress, qvel__p.baseAddress, dt)
      }
    }
  }
  ///  Normalize all quaternions in qpos-type vector.
  @inlinable
  public func normalizeQuat<T0: MjDoubleMutableBufferPointer>(qpos: inout T0) {
    qpos.withUnsafeMutableBufferPointer { qpos__p in
      mj_normalizeQuat(self._model, qpos__p.baseAddress)
    }
  }
  ///  Sum all body masses.
  @inlinable
  public func getTotalmass() -> Double {
    return mj_getTotalmass(self._model)
  }
  ///  Scale body masses and inertias to achieve specified total mass.
  @inlinable
  public mutating func setTotalmass(newmass: Double) {
    mj_setTotalmass(self._model, newmass)
  }
  /// Intersect ray (pnt+x*vec, x>=0) with visible geoms, except geoms in bodyexclude. Return distance (x) to nearest surface, or -1 if no intersection and output geomid. geomgroup, flg_static are as in mjvOption; geomgroup==NULL skips group exclusion.
  @inlinable
  public func ray<T0: MjInt32MutableBufferPointer>(
    data: MjData, pnt: MjDoubleBufferPointer, vec: MjDoubleBufferPointer,
    geomgroup: MjUInt8BufferPointer, flgStatic: UInt8, bodyexclude: Int32, geomid: inout T0
  ) -> Double {
    precondition(pnt.count == 3)
    return pnt.withUnsafeBufferPointer { pnt__p in
      precondition(vec.count == 3)
      return vec.withUnsafeBufferPointer { vec__p in
        return geomgroup.withUnsafeBufferPointer { geomgroup__p in
          precondition(geomid.count == 1)
          return geomid.withUnsafeMutableBufferPointer { geomid__p in
            return mj_ray(
              self._model, data._data, pnt__p.baseAddress, vec__p.baseAddress,
              geomgroup__p.baseAddress, flgStatic, bodyexclude, geomid__p.baseAddress)
          }
        }
      }
    }
  }
  ///  Interect ray with hfield, return nearest distance or -1 if no intersection.
  @inlinable
  public func rayHfield(
    data: MjData, geomid: Int32, pnt: MjDoubleBufferPointer, vec: MjDoubleBufferPointer
  ) -> Double {
    precondition(pnt.count == 3)
    return pnt.withUnsafeBufferPointer { pnt__p in
      precondition(vec.count == 3)
      return vec.withUnsafeBufferPointer { vec__p in
        return mj_rayHfield(self._model, data._data, geomid, pnt__p.baseAddress, vec__p.baseAddress)
      }
    }
  }
  ///  Interect ray with mesh, return nearest distance or -1 if no intersection.
  @inlinable
  public func rayMesh(
    data: MjData, geomid: Int32, pnt: MjDoubleBufferPointer, vec: MjDoubleBufferPointer
  ) -> Double {
    precondition(pnt.count == 3)
    return pnt.withUnsafeBufferPointer { pnt__p in
      precondition(vec.count == 3)
      return vec.withUnsafeBufferPointer { vec__p in
        return mj_rayMesh(self._model, data._data, geomid, pnt__p.baseAddress, vec__p.baseAddress)
      }
    }
  }
  /// Finite differenced state-transition and control-transition matrices dx(t+h) = A*dx(t) + B*du(t).   required output matrix dimensions:      A: (2*nv+na x 2*nv+na)      B: (2*nv+na x nu)
  @inlinable
  public func transitionFD<T0: MjDoubleMutableBufferPointer, T1: MjDoubleMutableBufferPointer>(
    data: inout MjData, eps: Double, centered: UInt8, a: inout T0, b: inout T1
  ) {
    a.withUnsafeMutableBufferPointer { a__p in
      b.withUnsafeMutableBufferPointer { b__p in
        mjd_transitionFD(self._model, data._data, eps, centered, a__p.baseAddress, b__p.baseAddress)
      }
    }
  }
}
