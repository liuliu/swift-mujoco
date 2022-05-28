import C_mujoco

extension MjModel {
  @inlinable
  public func step(data: inout MjData) {
    mj_step(self._model, data._data)
  }
  @inlinable
  public func step1(data: inout MjData) {
    mj_step1(self._model, data._data)
  }
  @inlinable
  public func step2(data: inout MjData) {
    mj_step2(self._model, data._data)
  }
  @inlinable
  public func forward(data: inout MjData) {
    mj_forward(self._model, data._data)
  }
  @inlinable
  public func inverse(data: inout MjData) {
    mj_inverse(self._model, data._data)
  }
  @inlinable
  public func forwardSkip(data: inout MjData, skipstage: Int32, skipsensor: Int32) {
    mj_forwardSkip(self._model, data._data, skipstage, skipsensor)
  }
  @inlinable
  public func inverseSkip(data: inout MjData, skipstage: Int32, skipsensor: Int32) {
    mj_inverseSkip(self._model, data._data, skipstage, skipsensor)
  }
  @inlinable
  public func reset(data: inout MjData) {
    mj_resetData(self._model, data._data)
  }
  @inlinable
  public func resetDataDebug(data: inout MjData, debugValue: UInt8) {
    mj_resetDataDebug(self._model, data._data, debugValue)
  }
  @inlinable
  public func reset(data: inout MjData, keyframe: Int32) {
    mj_resetDataKeyframe(self._model, data._data, keyframe)
  }
  @inlinable
  public func setConst(data: inout MjData) {
    mj_setConst(self._model, data._data)
  }
  @inlinable
  public func printFormattedModel(filename: String, floatFormat: String) {
    mj_printFormattedModel(self._model, filename, floatFormat)
  }
  @inlinable
  public func printModel(filename: String) {
    mj_printModel(self._model, filename)
  }
  @inlinable
  public func printFormatted(data: inout MjData, filename: String, floatFormat: String) {
    mj_printFormattedData(self._model, data._data, filename, floatFormat)
  }
  @inlinable
  public func print(data: inout MjData, filename: String) {
    mj_printData(self._model, data._data, filename)
  }
  @inlinable
  public func fwdPosition(data: inout MjData) {
    mj_fwdPosition(self._model, data._data)
  }
  @inlinable
  public func fwdVelocity(data: inout MjData) {
    mj_fwdVelocity(self._model, data._data)
  }
  @inlinable
  public func fwdActuation(data: inout MjData) {
    mj_fwdActuation(self._model, data._data)
  }
  @inlinable
  public func fwdAcceleration(data: inout MjData) {
    mj_fwdAcceleration(self._model, data._data)
  }
  @inlinable
  public func fwdConstraint(data: inout MjData) {
    mj_fwdConstraint(self._model, data._data)
  }
  @inlinable
  public func Euler(data: inout MjData) {
    mj_Euler(self._model, data._data)
  }
  @inlinable
  public func RungeKutta(data: inout MjData, n: Int32) {
    mj_RungeKutta(self._model, data._data, n)
  }
  @inlinable
  public func invPosition(data: inout MjData) {
    mj_invPosition(self._model, data._data)
  }
  @inlinable
  public func invVelocity(data: inout MjData) {
    mj_invVelocity(self._model, data._data)
  }
  @inlinable
  public func invConstraint(data: inout MjData) {
    mj_invConstraint(self._model, data._data)
  }
  @inlinable
  public func compareFwdInv(data: inout MjData) {
    mj_compareFwdInv(self._model, data._data)
  }
  @inlinable
  public func sensorPos(data: inout MjData) {
    mj_sensorPos(self._model, data._data)
  }
  @inlinable
  public func sensorVel(data: inout MjData) {
    mj_sensorVel(self._model, data._data)
  }
  @inlinable
  public func sensorAcc(data: inout MjData) {
    mj_sensorAcc(self._model, data._data)
  }
  @inlinable
  public func energyPos(data: inout MjData) {
    mj_energyPos(self._model, data._data)
  }
  @inlinable
  public func energyVel(data: inout MjData) {
    mj_energyVel(self._model, data._data)
  }
  @inlinable
  public func checkPos(data: inout MjData) {
    mj_checkPos(self._model, data._data)
  }
  @inlinable
  public func checkVel(data: inout MjData) {
    mj_checkVel(self._model, data._data)
  }
  @inlinable
  public func checkAcc(data: inout MjData) {
    mj_checkAcc(self._model, data._data)
  }
  @inlinable
  public func kinematics(data: inout MjData) {
    mj_kinematics(self._model, data._data)
  }
  @inlinable
  public func comPos(data: inout MjData) {
    mj_comPos(self._model, data._data)
  }
  @inlinable
  public func camlight(data: inout MjData) {
    mj_camlight(self._model, data._data)
  }
  @inlinable
  public func tendon(data: inout MjData) {
    mj_tendon(self._model, data._data)
  }
  @inlinable
  public func transmission(data: inout MjData) {
    mj_transmission(self._model, data._data)
  }
  @inlinable
  public func crb(data: inout MjData) {
    mj_crb(self._model, data._data)
  }
  @inlinable
  public func factorM(data: inout MjData) {
    mj_factorM(self._model, data._data)
  }
  @inlinable
  public func solveM(
    data: inout MjData, x: inout MjDoubleMutableBufferPointer, y: MjDoubleBufferPointer, n: Int32
  ) {
    x.withUnsafeMutableBufferPointer { x__p in
      y.withUnsafeBufferPointer { y__p in
        mj_solveM(self._model, data._data, x__p.baseAddress, y__p.baseAddress, n)
      }
    }
  }
  @inlinable
  public func solveM2(
    data: inout MjData, x: inout MjDoubleMutableBufferPointer, y: MjDoubleBufferPointer, n: Int32
  ) {
    x.withUnsafeMutableBufferPointer { x__p in
      y.withUnsafeBufferPointer { y__p in
        mj_solveM2(self._model, data._data, x__p.baseAddress, y__p.baseAddress, n)
      }
    }
  }
  @inlinable
  public func comVel(data: inout MjData) {
    mj_comVel(self._model, data._data)
  }
  @inlinable
  public func passive(data: inout MjData) {
    mj_passive(self._model, data._data)
  }
  @inlinable
  public func subtreeVel(data: inout MjData) {
    mj_subtreeVel(self._model, data._data)
  }
  @inlinable
  public func rne(data: inout MjData, flgAcc: Int32, result: inout MjDoubleMutableBufferPointer) {
    result.withUnsafeMutableBufferPointer { result__p in
      mj_rne(self._model, data._data, flgAcc, result__p.baseAddress)
    }
  }
  @inlinable
  public func rnePostConstraint(data: inout MjData) {
    mj_rnePostConstraint(self._model, data._data)
  }
  @inlinable
  public func collision(data: inout MjData) {
    mj_collision(self._model, data._data)
  }
  @inlinable
  public func makeConstraint(data: inout MjData) {
    mj_makeConstraint(self._model, data._data)
  }
  @inlinable
  public func projectConstraint(data: inout MjData) {
    mj_projectConstraint(self._model, data._data)
  }
  @inlinable
  public func referenceConstraint(data: inout MjData) {
    mj_referenceConstraint(self._model, data._data)
  }
  @inlinable
  public func addContact(data: inout MjData, contact: MjContact) -> Int32 {
    var contact__contact = contact._contact
    return mj_addContact(self._model, data._data, &contact__contact)
  }
  @inlinable
  public func isPyramidal() -> Bool {
    return (0 != mj_isPyramidal(self._model))
  }
  @inlinable
  public func isSparse() -> Bool {
    return (0 != mj_isSparse(self._model))
  }
  @inlinable
  public func isDual() -> Bool {
    return (0 != mj_isDual(self._model))
  }
  @inlinable
  public func mulJacVec(
    data: inout MjData, res: inout MjDoubleMutableBufferPointer, vec: MjDoubleBufferPointer
  ) {
    res.withUnsafeMutableBufferPointer { res__p in
      vec.withUnsafeBufferPointer { vec__p in
        mj_mulJacVec(self._model, data._data, res__p.baseAddress, vec__p.baseAddress)
      }
    }
  }
  @inlinable
  public func mulJacTVec(
    data: inout MjData, res: inout MjDoubleMutableBufferPointer, vec: MjDoubleBufferPointer
  ) {
    res.withUnsafeMutableBufferPointer { res__p in
      vec.withUnsafeBufferPointer { vec__p in
        mj_mulJacTVec(self._model, data._data, res__p.baseAddress, vec__p.baseAddress)
      }
    }
  }
  @inlinable
  public func jacBody(
    data: MjData, jacp: inout MjDoubleMutableBufferPointer,
    jacr: inout MjDoubleMutableBufferPointer, body: Int32
  ) {
    jacp.withUnsafeMutableBufferPointer { jacp__p in
      jacr.withUnsafeMutableBufferPointer { jacr__p in
        mj_jacBody(self._model, data._data, jacp__p.baseAddress, jacr__p.baseAddress, body)
      }
    }
  }
  @inlinable
  public func jacBodyCom(
    data: MjData, jacp: inout MjDoubleMutableBufferPointer,
    jacr: inout MjDoubleMutableBufferPointer, body: Int32
  ) {
    jacp.withUnsafeMutableBufferPointer { jacp__p in
      jacr.withUnsafeMutableBufferPointer { jacr__p in
        mj_jacBodyCom(self._model, data._data, jacp__p.baseAddress, jacr__p.baseAddress, body)
      }
    }
  }
  @inlinable
  public func jacGeom(
    data: MjData, jacp: inout MjDoubleMutableBufferPointer,
    jacr: inout MjDoubleMutableBufferPointer, geom: Int32
  ) {
    jacp.withUnsafeMutableBufferPointer { jacp__p in
      jacr.withUnsafeMutableBufferPointer { jacr__p in
        mj_jacGeom(self._model, data._data, jacp__p.baseAddress, jacr__p.baseAddress, geom)
      }
    }
  }
  @inlinable
  public func jacSite(
    data: MjData, jacp: inout MjDoubleMutableBufferPointer,
    jacr: inout MjDoubleMutableBufferPointer, site: Int32
  ) {
    jacp.withUnsafeMutableBufferPointer { jacp__p in
      jacr.withUnsafeMutableBufferPointer { jacr__p in
        mj_jacSite(self._model, data._data, jacp__p.baseAddress, jacr__p.baseAddress, site)
      }
    }
  }
  @inlinable
  public func name2id(type: Int32, name: String) -> Int32 {
    return mj_name2id(self._model, type, name)
  }
  @inlinable
  public func fullM(dst: inout MjDoubleMutableBufferPointer, m: MjDoubleBufferPointer) {
    dst.withUnsafeMutableBufferPointer { dst__p in
      m.withUnsafeBufferPointer { m__p in
        mj_fullM(self._model, dst__p.baseAddress, m__p.baseAddress)
      }
    }
  }
  @inlinable
  public func mulM(
    data: MjData, res: inout MjDoubleMutableBufferPointer, vec: MjDoubleBufferPointer
  ) {
    res.withUnsafeMutableBufferPointer { res__p in
      vec.withUnsafeBufferPointer { vec__p in
        mj_mulM(self._model, data._data, res__p.baseAddress, vec__p.baseAddress)
      }
    }
  }
  @inlinable
  public func mulM2(
    data: MjData, res: inout MjDoubleMutableBufferPointer, vec: MjDoubleBufferPointer
  ) {
    res.withUnsafeMutableBufferPointer { res__p in
      vec.withUnsafeBufferPointer { vec__p in
        mj_mulM2(self._model, data._data, res__p.baseAddress, vec__p.baseAddress)
      }
    }
  }
  @inlinable
  public func addM(
    data: inout MjData, dst: inout MjDoubleMutableBufferPointer,
    rownnz: inout MjInt32MutableBufferPointer, rowadr: inout MjInt32MutableBufferPointer,
    colind: inout MjInt32MutableBufferPointer
  ) {
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
  @inlinable
  public func differentiatePos(
    qvel: inout MjDoubleMutableBufferPointer, dt: Double, qpos1: MjDoubleBufferPointer,
    qpos2: MjDoubleBufferPointer
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
  @inlinable
  public func integratePos(
    qpos: inout MjDoubleMutableBufferPointer, qvel: MjDoubleBufferPointer, dt: Double
  ) {
    qpos.withUnsafeMutableBufferPointer { qpos__p in
      qvel.withUnsafeBufferPointer { qvel__p in
        mj_integratePos(self._model, qpos__p.baseAddress, qvel__p.baseAddress, dt)
      }
    }
  }
  @inlinable
  public func normalizeQuat(qpos: inout MjDoubleMutableBufferPointer) {
    qpos.withUnsafeMutableBufferPointer { qpos__p in
      mj_normalizeQuat(self._model, qpos__p.baseAddress)
    }
  }
  @inlinable
  public func getTotalmass() -> Double {
    return mj_getTotalmass(self._model)
  }
  @inlinable
  public func setTotalmass(newmass: Double) {
    mj_setTotalmass(self._model, newmass)
  }
}
