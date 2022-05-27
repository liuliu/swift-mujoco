import C_mujoco

extension MjModel {
  @inlinable
  public func step(data: MjData) {
    mj_step(self._model, data._data)
  }
  @inlinable
  public func step1(data: MjData) {
    mj_step1(self._model, data._data)
  }
  @inlinable
  public func step2(data: MjData) {
    mj_step2(self._model, data._data)
  }
  @inlinable
  public func forward(data: MjData) {
    mj_forward(self._model, data._data)
  }
  @inlinable
  public func inverse(data: MjData) {
    mj_inverse(self._model, data._data)
  }
  @inlinable
  public func forwardSkip(data: MjData, skipstage: Int32, skipsensor: Int32) {
    mj_forwardSkip(self._model, data._data, skipstage, skipsensor)
  }
  @inlinable
  public func inverseSkip(data: MjData, skipstage: Int32, skipsensor: Int32) {
    mj_inverseSkip(self._model, data._data, skipstage, skipsensor)
  }
  @inlinable
  public func reset(data: MjData) {
    mj_resetData(self._model, data._data)
  }
  @inlinable
  public func resetDataDebug(data: MjData, debugValue: UInt8) {
    mj_resetDataDebug(self._model, data._data, debugValue)
  }
  @inlinable
  public func reset(data: MjData, keyframe: Int32) {
    mj_resetDataKeyframe(self._model, data._data, keyframe)
  }
  @inlinable
  public func setConst(data: MjData) {
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
  public func printFormatted(data: MjData, filename: String, floatFormat: String) {
    mj_printFormattedData(self._model, data._data, filename, floatFormat)
  }
  @inlinable
  public func print(data: MjData, filename: String) {
    mj_printData(self._model, data._data, filename)
  }
  @inlinable
  public func fwdPosition(data: MjData) {
    mj_fwdPosition(self._model, data._data)
  }
  @inlinable
  public func fwdVelocity(data: MjData) {
    mj_fwdVelocity(self._model, data._data)
  }
  @inlinable
  public func fwdActuation(data: MjData) {
    mj_fwdActuation(self._model, data._data)
  }
  @inlinable
  public func fwdAcceleration(data: MjData) {
    mj_fwdAcceleration(self._model, data._data)
  }
  @inlinable
  public func fwdConstraint(data: MjData) {
    mj_fwdConstraint(self._model, data._data)
  }
  @inlinable
  public func Euler(data: MjData) {
    mj_Euler(self._model, data._data)
  }
  @inlinable
  public func RungeKutta(data: MjData, n: Int32) {
    mj_RungeKutta(self._model, data._data, n)
  }
  @inlinable
  public func invPosition(data: MjData) {
    mj_invPosition(self._model, data._data)
  }
  @inlinable
  public func invVelocity(data: MjData) {
    mj_invVelocity(self._model, data._data)
  }
  @inlinable
  public func invConstraint(data: MjData) {
    mj_invConstraint(self._model, data._data)
  }
  @inlinable
  public func compareFwdInv(data: MjData) {
    mj_compareFwdInv(self._model, data._data)
  }
  @inlinable
  public func sensorPos(data: MjData) {
    mj_sensorPos(self._model, data._data)
  }
  @inlinable
  public func sensorVel(data: MjData) {
    mj_sensorVel(self._model, data._data)
  }
  @inlinable
  public func sensorAcc(data: MjData) {
    mj_sensorAcc(self._model, data._data)
  }
  @inlinable
  public func energyPos(data: MjData) {
    mj_energyPos(self._model, data._data)
  }
  @inlinable
  public func energyVel(data: MjData) {
    mj_energyVel(self._model, data._data)
  }
  @inlinable
  public func checkPos(data: MjData) {
    mj_checkPos(self._model, data._data)
  }
  @inlinable
  public func checkVel(data: MjData) {
    mj_checkVel(self._model, data._data)
  }
  @inlinable
  public func checkAcc(data: MjData) {
    mj_checkAcc(self._model, data._data)
  }
  @inlinable
  public func kinematics(data: MjData) {
    mj_kinematics(self._model, data._data)
  }
  @inlinable
  public func comPos(data: MjData) {
    mj_comPos(self._model, data._data)
  }
  @inlinable
  public func camlight(data: MjData) {
    mj_camlight(self._model, data._data)
  }
  @inlinable
  public func tendon(data: MjData) {
    mj_tendon(self._model, data._data)
  }
  @inlinable
  public func transmission(data: MjData) {
    mj_transmission(self._model, data._data)
  }
  @inlinable
  public func crb(data: MjData) {
    mj_crb(self._model, data._data)
  }
  @inlinable
  public func factorM(data: MjData) {
    mj_factorM(self._model, data._data)
  }
  @inlinable
  public func comVel(data: MjData) {
    mj_comVel(self._model, data._data)
  }
  @inlinable
  public func passive(data: MjData) {
    mj_passive(self._model, data._data)
  }
  @inlinable
  public func subtreeVel(data: MjData) {
    mj_subtreeVel(self._model, data._data)
  }
  @inlinable
  public func rnePostConstraint(data: MjData) {
    mj_rnePostConstraint(self._model, data._data)
  }
  @inlinable
  public func collision(data: MjData) {
    mj_collision(self._model, data._data)
  }
  @inlinable
  public func makeConstraint(data: MjData) {
    mj_makeConstraint(self._model, data._data)
  }
  @inlinable
  public func projectConstraint(data: MjData) {
    mj_projectConstraint(self._model, data._data)
  }
  @inlinable
  public func referenceConstraint(data: MjData) {
    mj_referenceConstraint(self._model, data._data)
  }
  @inlinable
  public func isPyramidal() {
    mj_isPyramidal(self._model)
  }
  @inlinable
  public func isSparse() {
    mj_isSparse(self._model)
  }
  @inlinable
  public func isDual() {
    mj_isDual(self._model)
  }
  @inlinable
  public func name2id(type: Int32, name: String) {
    mj_name2id(self._model, type, name)
  }
  @inlinable
  public func getTotalmass() {
    mj_getTotalmass(self._model)
  }
  @inlinable
  public func setTotalmass(newmass: Double) {
    mj_setTotalmass(self._model, newmass)
  }
}
