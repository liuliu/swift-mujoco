extension MjModel {
  @inlinable
  public func resetDataDebug(data: MjData, debug_value: CChar) {
  }
  @inlinable
  public func setConst(data: MjData) {
  }
  @inlinable
  public func setLengthRange(
    data: MjData, index: Int32, opt: MjLROpt, error: CChar, error_sz: Int32
  ) {
  }
  @inlinable
  public func printFormattedModel(filename: String, float_format: String) {
  }
  @inlinable
  public func printModel(filename: String) {
  }
  @inlinable
  public func printFormatted(data: MjData, filename: String, float_format: String) {
  }
  @inlinable
  public func print(data: MjData, filename: String) {
  }
  @inlinable
  public func fwdPosition(data: MjData) {
  }
  @inlinable
  public func fwdVelocity(data: MjData) {
  }
  @inlinable
  public func fwdActuation(data: MjData) {
  }
  @inlinable
  public func fwdAcceleration(data: MjData) {
  }
  @inlinable
  public func fwdConstraint(data: MjData) {
  }
  @inlinable
  public func Euler(data: MjData) {
  }
  @inlinable
  public func RungeKutta(data: MjData, N: Int32) {
  }
  @inlinable
  public func invPosition(data: MjData) {
  }
  @inlinable
  public func invVelocity(data: MjData) {
  }
  @inlinable
  public func invConstraint(data: MjData) {
  }
  @inlinable
  public func compareFwdInv(data: MjData) {
  }
  @inlinable
  public func sensorPos(data: MjData) {
  }
  @inlinable
  public func sensorVel(data: MjData) {
  }
  @inlinable
  public func sensorAcc(data: MjData) {
  }
  @inlinable
  public func energyPos(data: MjData) {
  }
  @inlinable
  public func energyVel(data: MjData) {
  }
  @inlinable
  public func checkPos(data: MjData) {
  }
  @inlinable
  public func checkVel(data: MjData) {
  }
  @inlinable
  public func checkAcc(data: MjData) {
  }
  @inlinable
  public func kinematics(data: MjData) {
  }
  @inlinable
  public func comPos(data: MjData) {
  }
  @inlinable
  public func camlight(data: MjData) {
  }
  @inlinable
  public func tendon(data: MjData) {
  }
  @inlinable
  public func transmission(data: MjData) {
  }
  @inlinable
  public func crb(data: MjData) {
  }
  @inlinable
  public func factorM(data: MjData) {
  }
  @inlinable
  public func solveM(data: MjData, x: Double, y: Double, n: Int32) {
  }
  @inlinable
  public func solveM2(data: MjData, x: Double, y: Double, n: Int32) {
  }
  @inlinable
  public func comVel(data: MjData) {
  }
  @inlinable
  public func passive(data: MjData) {
  }
  @inlinable
  public func subtreeVel(data: MjData) {
  }
  @inlinable
  public func rne(data: MjData, flg_acc: Int32, result: Double) {
  }
  @inlinable
  public func rnePostConstraint(data: MjData) {
  }
  @inlinable
  public func collision(data: MjData) {
  }
  @inlinable
  public func makeConstraint(data: MjData) {
  }
  @inlinable
  public func projectConstraint(data: MjData) {
  }
  @inlinable
  public func referenceConstraint(data: MjData) {
  }
  @inlinable
  public func constraintUpdate(data: MjData, jar: Double, cost: Double, flg_coneHessian: Int32) {
  }
  @inlinable
  public func addContact(data: MjData, contact: MjContact) {
  }
  @inlinable
  public func isPyramidal() {
  }
  @inlinable
  public func isSparse() {
  }
  @inlinable
  public func isDual() {
  }
  @inlinable
  public func mulJacVec(data: MjData, res: Double, vec: Double) {
  }
  @inlinable
  public func mulJacTVec(data: MjData, res: Double, vec: Double) {
  }
  @inlinable
  public func jac(data: MjData, jacp: Double, jacr: Double, point: Double, body: Int32) {
  }
  @inlinable
  public func jacBody(data: MjData, jacp: Double, jacr: Double, body: Int32) {
  }
  @inlinable
  public func jacBodyCom(data: MjData, jacp: Double, jacr: Double, body: Int32) {
  }
  @inlinable
  public func jacGeom(data: MjData, jacp: Double, jacr: Double, geom: Int32) {
  }
  @inlinable
  public func jacSite(data: MjData, jacp: Double, jacr: Double, site: Int32) {
  }
  @inlinable
  public func jacPointAxis(
    data: MjData, jacPoint: Double, jacAxis: Double, point: Double, axis: Double, body: Int32
  ) {
  }
  @inlinable
  public func name2id(type: Int32, name: String) {
  }
  @inlinable
  public func fullM(dst: Double, M: Double) {
  }
  @inlinable
  public func mulM(data: MjData, res: Double, vec: Double) {
  }
  @inlinable
  public func mulM2(data: MjData, res: Double, vec: Double) {
  }
  @inlinable
  public func addM(data: MjData, dst: Double, rownnz: Int32, rowadr: Int32, colind: Int32) {
  }
  @inlinable
  public func applyFT(
    data: MjData, force: Double, torque: Double, point: Double, body: Int32, qfrc_target: Double
  ) {
  }
  @inlinable
  public func objectVelocity(
    data: MjData, objtype: Int32, objid: Int32, res: Double, flg_local: Int32
  ) {
  }
  @inlinable
  public func objectAcceleration(
    data: MjData, objtype: Int32, objid: Int32, res: Double, flg_local: Int32
  ) {
  }
  @inlinable
  public func contactForce(data: MjData, id: Int32, result: Double) {
  }
  @inlinable
  public func differentiatePos(qvel: Double, dt: Double, qpos1: Double, qpos2: Double) {
  }
  @inlinable
  public func integratePos(qpos: Double, qvel: Double, dt: Double) {
  }
  @inlinable
  public func normalizeQuat(qpos: Double) {
  }
  @inlinable
  public func getTotalmass() {
  }
  @inlinable
  public func setTotalmass(newmass: Double) {
  }
  @inlinable
  public func ray(
    data: MjData, pnt: Double, vec: Double, geomgroup: UInt8, flg_static: UInt8, bodyexclude: Int32,
    geomid: Int32
  ) {
  }
  @inlinable
  public func rayHfield(data: MjData, geomid: Int32, pnt: Double, vec: Double) {
  }
  @inlinable
  public func rayMesh(data: MjData, geomid: Int32, pnt: Double, vec: Double) {
  }
}
