extension MjvScene {
  /// size of allocated geom buffer
  @inlinable
  public var maxgeom: Int32 {
    get { _scene.pointee.maxgeom }
    set { _scene.pointee.maxgeom = newValue }
  }
  /// number of geoms currently in buffer
  @inlinable
  public var ngeom: Int32 {
    get { _scene.pointee.ngeom }
    set { _scene.pointee.ngeom = newValue }
  }
  /// buffer for geoms (ngeom)
  @inlinable
  public var geoms: MjArray<MjvGeom> {
    get {
      MjArray<MjvGeom>(
        array: UnsafeMutableRawPointer(_scene.pointee.geoms).assumingMemoryBound(to: MjvGeom.self),
        object: _storage, len: ngeom)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjvGeom> = UnsafeMutableRawPointer(
        _scene.pointee.geoms
      ).assumingMemoryBound(to: MjvGeom.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom))
    }
  }
  /// buffer for ordering geoms by distance to camera (ngeom)
  @inlinable
  public var geomorder: MjArray<Int32> {
    get { MjArray<Int32>(array: _scene.pointee.geomorder, object: _storage, len: ngeom) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _scene.pointee.geomorder
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ngeom))
    }
  }
  /// number of skins
  @inlinable
  public var nskin: Int32 {
    get { _scene.pointee.nskin }
    set { _scene.pointee.nskin = newValue }
  }
  /// number of faces in skin (nskin)
  @inlinable
  public var skinfacenum: MjArray<Int32> {
    get { MjArray<Int32>(array: _scene.pointee.skinfacenum, object: _storage, len: nskin) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _scene.pointee.skinfacenum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin))
    }
  }
  /// address of skin vertices (nskin)
  @inlinable
  public var skinvertadr: MjArray<Int32> {
    get { MjArray<Int32>(array: _scene.pointee.skinvertadr, object: _storage, len: nskin) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _scene.pointee.skinvertadr
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin))
    }
  }
  /// number of vertices in skin (nskin)
  @inlinable
  public var skinvertnum: MjArray<Int32> {
    get { MjArray<Int32>(array: _scene.pointee.skinvertnum, object: _storage, len: nskin) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = _scene.pointee.skinvertnum
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin))
    }
  }
  /// skin vertex data (nskin)
  @inlinable
  public var skinvert: MjArray<Float> {
    get { MjArray<Float>(array: _scene.pointee.skinvert, object: _storage, len: nskin) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _scene.pointee.skinvert
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin))
    }
  }
  /// skin normal data (nskin)
  @inlinable
  public var skinnormal: MjArray<Float> {
    get { MjArray<Float>(array: _scene.pointee.skinnormal, object: _storage, len: nskin) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Float> = _scene.pointee.skinnormal
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin))
    }
  }
  /// number of lights currently in buffer
  @inlinable
  public var nlight: Int32 {
    get { _scene.pointee.nlight }
    set { _scene.pointee.nlight = newValue }
  }
  /// buffer for lights (nlight)
  @inlinable
  public var lights: MjArray<MjvLight> {
    get {
      MjArray<MjvLight>(
        array: UnsafeMutableRawPointer(
          withUnsafeMutablePointer(to: &_scene.pointee.lights.0, { $0 })
        ).assumingMemoryBound(to: MjvLight.self), object: _storage, len: nlight)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjvLight> = UnsafeMutableRawPointer(
        withUnsafeMutablePointer(to: &_scene.pointee.lights.0, { $0 })
      ).assumingMemoryBound(to: MjvLight.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nlight))
    }
  }
  /// left and right camera
  @inlinable
  public var camera: (MjvGLCamera, MjvGLCamera) {
    get { (MjvGLCamera(_scene.pointee.camera.0), MjvGLCamera(_scene.pointee.camera.1)) }
    set {
      _scene.pointee.camera.0 = newValue.0._glcamera
      _scene.pointee.camera.1 = newValue.1._glcamera
    }
  }
  /// enable model transformation
  @inlinable
  public var enabletransform: UInt8 {
    get { _scene.pointee.enabletransform }
    set { _scene.pointee.enabletransform = newValue }
  }
  /// model translation
  @inlinable
  public var translate: (Float, Float, Float) {
    get { _scene.pointee.translate }
    set { _scene.pointee.translate = newValue }
  }
  /// model quaternion rotation
  @inlinable
  public var rotate: (Float, Float, Float, Float) {
    get { _scene.pointee.rotate }
    set { _scene.pointee.rotate = newValue }
  }
  /// model scaling
  @inlinable
  public var scale: Float {
    get { _scene.pointee.scale }
    set { _scene.pointee.scale = newValue }
  }
  /// stereoscopic rendering (mjtStereo)
  @inlinable
  public var stereo: MjtStereo {
    get { MjtStereo(rawValue: _scene.pointee.stereo)! }
    set { _scene.pointee.stereo = newValue.rawValue }
  }
  /// rendering flags (indexed by mjtRndFlag)
  @inlinable
  public var flags: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8) {
    get { _scene.pointee.flags }
    set { _scene.pointee.flags = newValue }
  }
  /// frame pixel width; 0: disable framing
  @inlinable
  public var framewidth: Int32 {
    get { _scene.pointee.framewidth }
    set { _scene.pointee.framewidth = newValue }
  }
  /// frame color
  @inlinable
  public var framergb: (Float, Float, Float) {
    get { _scene.pointee.framergb }
    set { _scene.pointee.framergb = newValue }
  }
}
extension MjvScene: CustomReflectable {
  public var customMirror: Mirror {
    Mirror(
      self,
      children: [
        "maxgeom": maxgeom, "ngeom": ngeom, "geoms": geoms, "geomorder": geomorder, "nskin": nskin,
        "skinfacenum": skinfacenum, "skinvertadr": skinvertadr, "skinvertnum": skinvertnum,
        "skinvert": skinvert, "skinnormal": skinnormal, "nlight": nlight, "lights": lights,
        "camera": camera, "enabletransform": enabletransform, "translate": translate,
        "rotate": rotate, "scale": scale, "stereo": stereo, "flags": flags,
        "framewidth": framewidth, "framergb": framergb,
      ])
  }
}
