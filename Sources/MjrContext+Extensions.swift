extension MjrContext {
  @inlinable
  public var lineWidth: Float {
    get { _context.lineWidth }
    set { _context.lineWidth = newValue }
  }
  @inlinable
  public var shadowClip: Float {
    get { _context.shadowClip }
    set { _context.shadowClip = newValue }
  }
  @inlinable
  public var shadowScale: Float {
    get { _context.shadowScale }
    set { _context.shadowScale = newValue }
  }
  @inlinable
  public var fogStart: Float {
    get { _context.fogStart }
    set { _context.fogStart = newValue }
  }
  @inlinable
  public var fogEnd: Float {
    get { _context.fogEnd }
    set { _context.fogEnd = newValue }
  }
  @inlinable
  public var fogRgba: (Float, Float, Float, Float) {
    get { _context.fogRGBA }
    set { _context.fogRGBA = newValue }
  }
  @inlinable
  public var shadowSize: Int32 {
    get { _context.shadowSize }
    set { _context.shadowSize = newValue }
  }
  @inlinable
  public var offWidth: Int32 {
    get { _context.offWidth }
    set { _context.offWidth = newValue }
  }
  @inlinable
  public var offHeight: Int32 {
    get { _context.offHeight }
    set { _context.offHeight = newValue }
  }
  @inlinable
  public var offSamples: Int32 {
    get { _context.offSamples }
    set { _context.offSamples = newValue }
  }
  @inlinable
  public var fontScale: Int32 {
    get { _context.fontScale }
    set { _context.fontScale = newValue }
  }
  @inlinable
  public var auxWidth: MjArray<Int32> {
    get {
      MjArray<Int32>(
        array: withUnsafeMutablePointer(to: &_context.auxWidth.0, { $0 }), object: self, len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = withUnsafeMutablePointer(
        to: &_context.auxWidth.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  @inlinable
  public var auxHeight: MjArray<Int32> {
    get {
      MjArray<Int32>(
        array: withUnsafeMutablePointer(to: &_context.auxHeight.0, { $0 }), object: self, len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = withUnsafeMutablePointer(
        to: &_context.auxHeight.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  @inlinable
  public var auxSamples: MjArray<Int32> {
    get {
      MjArray<Int32>(
        array: withUnsafeMutablePointer(to: &_context.auxSamples.0, { $0 }), object: self, len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = withUnsafeMutablePointer(
        to: &_context.auxSamples.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  @inlinable
  public var offFbo: UInt32 {
    get { _context.offFBO }
    set { _context.offFBO = newValue }
  }
  @inlinable
  public var offFBO_r: UInt32 {
    get { _context.offFBO_r }
    set { _context.offFBO_r = newValue }
  }
  @inlinable
  public var offColor: UInt32 {
    get { _context.offColor }
    set { _context.offColor = newValue }
  }
  @inlinable
  public var offColor_r: UInt32 {
    get { _context.offColor_r }
    set { _context.offColor_r = newValue }
  }
  @inlinable
  public var offDepthStencil: UInt32 {
    get { _context.offDepthStencil }
    set { _context.offDepthStencil = newValue }
  }
  @inlinable
  public var offDepthStencil_r: UInt32 {
    get { _context.offDepthStencil_r }
    set { _context.offDepthStencil_r = newValue }
  }
  @inlinable
  public var shadowFbo: UInt32 {
    get { _context.shadowFBO }
    set { _context.shadowFBO = newValue }
  }
  @inlinable
  public var shadowTex: UInt32 {
    get { _context.shadowTex }
    set { _context.shadowTex = newValue }
  }
  @inlinable
  public var auxFbo: MjArray<UInt32> {
    get {
      MjArray<UInt32>(
        array: withUnsafeMutablePointer(to: &_context.auxFBO.0, { $0 }), object: self, len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = withUnsafeMutablePointer(
        to: &_context.auxFBO.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  @inlinable
  public var auxFBO_r: MjArray<UInt32> {
    get {
      MjArray<UInt32>(
        array: withUnsafeMutablePointer(to: &_context.auxFBO_r.0, { $0 }), object: self, len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = withUnsafeMutablePointer(
        to: &_context.auxFBO_r.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  @inlinable
  public var auxColor: MjArray<UInt32> {
    get {
      MjArray<UInt32>(
        array: withUnsafeMutablePointer(to: &_context.auxColor.0, { $0 }), object: self, len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = withUnsafeMutablePointer(
        to: &_context.auxColor.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  @inlinable
  public var auxColor_r: MjArray<UInt32> {
    get {
      MjArray<UInt32>(
        array: withUnsafeMutablePointer(to: &_context.auxColor_r.0, { $0 }), object: self, len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = withUnsafeMutablePointer(
        to: &_context.auxColor_r.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  @inlinable
  public var ntexture: Int32 {
    get { _context.ntexture }
    set { _context.ntexture = newValue }
  }
  @inlinable
  public var textureType: MjArray<MjTexture> {
    get {
      MjArray<MjTexture>(
        array: UnsafeMutableRawPointer(
          withUnsafeMutablePointer(to: &_context.textureType.0, { $0 })
        ).assumingMemoryBound(to: MjTexture.self), object: self, len: ntexture)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjTexture> = UnsafeMutableRawPointer(
        withUnsafeMutablePointer(to: &_context.textureType.0, { $0 })
      ).assumingMemoryBound(to: MjTexture.self)
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntexture))
    }
  }
  @inlinable
  public var texture: MjArray<UInt32> {
    get {
      MjArray<UInt32>(
        array: withUnsafeMutablePointer(to: &_context.texture.0, { $0 }), object: self, len: 100)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = withUnsafeMutablePointer(
        to: &_context.texture.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(100))
    }
  }
  @inlinable
  public var basePlane: UInt32 {
    get { _context.basePlane }
    set { _context.basePlane = newValue }
  }
  @inlinable
  public var baseMesh: UInt32 {
    get { _context.baseMesh }
    set { _context.baseMesh = newValue }
  }
  @inlinable
  public var baseHField: UInt32 {
    get { _context.baseHField }
    set { _context.baseHField = newValue }
  }
  @inlinable
  public var baseBuiltin: UInt32 {
    get { _context.baseBuiltin }
    set { _context.baseBuiltin = newValue }
  }
  @inlinable
  public var baseFontNormal: UInt32 {
    get { _context.baseFontNormal }
    set { _context.baseFontNormal = newValue }
  }
  @inlinable
  public var baseFontShadow: UInt32 {
    get { _context.baseFontShadow }
    set { _context.baseFontShadow = newValue }
  }
  @inlinable
  public var baseFontBig: UInt32 {
    get { _context.baseFontBig }
    set { _context.baseFontBig = newValue }
  }
  @inlinable
  public var rangePlane: Int32 {
    get { _context.rangePlane }
    set { _context.rangePlane = newValue }
  }
  @inlinable
  public var rangeMesh: Int32 {
    get { _context.rangeMesh }
    set { _context.rangeMesh = newValue }
  }
  @inlinable
  public var rangeHField: Int32 {
    get { _context.rangeHField }
    set { _context.rangeHField = newValue }
  }
  @inlinable
  public var rangeBuiltin: Int32 {
    get { _context.rangeBuiltin }
    set { _context.rangeBuiltin = newValue }
  }
  @inlinable
  public var rangeFont: Int32 {
    get { _context.rangeFont }
    set { _context.rangeFont = newValue }
  }
  @inlinable
  public var nskin: Int32 {
    get { _context.nskin }
    set { _context.nskin = newValue }
  }
  @inlinable
  public var skinvertVbo: MjArray<UInt32> {
    get { MjArray<UInt32>(array: _context.skinvertVBO, object: self, len: nskin) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = _context.skinvertVBO
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin))
    }
  }
  @inlinable
  public var skinnormalVbo: MjArray<UInt32> {
    get { MjArray<UInt32>(array: _context.skinnormalVBO, object: self, len: nskin) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = _context.skinnormalVBO
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin))
    }
  }
  @inlinable
  public var skintexcoordVbo: MjArray<UInt32> {
    get { MjArray<UInt32>(array: _context.skintexcoordVBO, object: self, len: nskin) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = _context.skintexcoordVBO
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin))
    }
  }
  @inlinable
  public var skinfaceVbo: MjArray<UInt32> {
    get { MjArray<UInt32>(array: _context.skinfaceVBO, object: self, len: nskin) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = _context.skinfaceVBO
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin))
    }
  }
  @inlinable
  public var charWidth: MjArray<Int32> {
    get {
      MjArray<Int32>(
        array: withUnsafeMutablePointer(to: &_context.charWidth.0, { $0 }), object: self, len: 127)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = withUnsafeMutablePointer(
        to: &_context.charWidth.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(127))
    }
  }
  @inlinable
  public var charWidthBig: MjArray<Int32> {
    get {
      MjArray<Int32>(
        array: withUnsafeMutablePointer(to: &_context.charWidthBig.0, { $0 }), object: self,
        len: 127)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = withUnsafeMutablePointer(
        to: &_context.charWidthBig.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(127))
    }
  }
  @inlinable
  public var charHeight: Int32 {
    get { _context.charHeight }
    set { _context.charHeight = newValue }
  }
  @inlinable
  public var charHeightBig: Int32 {
    get { _context.charHeightBig }
    set { _context.charHeightBig = newValue }
  }
  @inlinable
  public var glInitialized: Int32 {
    get { _context.glInitialized }
    set { _context.glInitialized = newValue }
  }
  @inlinable
  public var windowAvailable: Int32 {
    get { _context.windowAvailable }
    set { _context.windowAvailable = newValue }
  }
  @inlinable
  public var windowSamples: Int32 {
    get { _context.windowSamples }
    set { _context.windowSamples = newValue }
  }
  @inlinable
  public var windowStereo: Int32 {
    get { _context.windowStereo }
    set { _context.windowStereo = newValue }
  }
  @inlinable
  public var windowDoublebuffer: Int32 {
    get { _context.windowDoublebuffer }
    set { _context.windowDoublebuffer = newValue }
  }
  @inlinable
  public var currentBuffer: Int32 {
    get { _context.currentBuffer }
    set { _context.currentBuffer = newValue }
  }
}
