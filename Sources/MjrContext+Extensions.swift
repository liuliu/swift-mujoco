extension MjrContext {
  @inlinable
  public var lineWidth: Float {
    get { _context.pointee.lineWidth }
    set { _context.pointee.lineWidth = newValue }
  }
  @inlinable
  public var shadowClip: Float {
    get { _context.pointee.shadowClip }
    set { _context.pointee.shadowClip = newValue }
  }
  @inlinable
  public var shadowScale: Float {
    get { _context.pointee.shadowScale }
    set { _context.pointee.shadowScale = newValue }
  }
  @inlinable
  public var fogStart: Float {
    get { _context.pointee.fogStart }
    set { _context.pointee.fogStart = newValue }
  }
  @inlinable
  public var fogEnd: Float {
    get { _context.pointee.fogEnd }
    set { _context.pointee.fogEnd = newValue }
  }
  @inlinable
  public var fogRgba: (Float, Float, Float, Float) {
    get { _context.pointee.fogRGBA }
    set { _context.pointee.fogRGBA = newValue }
  }
  @inlinable
  public var shadowSize: Int32 {
    get { _context.pointee.shadowSize }
    set { _context.pointee.shadowSize = newValue }
  }
  @inlinable
  public var offWidth: Int32 {
    get { _context.pointee.offWidth }
    set { _context.pointee.offWidth = newValue }
  }
  @inlinable
  public var offHeight: Int32 {
    get { _context.pointee.offHeight }
    set { _context.pointee.offHeight = newValue }
  }
  @inlinable
  public var offSamples: Int32 {
    get { _context.pointee.offSamples }
    set { _context.pointee.offSamples = newValue }
  }
  @inlinable
  public var fontScale: Int32 {
    get { _context.pointee.fontScale }
    set { _context.pointee.fontScale = newValue }
  }
  @inlinable
  public var auxWidth: MjArray<Int32> {
    get {
      MjArray<Int32>(
        array: withUnsafeMutablePointer(to: &_context.pointee.auxWidth.0, { $0 }), object: _storage,
        len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = withUnsafeMutablePointer(
        to: &_context.pointee.auxWidth.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  @inlinable
  public var auxHeight: MjArray<Int32> {
    get {
      MjArray<Int32>(
        array: withUnsafeMutablePointer(to: &_context.pointee.auxHeight.0, { $0 }),
        object: _storage, len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = withUnsafeMutablePointer(
        to: &_context.pointee.auxHeight.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  @inlinable
  public var auxSamples: MjArray<Int32> {
    get {
      MjArray<Int32>(
        array: withUnsafeMutablePointer(to: &_context.pointee.auxSamples.0, { $0 }),
        object: _storage, len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = withUnsafeMutablePointer(
        to: &_context.pointee.auxSamples.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  @inlinable
  public var offFbo: UInt32 {
    get { _context.pointee.offFBO }
    set { _context.pointee.offFBO = newValue }
  }
  @inlinable
  public var offFBO_r: UInt32 {
    get { _context.pointee.offFBO_r }
    set { _context.pointee.offFBO_r = newValue }
  }
  @inlinable
  public var offColor: UInt32 {
    get { _context.pointee.offColor }
    set { _context.pointee.offColor = newValue }
  }
  @inlinable
  public var offColor_r: UInt32 {
    get { _context.pointee.offColor_r }
    set { _context.pointee.offColor_r = newValue }
  }
  @inlinable
  public var offDepthStencil: UInt32 {
    get { _context.pointee.offDepthStencil }
    set { _context.pointee.offDepthStencil = newValue }
  }
  @inlinable
  public var offDepthStencil_r: UInt32 {
    get { _context.pointee.offDepthStencil_r }
    set { _context.pointee.offDepthStencil_r = newValue }
  }
  @inlinable
  public var shadowFbo: UInt32 {
    get { _context.pointee.shadowFBO }
    set { _context.pointee.shadowFBO = newValue }
  }
  @inlinable
  public var shadowTex: UInt32 {
    get { _context.pointee.shadowTex }
    set { _context.pointee.shadowTex = newValue }
  }
  @inlinable
  public var auxFbo: MjArray<UInt32> {
    get {
      MjArray<UInt32>(
        array: withUnsafeMutablePointer(to: &_context.pointee.auxFBO.0, { $0 }), object: _storage,
        len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = withUnsafeMutablePointer(
        to: &_context.pointee.auxFBO.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  @inlinable
  public var auxFBO_r: MjArray<UInt32> {
    get {
      MjArray<UInt32>(
        array: withUnsafeMutablePointer(to: &_context.pointee.auxFBO_r.0, { $0 }), object: _storage,
        len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = withUnsafeMutablePointer(
        to: &_context.pointee.auxFBO_r.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  @inlinable
  public var auxColor: MjArray<UInt32> {
    get {
      MjArray<UInt32>(
        array: withUnsafeMutablePointer(to: &_context.pointee.auxColor.0, { $0 }), object: _storage,
        len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = withUnsafeMutablePointer(
        to: &_context.pointee.auxColor.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  @inlinable
  public var auxColor_r: MjArray<UInt32> {
    get {
      MjArray<UInt32>(
        array: withUnsafeMutablePointer(to: &_context.pointee.auxColor_r.0, { $0 }),
        object: _storage, len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = withUnsafeMutablePointer(
        to: &_context.pointee.auxColor_r.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  @inlinable
  public var ntexture: Int32 {
    get { _context.pointee.ntexture }
    set { _context.pointee.ntexture = newValue }
  }
  @inlinable
  public var textureType: MjArray<MjTexture> {
    get {
      MjArray<MjTexture>(
        array: UnsafeMutableRawPointer(
          withUnsafeMutablePointer(to: &_context.pointee.textureType.0, { $0 })
        ).assumingMemoryBound(to: MjTexture.self), object: _storage, len: ntexture)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjTexture> = UnsafeMutableRawPointer(
        withUnsafeMutablePointer(to: &_context.pointee.textureType.0, { $0 })
      ).assumingMemoryBound(to: MjTexture.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntexture))
    }
  }
  @inlinable
  public var texture: MjArray<UInt32> {
    get {
      MjArray<UInt32>(
        array: withUnsafeMutablePointer(to: &_context.pointee.texture.0, { $0 }), object: _storage,
        len: 100)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = withUnsafeMutablePointer(
        to: &_context.pointee.texture.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(100))
    }
  }
  @inlinable
  public var basePlane: UInt32 {
    get { _context.pointee.basePlane }
    set { _context.pointee.basePlane = newValue }
  }
  @inlinable
  public var baseMesh: UInt32 {
    get { _context.pointee.baseMesh }
    set { _context.pointee.baseMesh = newValue }
  }
  @inlinable
  public var baseHField: UInt32 {
    get { _context.pointee.baseHField }
    set { _context.pointee.baseHField = newValue }
  }
  @inlinable
  public var baseBuiltin: UInt32 {
    get { _context.pointee.baseBuiltin }
    set { _context.pointee.baseBuiltin = newValue }
  }
  @inlinable
  public var baseFontNormal: UInt32 {
    get { _context.pointee.baseFontNormal }
    set { _context.pointee.baseFontNormal = newValue }
  }
  @inlinable
  public var baseFontShadow: UInt32 {
    get { _context.pointee.baseFontShadow }
    set { _context.pointee.baseFontShadow = newValue }
  }
  @inlinable
  public var baseFontBig: UInt32 {
    get { _context.pointee.baseFontBig }
    set { _context.pointee.baseFontBig = newValue }
  }
  @inlinable
  public var rangePlane: Int32 {
    get { _context.pointee.rangePlane }
    set { _context.pointee.rangePlane = newValue }
  }
  @inlinable
  public var rangeMesh: Int32 {
    get { _context.pointee.rangeMesh }
    set { _context.pointee.rangeMesh = newValue }
  }
  @inlinable
  public var rangeHField: Int32 {
    get { _context.pointee.rangeHField }
    set { _context.pointee.rangeHField = newValue }
  }
  @inlinable
  public var rangeBuiltin: Int32 {
    get { _context.pointee.rangeBuiltin }
    set { _context.pointee.rangeBuiltin = newValue }
  }
  @inlinable
  public var rangeFont: Int32 {
    get { _context.pointee.rangeFont }
    set { _context.pointee.rangeFont = newValue }
  }
  @inlinable
  public var nskin: Int32 {
    get { _context.pointee.nskin }
    set { _context.pointee.nskin = newValue }
  }
  @inlinable
  public var skinvertVbo: MjArray<UInt32> {
    get { MjArray<UInt32>(array: _context.pointee.skinvertVBO, object: _storage, len: nskin) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = _context.pointee.skinvertVBO
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin))
    }
  }
  @inlinable
  public var skinnormalVbo: MjArray<UInt32> {
    get { MjArray<UInt32>(array: _context.pointee.skinnormalVBO, object: _storage, len: nskin) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = _context.pointee.skinnormalVBO
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin))
    }
  }
  @inlinable
  public var skintexcoordVbo: MjArray<UInt32> {
    get { MjArray<UInt32>(array: _context.pointee.skintexcoordVBO, object: _storage, len: nskin) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = _context.pointee.skintexcoordVBO
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin))
    }
  }
  @inlinable
  public var skinfaceVbo: MjArray<UInt32> {
    get { MjArray<UInt32>(array: _context.pointee.skinfaceVBO, object: _storage, len: nskin) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = _context.pointee.skinfaceVBO
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin))
    }
  }
  @inlinable
  public var charWidth: MjArray<Int32> {
    get {
      MjArray<Int32>(
        array: withUnsafeMutablePointer(to: &_context.pointee.charWidth.0, { $0 }),
        object: _storage, len: 127)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = withUnsafeMutablePointer(
        to: &_context.pointee.charWidth.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(127))
    }
  }
  @inlinable
  public var charWidthBig: MjArray<Int32> {
    get {
      MjArray<Int32>(
        array: withUnsafeMutablePointer(to: &_context.pointee.charWidthBig.0, { $0 }),
        object: _storage, len: 127)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = withUnsafeMutablePointer(
        to: &_context.pointee.charWidthBig.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(127))
    }
  }
  @inlinable
  public var charHeight: Int32 {
    get { _context.pointee.charHeight }
    set { _context.pointee.charHeight = newValue }
  }
  @inlinable
  public var charHeightBig: Int32 {
    get { _context.pointee.charHeightBig }
    set { _context.pointee.charHeightBig = newValue }
  }
  @inlinable
  public var glInitialized: Int32 {
    get { _context.pointee.glInitialized }
    set { _context.pointee.glInitialized = newValue }
  }
  @inlinable
  public var windowAvailable: Int32 {
    get { _context.pointee.windowAvailable }
    set { _context.pointee.windowAvailable = newValue }
  }
  @inlinable
  public var windowSamples: Int32 {
    get { _context.pointee.windowSamples }
    set { _context.pointee.windowSamples = newValue }
  }
  @inlinable
  public var windowStereo: Int32 {
    get { _context.pointee.windowStereo }
    set { _context.pointee.windowStereo = newValue }
  }
  @inlinable
  public var windowDoublebuffer: Int32 {
    get { _context.pointee.windowDoublebuffer }
    set { _context.pointee.windowDoublebuffer = newValue }
  }
  @inlinable
  public var currentBuffer: Int32 {
    get { _context.pointee.currentBuffer }
    set { _context.pointee.currentBuffer = newValue }
  }
}
