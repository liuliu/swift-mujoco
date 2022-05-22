extension MjuiDef {
  @inlinable
  public var type: MjItem {
    get { MjItem(rawValue: _def.type)! }
    set { _def.type = newValue.rawValue }
  }
  @inlinable
  public var name: String {
    get {
      var value = _def.name
      return withUnsafePointer(to: &value.0) { String(cString: $0, encoding: .utf8)! }
    }
    set {
      var value = newValue
      value.withUTF8 { utf8 in
        precondition(utf8.count < 40)
        withUnsafeMutablePointer(to: &_def.name.0) { pos in
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
    get { _def.state }
    set { _def.state = newValue }
  }
  @inlinable
  public var other: String {
    get {
      var value = _def.other
      return withUnsafePointer(to: &value.0) { String(cString: $0, encoding: .utf8)! }
    }
    set {
      var value = newValue
      value.withUTF8 { utf8 in
        precondition(utf8.count < 300)
        withUnsafeMutablePointer(to: &_def.other.0) { pos in
          utf8.baseAddress?.withMemoryRebound(to: CChar.self, capacity: utf8.count) {
            pos.assign(from: $0, count: utf8.count)
          }
          pos[utf8.count] = 0
        }
      }
    }
  }
}
