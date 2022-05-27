import C_mujoco

extension MjvGLCamera {
  @inlinable
  public func averageCamera(cam2: MjvGLCamera) {
    var __glcamera = self._glcamera
    var cam2__glcamera = cam2._glcamera
    mjv_averageCamera(&__glcamera, &cam2__glcamera)
  }
}
