extension MjvCamera {
  @inlinable
  public var type: MjtCamera {
    get { MjtCamera(rawValue: _camera.type)! }
    set { _camera.type = newValue.rawValue }
  }
  @inlinable
  public var fixedcamid: Int32 {
    get { _camera.fixedcamid }
    set { _camera.fixedcamid = newValue }
  }
  @inlinable
  public var trackbodyid: Int32 {
    get { _camera.trackbodyid }
    set { _camera.trackbodyid = newValue }
  }
  @inlinable
  public var lookat: (Double, Double, Double) {
    get { _camera.lookat }
    set { _camera.lookat = newValue }
  }
  @inlinable
  public var distance: Double {
    get { _camera.distance }
    set { _camera.distance = newValue }
  }
  @inlinable
  public var azimuth: Double {
    get { _camera.azimuth }
    set { _camera.azimuth = newValue }
  }
  @inlinable
  public var elevation: Double {
    get { _camera.elevation }
    set { _camera.elevation = newValue }
  }
}
