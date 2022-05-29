extension MjvGeom {
  @inlinable
  public var type: MjtGeom {
    get { MjtGeom(rawValue: _geom.type)! }
    set { _geom.type = newValue.rawValue }
  }
  @inlinable
  public var dataid: Int32 {
    get { _geom.dataid }
    set { _geom.dataid = newValue }
  }
  @inlinable
  public var objtype: Int32 {
    get { _geom.objtype }
    set { _geom.objtype = newValue }
  }
  @inlinable
  public var objid: Int32 {
    get { _geom.objid }
    set { _geom.objid = newValue }
  }
  @inlinable
  public var category: Int32 {
    get { _geom.category }
    set { _geom.category = newValue }
  }
  @inlinable
  public var texid: Int32 {
    get { _geom.texid }
    set { _geom.texid = newValue }
  }
  @inlinable
  public var texuniform: Int32 {
    get { _geom.texuniform }
    set { _geom.texuniform = newValue }
  }
  @inlinable
  public var texcoord: Int32 {
    get { _geom.texcoord }
    set { _geom.texcoord = newValue }
  }
  @inlinable
  public var segid: Int32 {
    get { _geom.segid }
    set { _geom.segid = newValue }
  }
  @inlinable
  public var texrepeat: (Float, Float) {
    get { _geom.texrepeat }
    set { _geom.texrepeat = newValue }
  }
  @inlinable
  public var size: (Float, Float, Float) {
    get { _geom.size }
    set { _geom.size = newValue }
  }
  @inlinable
  public var pos: (Float, Float, Float) {
    get { _geom.pos }
    set { _geom.pos = newValue }
  }
  @inlinable
  public var mat: (Float, Float, Float, Float, Float, Float, Float, Float, Float) {
    get { _geom.mat }
    set { _geom.mat = newValue }
  }
  @inlinable
  public var rgba: (Float, Float, Float, Float) {
    get { _geom.rgba }
    set { _geom.rgba = newValue }
  }
  @inlinable
  public var emission: Float {
    get { _geom.emission }
    set { _geom.emission = newValue }
  }
  @inlinable
  public var specular: Float {
    get { _geom.specular }
    set { _geom.specular = newValue }
  }
  @inlinable
  public var shininess: Float {
    get { _geom.shininess }
    set { _geom.shininess = newValue }
  }
  @inlinable
  public var reflectance: Float {
    get { _geom.reflectance }
    set { _geom.reflectance = newValue }
  }
  @inlinable
  public var label: String {
    get {
      var value = _geom.label
      return withUnsafePointer(to: &value.0) { String(cString: $0, encoding: .utf8)! }
    }
    set {
      var value = newValue
      value.withUTF8 { utf8 in
        precondition(utf8.count < 100)
        withUnsafeMutablePointer(to: &_geom.label.0) { pos in
          utf8.baseAddress?.withMemoryRebound(to: CChar.self, capacity: utf8.count) {
            pos.assign(from: $0, count: utf8.count)
          }
          pos[utf8.count] = 0
        }
      }
    }
  }
  @inlinable
  public var camdist: Float {
    get { _geom.camdist }
    set { _geom.camdist = newValue }
  }
  @inlinable
  public var modelrbound: Float {
    get { _geom.modelrbound }
    set { _geom.modelrbound = newValue }
  }
  @inlinable
  public var transparent: UInt8 {
    get { _geom.transparent }
    set { _geom.transparent = newValue }
  }
}
