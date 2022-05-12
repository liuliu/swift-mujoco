import C_mujoco

public struct MjvCamera {
  @usableFromInline
  var _camera: mjvCamera
  public init() {
    _camera = mjvCamera()
    mjv_defaultCamera(&_camera)
  }
}
