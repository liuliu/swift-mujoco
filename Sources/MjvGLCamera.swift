import C_mujoco

public struct MjvGLCamera {
  @usableFromInline
  var _glcamera: mjvGLCamera
  public init() {
    _glcamera = mjvGLCamera()
  }
  public init(_ glcamera: mjvGLCamera) {
    _glcamera = glcamera
  }
}
