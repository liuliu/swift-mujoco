import C_mujoco

extension MjvGLCamera {
  ///  Return the average of two OpenGL cameras.
  @inlinable
  public func averageCamera(cam2: MjvGLCamera) -> MjvGLCamera {
    var __glcamera = self._glcamera
    var cam2__glcamera = cam2._glcamera
    return MjvGLCamera(mjv_averageCamera(&__glcamera, &cam2__glcamera))
  }
}
