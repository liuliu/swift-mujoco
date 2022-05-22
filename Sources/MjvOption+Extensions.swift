extension MjvOption {
  @inlinable
  public var label: MjLabel {
    get { MjLabel(rawValue: _option.label)! }
    set { _option.label = newValue.rawValue }
  }
  @inlinable
  public var frame: MjFrame {
    get { MjFrame(rawValue: _option.frame)! }
    set { _option.frame = newValue.rawValue }
  }
  @inlinable
  public var geomgroup: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8) {
    get { _option.geomgroup }
    set { _option.geomgroup = newValue }
  }
  @inlinable
  public var sitegroup: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8) {
    get { _option.sitegroup }
    set { _option.sitegroup = newValue }
  }
  @inlinable
  public var jointgroup: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8) {
    get { _option.jointgroup }
    set { _option.jointgroup = newValue }
  }
  @inlinable
  public var tendongroup: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8) {
    get { _option.tendongroup }
    set { _option.tendongroup = newValue }
  }
  @inlinable
  public var actuatorgroup: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8) {
    get { _option.actuatorgroup }
    set { _option.actuatorgroup = newValue }
  }
  @inlinable
  public var flags:
    (
      UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8,
      UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8
    )
  {
    get { _option.flags }
    set { _option.flags = newValue }
  }
}
