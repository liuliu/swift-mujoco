extension MjvScene {
  @inlinable
  public func room2model(modelpos: Double, modelquat: Double, roompos: Double, roomquat: Double) {
  }
  @inlinable
  public func model2room(roompos: Double, roomquat: Double, modelpos: Double, modelquat: Double) {
  }
  @inlinable
  public func cameraInModel(headpos: Double, forward: Double, up: Double) {
  }
  @inlinable
  public func cameraInRoom(headpos: Double, forward: Double, up: Double) {
  }
  @inlinable
  public func frustumHeight() {
  }
  @inlinable
  public func move(model: MjModel, action: Int32, reldx: Double, reldy: Double, roomup: Double) {
  }
  @inlinable
  public func select(
    model: MjModel, data: MjData, vopt: MjvOption, aspectratio: Double, relx: Double, rely: Double,
    selpnt: Double, geomid: Int32, skinid: Int32
  ) {
  }
  @inlinable
  public func updateScene(
    model: MjModel, data: MjData, opt: MjvOption, pert: MjvPerturb, cam: MjvCamera, catmask: Int32
  ) {
  }
  @inlinable
  public func addGeoms(
    model: MjModel, data: MjData, opt: MjvOption, pert: MjvPerturb, catmask: Int32
  ) {
  }
  @inlinable
  public func makeLights(model: MjModel, data: MjData) {
  }
  @inlinable
  public func updateCamera(model: MjModel, data: MjData, cam: MjvCamera) {
  }
  @inlinable
  public func updateSkin(model: MjModel, data: MjData) {
  }
}
