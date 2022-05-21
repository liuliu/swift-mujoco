import C_mujoco

public struct MjvGLCamera {
  @usableFromInline
  var _glcamera: mjvGLCamera
  public init() {
    _glcamera = mjvGLCamera()
  }
}
