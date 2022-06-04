import C_mujoco

/// OpenGL camera
///
/// This is the data structure describing one OpenGL camera.
public struct MjvGLCamera {
  @usableFromInline
  var _glcamera: mjvGLCamera
  public init() {
    _glcamera = mjvGLCamera()
  }
  @usableFromInline
  init(_ glcamera: mjvGLCamera) {
    _glcamera = glcamera
  }
}
