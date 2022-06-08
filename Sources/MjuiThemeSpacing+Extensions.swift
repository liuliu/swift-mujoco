extension MjuiThemeSpacing {
  /// total width
  @inlinable
  public var total: Int32 {
    get { _themespacing.total }
    set { _themespacing.total = newValue }
  }
  /// scrollbar width
  @inlinable
  public var scroll: Int32 {
    get { _themespacing.scroll }
    set { _themespacing.scroll = newValue }
  }
  /// label width
  @inlinable
  public var label: Int32 {
    get { _themespacing.label }
    set { _themespacing.label = newValue }
  }
  /// section gap
  @inlinable
  public var section: Int32 {
    get { _themespacing.section }
    set { _themespacing.section = newValue }
  }
  /// item side gap
  @inlinable
  public var itemside: Int32 {
    get { _themespacing.itemside }
    set { _themespacing.itemside = newValue }
  }
  /// item middle gap
  @inlinable
  public var itemmid: Int32 {
    get { _themespacing.itemmid }
    set { _themespacing.itemmid = newValue }
  }
  /// item vertical gap
  @inlinable
  public var itemver: Int32 {
    get { _themespacing.itemver }
    set { _themespacing.itemver = newValue }
  }
  /// text horizontal gap
  @inlinable
  public var texthor: Int32 {
    get { _themespacing.texthor }
    set { _themespacing.texthor = newValue }
  }
  /// text vertical gap
  @inlinable
  public var textver: Int32 {
    get { _themespacing.textver }
    set { _themespacing.textver = newValue }
  }
  /// number of pixels to scroll
  @inlinable
  public var linescroll: Int32 {
    get { _themespacing.linescroll }
    set { _themespacing.linescroll = newValue }
  }
  /// number of multisamples
  @inlinable
  public var samples: Int32 {
    get { _themespacing.samples }
    set { _themespacing.samples = newValue }
  }
}
extension MjuiThemeSpacing: CustomReflectable {
  public var customMirror: Mirror {
    Mirror(
      self,
      children: [
        "total": total, "scroll": scroll, "label": label, "section": section, "itemside": itemside,
        "itemmid": itemmid, "itemver": itemver, "texthor": texthor, "textver": textver,
        "linescroll": linescroll, "samples": samples,
      ])
  }
}
