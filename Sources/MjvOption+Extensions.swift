extension MjvOption {
  /// what objects to label (mjtLabel)
  @inlinable
  public var label: MjtLabel {
    get { MjtLabel(rawValue: _option.label)! }
    set { _option.label = newValue.rawValue }
  }
  /// which frame to show (mjtFrame)
  @inlinable
  public var frame: MjtFrame {
    get { MjtFrame(rawValue: _option.frame)! }
    set { _option.frame = newValue.rawValue }
  }
  /// geom visualization by group
  @inlinable
  public var geomgroup: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8) {
    get { _option.geomgroup }
    set { _option.geomgroup = newValue }
  }
  /// site visualization by group
  @inlinable
  public var sitegroup: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8) {
    get { _option.sitegroup }
    set { _option.sitegroup = newValue }
  }
  /// joint visualization by group
  @inlinable
  public var jointgroup: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8) {
    get { _option.jointgroup }
    set { _option.jointgroup = newValue }
  }
  /// tendon visualization by group
  @inlinable
  public var tendongroup: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8) {
    get { _option.tendongroup }
    set { _option.tendongroup = newValue }
  }
  /// actuator visualization by group
  @inlinable
  public var actuatorgroup: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8) {
    get { _option.actuatorgroup }
    set { _option.actuatorgroup = newValue }
  }
  /// visualization flags (indexed by mjtVisFlag)
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
