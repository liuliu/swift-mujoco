import C_mujoco

/// abstract camera
///
/// This is the data structure describing one abstract camera.
public struct MjvCamera {
  @usableFromInline
  var _camera: mjvCamera
  public init() {
    _camera = mjvCamera()
    mjv_defaultCamera(&_camera)
  }
}
