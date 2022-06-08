extension MjvCamera {
  /// camera type (mjtCamera)
  @inlinable
  public var type: MjtCamera {
    get { MjtCamera(rawValue: _camera.type)! }
    set { _camera.type = newValue.rawValue }
  }
  /// fixed camera id
  @inlinable
  public var fixedcamid: Int32 {
    get { _camera.fixedcamid }
    set { _camera.fixedcamid = newValue }
  }
  /// body id to track
  @inlinable
  public var trackbodyid: Int32 {
    get { _camera.trackbodyid }
    set { _camera.trackbodyid = newValue }
  }
  /// lookat point
  @inlinable
  public var lookat: (Double, Double, Double) {
    get { _camera.lookat }
    set { _camera.lookat = newValue }
  }
  /// distance to lookat point or tracked body
  @inlinable
  public var distance: Double {
    get { _camera.distance }
    set { _camera.distance = newValue }
  }
  /// camera azimuth (deg)
  @inlinable
  public var azimuth: Double {
    get { _camera.azimuth }
    set { _camera.azimuth = newValue }
  }
  /// camera elevation (deg)
  @inlinable
  public var elevation: Double {
    get { _camera.elevation }
    set { _camera.elevation = newValue }
  }
}
extension MjvCamera: CustomReflectable {
  public var customMirror: Mirror {
    Mirror(
      self,
      children: [
        "type": type, "fixedcamid": fixedcamid, "trackbodyid": trackbodyid, "lookat": lookat,
        "distance": distance, "azimuth": azimuth, "elevation": elevation,
      ])
  }
}
