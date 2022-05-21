extension MjvScene {
  @inlinable
  public var maxgeom: Int32 {
    get { _scene.maxgeom }
    set { _scene.maxgeom = newValue }
  }
  @inlinable
  public var ngeom: Int32 {
    get { _scene.ngeom }
    set { _scene.ngeom = newValue }
  }
  @inlinable
  public var geoms: MjArray<MjvGeom> {
    get {
      MjArray<MjvGeom>(
        array: UnsafeMutableRawPointer(_scene.geoms).assumingMemoryBound(to: MjvGeom.self),
        object: self, len: ngeom)
    }
    set {
      let unsafeMutablePointer = UnsafeMutableRawPointer(_scene.geoms).assumingMemoryBound(
        to: MjvGeom.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom))
    }
  }
  @inlinable
  public var geomorder: MjArray<Int32> {
    get { MjArray<Int32>(array: _scene.geomorder, object: self, len: ngeom) }
    set {
      guard _scene.geomorder != newValue._array else { return }
      _scene.geomorder.assign(from: newValue._array, count: Int(ngeom))
    }
  }
  @inlinable
  public var nskin: Int32 {
    get { _scene.nskin }
    set { _scene.nskin = newValue }
  }
  @inlinable
  public var skinfacenum: MjArray<Int32> {
    get { MjArray<Int32>(array: _scene.skinfacenum, object: self, len: nskin) }
    set {
      guard _scene.skinfacenum != newValue._array else { return }
      _scene.skinfacenum.assign(from: newValue._array, count: Int(nskin))
    }
  }
  @inlinable
  public var skinvertadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _scene.skinvertadr, object: self, len: nskin) }
    set {
      guard _scene.skinvertadr != newValue._array else { return }
      _scene.skinvertadr.assign(from: newValue._array, count: Int(nskin))
    }
  }
  @inlinable
  public var skinvertnum: MjArray<Int32> {
    get { MjArray<Int32>(array: _scene.skinvertnum, object: self, len: nskin) }
    set {
      guard _scene.skinvertnum != newValue._array else { return }
      _scene.skinvertnum.assign(from: newValue._array, count: Int(nskin))
    }
  }
  @inlinable
  public var skinvert: MjArray<Float> {
    get { MjArray<Float>(array: _scene.skinvert, object: self, len: nskin) }
    set {
      guard _scene.skinvert != newValue._array else { return }
      _scene.skinvert.assign(from: newValue._array, count: Int(nskin))
    }
  }
  @inlinable
  public var skinnormal: MjArray<Float> {
    get { MjArray<Float>(array: _scene.skinnormal, object: self, len: nskin) }
    set {
      guard _scene.skinnormal != newValue._array else { return }
      _scene.skinnormal.assign(from: newValue._array, count: Int(nskin))
    }
  }
  @inlinable
  public var nlight: Int32 {
    get { _scene.nlight }
    set { _scene.nlight = newValue }
  }
  @inlinable
  public var camera: (MjvGLCamera, MjvGLCamera) {
    get { (MjvGLCamera(_scene.camera.0), MjvGLCamera(_scene.camera.1)) }
    set {
      _scene.camera.0 = newValue.0._glcamera
      _scene.camera.1 = newValue.1._glcamera
    }
  }
  @inlinable
  public var enabletransform: UInt8 {
    get { _scene.enabletransform }
    set { _scene.enabletransform = newValue }
  }
  @inlinable
  public var translate: (Float, Float, Float) {
    get { _scene.translate }
    set { _scene.translate = newValue }
  }
  @inlinable
  public var rotate: (Float, Float, Float, Float) {
    get { _scene.rotate }
    set { _scene.rotate = newValue }
  }
  @inlinable
  public var scale: Float {
    get { _scene.scale }
    set { _scene.scale = newValue }
  }
  @inlinable
  public var stereo: Int32 {
    get { _scene.stereo }
    set { _scene.stereo = newValue }
  }
  @inlinable
  public var flags: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8) {
    get { _scene.flags }
    set { _scene.flags = newValue }
  }
  @inlinable
  public var framewidth: Int32 {
    get { _scene.framewidth }
    set { _scene.framewidth = newValue }
  }
  @inlinable
  public var framergb: (Float, Float, Float) {
    get { _scene.framergb }
    set { _scene.framergb = newValue }
  }
}
