extension MjvGLCamera {
  @inlinable
  public var pos: (Float, Float, Float) {
    get { _glcamera.pos }
    set { _glcamera.pos = newValue }
  }
  @inlinable
  public var forward: (Float, Float, Float) {
    get { _glcamera.forward }
    set { _glcamera.forward = newValue }
  }
  @inlinable
  public var up: (Float, Float, Float) {
    get { _glcamera.up }
    set { _glcamera.up = newValue }
  }
  @inlinable
  public var frustumCenter: Float {
    get { _glcamera.frustum_center }
    set { _glcamera.frustum_center = newValue }
  }
  @inlinable
  public var frustumBottom: Float {
    get { _glcamera.frustum_bottom }
    set { _glcamera.frustum_bottom = newValue }
  }
  @inlinable
  public var frustumTop: Float {
    get { _glcamera.frustum_top }
    set { _glcamera.frustum_top = newValue }
  }
  @inlinable
  public var frustumNear: Float {
    get { _glcamera.frustum_near }
    set { _glcamera.frustum_near = newValue }
  }
  @inlinable
  public var frustumFar: Float {
    get { _glcamera.frustum_far }
    set { _glcamera.frustum_far = newValue }
  }
}
