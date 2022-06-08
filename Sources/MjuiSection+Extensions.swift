extension MjuiSection {
  /// name
  @inlinable
  public var name: String {
    get {
      var value = _section.pointee.name
      return withUnsafePointer(to: &value.0) { String(cString: $0, encoding: .utf8)! }
    }
    set {
      var value = newValue
      value.withUTF8 { utf8 in
        let count = min(utf8.count, 39)
        withUnsafeMutablePointer(to: &_section.pointee.name.0) { pos in
          utf8.baseAddress?.withMemoryRebound(to: CChar.self, capacity: count) {
            pos.assign(from: $0, count: count)
          }
          pos[count] = 0
        }
      }
    }
  }
  /// 0: closed, 1: open
  @inlinable
  public var state: Int32 {
    get { _section.pointee.state }
    set { _section.pointee.state = newValue }
  }
  /// 0: none, 1: control, 2: shift; 4: alt
  @inlinable
  public var modifier: Int32 {
    get { _section.pointee.modifier }
    set { _section.pointee.modifier = newValue }
  }
  /// shortcut key; 0: undefined
  @inlinable
  public var shortcut: Int32 {
    get { _section.pointee.shortcut }
    set { _section.pointee.shortcut = newValue }
  }
  /// number of items in use
  @inlinable
  public var nitem: Int32 {
    get { _section.pointee.nitem }
    set { _section.pointee.nitem = newValue }
  }
  /// rectangle occupied by title
  @inlinable
  public var rtitle: MjrRect {
    get { _section.pointee.rtitle }
    set { _section.pointee.rtitle = newValue }
  }
  /// rectangle occupied by content
  @inlinable
  public var rcontent: MjrRect {
    get { _section.pointee.rcontent }
    set { _section.pointee.rcontent = newValue }
  }
}
extension MjuiSection: CustomReflectable {
  public var customMirror: Mirror {
    Mirror(
      self,
      children: [
        "name": name, "state": state, "modifier": modifier, "shortcut": shortcut, "nitem": nitem,
        "rtitle": rtitle, "rcontent": rcontent, "item": item,
      ])
  }
}
