extension MjrContext {
  /// line width for wireframe rendering
  @inlinable
  public var lineWidth: Float {
    get { _context.pointee.lineWidth }
    set { _context.pointee.lineWidth = newValue }
  }
  /// clipping radius for directional lights
  @inlinable
  public var shadowClip: Float {
    get { _context.pointee.shadowClip }
    set { _context.pointee.shadowClip = newValue }
  }
  /// fraction of light cutoff for spot lights
  @inlinable
  public var shadowScale: Float {
    get { _context.pointee.shadowScale }
    set { _context.pointee.shadowScale = newValue }
  }
  /// fog start = stat.extent * vis.map.fogstart
  @inlinable
  public var fogStart: Float {
    get { _context.pointee.fogStart }
    set { _context.pointee.fogStart = newValue }
  }
  /// fog end = stat.extent * vis.map.fogend
  @inlinable
  public var fogEnd: Float {
    get { _context.pointee.fogEnd }
    set { _context.pointee.fogEnd = newValue }
  }
  /// fog rgba
  @inlinable
  public var fogRgba: (Float, Float, Float, Float) {
    get { _context.pointee.fogRGBA }
    set { _context.pointee.fogRGBA = newValue }
  }
  /// size of shadow map texture
  @inlinable
  public var shadowSize: Int32 {
    get { _context.pointee.shadowSize }
    set { _context.pointee.shadowSize = newValue }
  }
  /// width of offscreen buffer
  @inlinable
  public var offWidth: Int32 {
    get { _context.pointee.offWidth }
    set { _context.pointee.offWidth = newValue }
  }
  /// height of offscreen buffer
  @inlinable
  public var offHeight: Int32 {
    get { _context.pointee.offHeight }
    set { _context.pointee.offHeight = newValue }
  }
  /// number of offscreen buffer multisamples
  @inlinable
  public var offSamples: Int32 {
    get { _context.pointee.offSamples }
    set { _context.pointee.offSamples = newValue }
  }
  /// font scale
  @inlinable
  public var fontScale: Int32 {
    get { _context.pointee.fontScale }
    set { _context.pointee.fontScale = newValue }
  }
  /// auxiliary buffer width
  @inlinable
  public var auxWidth: MjArray<Int32> {
    get {
      MjArray<Int32>(
        array: withUnsafeMutablePointer(
          to: &_context.pointee.auxWidth,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: Int32.self) }), object: _storage,
        len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = withUnsafeMutablePointer(
        to: &_context.pointee.auxWidth,
        { UnsafeMutableRawPointer($0).assumingMemoryBound(to: Int32.self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  /// auxiliary buffer height
  @inlinable
  public var auxHeight: MjArray<Int32> {
    get {
      MjArray<Int32>(
        array: withUnsafeMutablePointer(
          to: &_context.pointee.auxHeight,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: Int32.self) }), object: _storage,
        len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = withUnsafeMutablePointer(
        to: &_context.pointee.auxHeight,
        { UnsafeMutableRawPointer($0).assumingMemoryBound(to: Int32.self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  /// auxiliary buffer multisamples
  @inlinable
  public var auxSamples: MjArray<Int32> {
    get {
      MjArray<Int32>(
        array: withUnsafeMutablePointer(
          to: &_context.pointee.auxSamples,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: Int32.self) }), object: _storage,
        len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = withUnsafeMutablePointer(
        to: &_context.pointee.auxSamples,
        { UnsafeMutableRawPointer($0).assumingMemoryBound(to: Int32.self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  /// offscreen framebuffer object
  @inlinable
  public var offFbo: UInt32 {
    get { _context.pointee.offFBO }
    set { _context.pointee.offFBO = newValue }
  }
  /// offscreen framebuffer for resolving multisamples
  @inlinable
  public var offFBO_r: UInt32 {
    get { _context.pointee.offFBO_r }
    set { _context.pointee.offFBO_r = newValue }
  }
  /// offscreen color buffer
  @inlinable
  public var offColor: UInt32 {
    get { _context.pointee.offColor }
    set { _context.pointee.offColor = newValue }
  }
  /// offscreen color buffer for resolving multisamples
  @inlinable
  public var offColor_r: UInt32 {
    get { _context.pointee.offColor_r }
    set { _context.pointee.offColor_r = newValue }
  }
  /// offscreen depth and stencil buffer
  @inlinable
  public var offDepthStencil: UInt32 {
    get { _context.pointee.offDepthStencil }
    set { _context.pointee.offDepthStencil = newValue }
  }
  /// offscreen depth and stencil buffer for resolving multisamples
  @inlinable
  public var offDepthStencil_r: UInt32 {
    get { _context.pointee.offDepthStencil_r }
    set { _context.pointee.offDepthStencil_r = newValue }
  }
  /// shadow map framebuffer object
  @inlinable
  public var shadowFbo: UInt32 {
    get { _context.pointee.shadowFBO }
    set { _context.pointee.shadowFBO = newValue }
  }
  /// shadow map texture
  @inlinable
  public var shadowTex: UInt32 {
    get { _context.pointee.shadowTex }
    set { _context.pointee.shadowTex = newValue }
  }
  /// auxiliary framebuffer object
  @inlinable
  public var auxFbo: MjArray<UInt32> {
    get {
      MjArray<UInt32>(
        array: withUnsafeMutablePointer(
          to: &_context.pointee.auxFBO,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: UInt32.self) }), object: _storage,
        len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = withUnsafeMutablePointer(
        to: &_context.pointee.auxFBO,
        { UnsafeMutableRawPointer($0).assumingMemoryBound(to: UInt32.self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  /// auxiliary framebuffer object for resolving
  @inlinable
  public var auxFBO_r: MjArray<UInt32> {
    get {
      MjArray<UInt32>(
        array: withUnsafeMutablePointer(
          to: &_context.pointee.auxFBO_r,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: UInt32.self) }), object: _storage,
        len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = withUnsafeMutablePointer(
        to: &_context.pointee.auxFBO_r,
        { UnsafeMutableRawPointer($0).assumingMemoryBound(to: UInt32.self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  /// auxiliary color buffer
  @inlinable
  public var auxColor: MjArray<UInt32> {
    get {
      MjArray<UInt32>(
        array: withUnsafeMutablePointer(
          to: &_context.pointee.auxColor,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: UInt32.self) }), object: _storage,
        len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = withUnsafeMutablePointer(
        to: &_context.pointee.auxColor,
        { UnsafeMutableRawPointer($0).assumingMemoryBound(to: UInt32.self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  /// auxiliary color buffer for resolving
  @inlinable
  public var auxColor_r: MjArray<UInt32> {
    get {
      MjArray<UInt32>(
        array: withUnsafeMutablePointer(
          to: &_context.pointee.auxColor_r,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: UInt32.self) }), object: _storage,
        len: 10)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = withUnsafeMutablePointer(
        to: &_context.pointee.auxColor_r,
        { UnsafeMutableRawPointer($0).assumingMemoryBound(to: UInt32.self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(10))
    }
  }
  /// number of allocated textures
  @inlinable
  public var ntexture: Int32 {
    get { _context.pointee.ntexture }
    set { _context.pointee.ntexture = newValue }
  }
  /// type of texture (mjtTexture) (ntexture)
  @inlinable
  public var textureType: MjArray<MjtTexture> {
    get {
      MjArray<MjtTexture>(
        array: withUnsafeMutablePointer(
          to: &_context.pointee.textureType,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: MjtTexture.self) }),
        object: _storage, len: ntexture)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<MjtTexture> = withUnsafeMutablePointer(
        to: &_context.pointee.textureType,
        { UnsafeMutableRawPointer($0).assumingMemoryBound(to: MjtTexture.self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(ntexture))
    }
  }
  /// texture names
  @inlinable
  public var texture: MjArray<UInt32> {
    get {
      MjArray<UInt32>(
        array: withUnsafeMutablePointer(
          to: &_context.pointee.texture,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: UInt32.self) }), object: _storage,
        len: 100)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = withUnsafeMutablePointer(
        to: &_context.pointee.texture,
        { UnsafeMutableRawPointer($0).assumingMemoryBound(to: UInt32.self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(100))
    }
  }
  /// all planes from model
  @inlinable
  public var basePlane: UInt32 {
    get { _context.pointee.basePlane }
    set { _context.pointee.basePlane = newValue }
  }
  /// all meshes from model
  @inlinable
  public var baseMesh: UInt32 {
    get { _context.pointee.baseMesh }
    set { _context.pointee.baseMesh = newValue }
  }
  /// all hfields from model
  @inlinable
  public var baseHField: UInt32 {
    get { _context.pointee.baseHField }
    set { _context.pointee.baseHField = newValue }
  }
  /// all buildin geoms, with quality from model
  @inlinable
  public var baseBuiltin: UInt32 {
    get { _context.pointee.baseBuiltin }
    set { _context.pointee.baseBuiltin = newValue }
  }
  /// normal font
  @inlinable
  public var baseFontNormal: UInt32 {
    get { _context.pointee.baseFontNormal }
    set { _context.pointee.baseFontNormal = newValue }
  }
  /// shadow font
  @inlinable
  public var baseFontShadow: UInt32 {
    get { _context.pointee.baseFontShadow }
    set { _context.pointee.baseFontShadow = newValue }
  }
  /// big font
  @inlinable
  public var baseFontBig: UInt32 {
    get { _context.pointee.baseFontBig }
    set { _context.pointee.baseFontBig = newValue }
  }
  /// all planes from model
  @inlinable
  public var rangePlane: Int32 {
    get { _context.pointee.rangePlane }
    set { _context.pointee.rangePlane = newValue }
  }
  /// all meshes from model
  @inlinable
  public var rangeMesh: Int32 {
    get { _context.pointee.rangeMesh }
    set { _context.pointee.rangeMesh = newValue }
  }
  /// all hfields from model
  @inlinable
  public var rangeHField: Int32 {
    get { _context.pointee.rangeHField }
    set { _context.pointee.rangeHField = newValue }
  }
  /// all builtin geoms, with quality from model
  @inlinable
  public var rangeBuiltin: Int32 {
    get { _context.pointee.rangeBuiltin }
    set { _context.pointee.rangeBuiltin = newValue }
  }
  /// all characters in font
  @inlinable
  public var rangeFont: Int32 {
    get { _context.pointee.rangeFont }
    set { _context.pointee.rangeFont = newValue }
  }
  /// number of skins
  @inlinable
  public var nskin: Int32 {
    get { _context.pointee.nskin }
    set { _context.pointee.nskin = newValue }
  }
  /// skin vertex position VBOs (nskin)
  @inlinable
  public var skinvertVbo: MjArray<UInt32> {
    get { MjArray<UInt32>(array: _context.pointee.skinvertVBO, object: _storage, len: nskin) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = _context.pointee.skinvertVBO
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin))
    }
  }
  /// skin vertex normal VBOs (nskin)
  @inlinable
  public var skinnormalVbo: MjArray<UInt32> {
    get { MjArray<UInt32>(array: _context.pointee.skinnormalVBO, object: _storage, len: nskin) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = _context.pointee.skinnormalVBO
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin))
    }
  }
  /// skin vertex texture coordinate VBOs (nskin)
  @inlinable
  public var skintexcoordVbo: MjArray<UInt32> {
    get { MjArray<UInt32>(array: _context.pointee.skintexcoordVBO, object: _storage, len: nskin) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = _context.pointee.skintexcoordVBO
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin))
    }
  }
  /// skin face index VBOs (nskin)
  @inlinable
  public var skinfaceVbo: MjArray<UInt32> {
    get { MjArray<UInt32>(array: _context.pointee.skinfaceVBO, object: _storage, len: nskin) }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<UInt32> = _context.pointee.skinfaceVBO
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(nskin))
    }
  }
  /// character widths: normal and shadow
  @inlinable
  public var charWidth: MjArray<Int32> {
    get {
      MjArray<Int32>(
        array: withUnsafeMutablePointer(
          to: &_context.pointee.charWidth,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: Int32.self) }), object: _storage,
        len: 127)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = withUnsafeMutablePointer(
        to: &_context.pointee.charWidth,
        { UnsafeMutableRawPointer($0).assumingMemoryBound(to: Int32.self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(127))
    }
  }
  /// chacarter widths: big
  @inlinable
  public var charWidthBig: MjArray<Int32> {
    get {
      MjArray<Int32>(
        array: withUnsafeMutablePointer(
          to: &_context.pointee.charWidthBig,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: Int32.self) }), object: _storage,
        len: 127)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = withUnsafeMutablePointer(
        to: &_context.pointee.charWidthBig,
        { UnsafeMutableRawPointer($0).assumingMemoryBound(to: Int32.self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(127))
    }
  }
  /// character heights: normal and shadow
  @inlinable
  public var charHeight: Int32 {
    get { _context.pointee.charHeight }
    set { _context.pointee.charHeight = newValue }
  }
  /// character heights: big
  @inlinable
  public var charHeightBig: Int32 {
    get { _context.pointee.charHeightBig }
    set { _context.pointee.charHeightBig = newValue }
  }
  /// is OpenGL initialized
  @inlinable
  public var glInitialized: Int32 {
    get { _context.pointee.glInitialized }
    set { _context.pointee.glInitialized = newValue }
  }
  /// is default/window framebuffer available
  @inlinable
  public var windowAvailable: Int32 {
    get { _context.pointee.windowAvailable }
    set { _context.pointee.windowAvailable = newValue }
  }
  /// number of samples for default/window framebuffer
  @inlinable
  public var windowSamples: Int32 {
    get { _context.pointee.windowSamples }
    set { _context.pointee.windowSamples = newValue }
  }
  /// is stereo available for default/window framebuffer
  @inlinable
  public var windowStereo: Int32 {
    get { _context.pointee.windowStereo }
    set { _context.pointee.windowStereo = newValue }
  }
  /// is default/window framebuffer double buffered
  @inlinable
  public var windowDoublebuffer: Int32 {
    get { _context.pointee.windowDoublebuffer }
    set { _context.pointee.windowDoublebuffer = newValue }
  }
  /// currently active framebuffer: mjFB_WINDOW or mjFB_OFFSCREEN
  @inlinable
  public var currentBuffer: Int32 {
    get { _context.pointee.currentBuffer }
    set { _context.pointee.currentBuffer = newValue }
  }
}
extension MjrContext: CustomReflectable {
  public var customMirror: Mirror {
    Mirror(
      self,
      children: [
        "lineWidth": lineWidth, "shadowClip": shadowClip, "shadowScale": shadowScale,
        "fogStart": fogStart, "fogEnd": fogEnd, "fogRgba": fogRgba, "shadowSize": shadowSize,
        "offWidth": offWidth, "offHeight": offHeight, "offSamples": offSamples,
        "fontScale": fontScale, "auxWidth": auxWidth, "auxHeight": auxHeight,
        "auxSamples": auxSamples, "offFbo": offFbo, "offFBO_r": offFBO_r, "offColor": offColor,
        "offColor_r": offColor_r, "offDepthStencil": offDepthStencil,
        "offDepthStencil_r": offDepthStencil_r, "shadowFbo": shadowFbo, "shadowTex": shadowTex,
        "auxFbo": auxFbo, "auxFBO_r": auxFBO_r, "auxColor": auxColor, "auxColor_r": auxColor_r,
        "ntexture": ntexture, "textureType": textureType, "texture": texture,
        "basePlane": basePlane, "baseMesh": baseMesh, "baseHField": baseHField,
        "baseBuiltin": baseBuiltin, "baseFontNormal": baseFontNormal,
        "baseFontShadow": baseFontShadow, "baseFontBig": baseFontBig, "rangePlane": rangePlane,
        "rangeMesh": rangeMesh, "rangeHField": rangeHField, "rangeBuiltin": rangeBuiltin,
        "rangeFont": rangeFont, "nskin": nskin, "skinvertVbo": skinvertVbo,
        "skinnormalVbo": skinnormalVbo, "skintexcoordVbo": skintexcoordVbo,
        "skinfaceVbo": skinfaceVbo, "charWidth": charWidth, "charWidthBig": charWidthBig,
        "charHeight": charHeight, "charHeightBig": charHeightBig, "glInitialized": glInitialized,
        "windowAvailable": windowAvailable, "windowSamples": windowSamples,
        "windowStereo": windowStereo, "windowDoublebuffer": windowDoublebuffer,
        "currentBuffer": currentBuffer,
      ])
  }
}
