extension MjvGeom {
  /// geom type (mjtGeom)
  @inlinable
  public var type: MjtGeom {
    get { MjtGeom(rawValue: _geom.type)! }
    set { _geom.type = newValue.rawValue }
  }
  /// mesh, hfield or plane id; -1: none
  @inlinable
  public var dataid: Int32 {
    get { _geom.dataid }
    set { _geom.dataid = newValue }
  }
  /// mujoco object type; mjOBJ_UNKNOWN for decor
  @inlinable
  public var objtype: Int32 {
    get { _geom.objtype }
    set { _geom.objtype = newValue }
  }
  /// mujoco object id; -1 for decor
  @inlinable
  public var objid: Int32 {
    get { _geom.objid }
    set { _geom.objid = newValue }
  }
  /// visual category
  @inlinable
  public var category: Int32 {
    get { _geom.category }
    set { _geom.category = newValue }
  }
  /// texture id; -1: no texture
  @inlinable
  public var texid: Int32 {
    get { _geom.texid }
    set { _geom.texid = newValue }
  }
  /// uniform cube mapping
  @inlinable
  public var texuniform: Int32 {
    get { _geom.texuniform }
    set { _geom.texuniform = newValue }
  }
  /// mesh geom has texture coordinates
  @inlinable
  public var texcoord: Int32 {
    get { _geom.texcoord }
    set { _geom.texcoord = newValue }
  }
  /// segmentation id; -1: not shown
  @inlinable
  public var segid: Int32 {
    get { _geom.segid }
    set { _geom.segid = newValue }
  }
  /// texture repetition for 2D mapping
  @inlinable
  public var texrepeat: (Float, Float) {
    get { _geom.texrepeat }
    set { _geom.texrepeat = newValue }
  }
  /// size parameters
  @inlinable
  public var size: (Float, Float, Float) {
    get { _geom.size }
    set { _geom.size = newValue }
  }
  /// Cartesian position
  @inlinable
  public var pos: (Float, Float, Float) {
    get { _geom.pos }
    set { _geom.pos = newValue }
  }
  /// Cartesian orientation
  @inlinable
  public var mat: (Float, Float, Float, Float, Float, Float, Float, Float, Float) {
    get { _geom.mat }
    set { _geom.mat = newValue }
  }
  /// color and transparency
  @inlinable
  public var rgba: (Float, Float, Float, Float) {
    get { _geom.rgba }
    set { _geom.rgba = newValue }
  }
  /// emission coef
  @inlinable
  public var emission: Float {
    get { _geom.emission }
    set { _geom.emission = newValue }
  }
  /// specular coef
  @inlinable
  public var specular: Float {
    get { _geom.specular }
    set { _geom.specular = newValue }
  }
  /// shininess coef
  @inlinable
  public var shininess: Float {
    get { _geom.shininess }
    set { _geom.shininess = newValue }
  }
  /// reflectance coef
  @inlinable
  public var reflectance: Float {
    get { _geom.reflectance }
    set { _geom.reflectance = newValue }
  }
  /// text label
  @inlinable
  public var label: String {
    get {
      var value = _geom.label
      return withUnsafePointer(to: &value.0) { String(cString: $0, encoding: .utf8)! }
    }
    set {
      var value = newValue
      value.withUTF8 { utf8 in
        let count = min(utf8.count, 99)
        withUnsafeMutablePointer(to: &_geom.label.0) { pos in
          utf8.baseAddress?.withMemoryRebound(to: CChar.self, capacity: count) {
            pos.assign(from: $0, count: count)
          }
          pos[count] = 0
        }
      }
    }
  }
  /// distance to camera (used by sorter)
  @inlinable
  public var camdist: Float {
    get { _geom.camdist }
    set { _geom.camdist = newValue }
  }
  /// geom rbound from model, 0 if not model geom
  @inlinable
  public var modelrbound: Float {
    get { _geom.modelrbound }
    set { _geom.modelrbound = newValue }
  }
  /// treat geom as transparent
  @inlinable
  public var transparent: UInt8 {
    get { _geom.transparent }
    set { _geom.transparent = newValue }
  }
}
