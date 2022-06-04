import C_mujoco

/// table passed to mjui_add()
///
/// This structure defines one entry in the definition table used for simplified UI construction.
public struct MjuiDef {
  @usableFromInline
  var _def: mjuiDef_
  init() {
    _def = mjuiDef_()
  }
  public init(
    _ type: MjtItem, name: String, state: Int32, pdata: UnsafeMutableRawPointer?, other: String
  ) {
    self.init()
    self.type = type
    self.name = name
    self.state = state
    self.pdata = pdata
    self.other = other
  }
}

extension MjuiDef {
  /// pointer to data
  @inlinable
  public var pdata: UnsafeMutableRawPointer? {
    get { _def.pdata }
    set { _def.pdata = newValue }
  }
}
