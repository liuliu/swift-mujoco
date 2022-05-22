extension MjuiSection {
  @inlinable
  public var name: String {
    get {
      var value = _section.pointee.name
      return withUnsafePointer(to: &value.0) { String(cString: $0, encoding: .utf8)! }
    }
    set {
      var value = newValue
      value.withUTF8 { utf8 in
        precondition(utf8.count < 40)
        withUnsafeMutablePointer(to: &_section.pointee.name.0) { pos in
          utf8.baseAddress?.withMemoryRebound(to: CChar.self, capacity: utf8.count) {
            pos.assign(from: $0, count: utf8.count)
          }
          pos[utf8.count] = 0
        }
      }
    }
  }
  @inlinable
  public var state: Int32 {
    get { _section.pointee.state }
    set { _section.pointee.state = newValue }
  }
  @inlinable
  public var modifier: Int32 {
    get { _section.pointee.modifier }
    set { _section.pointee.modifier = newValue }
  }
  @inlinable
  public var shortcut: Int32 {
    get { _section.pointee.shortcut }
    set { _section.pointee.shortcut = newValue }
  }
  @inlinable
  public var nitem: Int32 {
    get { _section.pointee.nitem }
    set { _section.pointee.nitem = newValue }
  }
  @inlinable
  public var rtitle: MjrRect {
    get { _section.pointee.rtitle }
    set { _section.pointee.rtitle = newValue }
  }
  @inlinable
  public var rcontent: MjrRect {
    get { _section.pointee.rcontent }
    set { _section.pointee.rcontent = newValue }
  }
}
