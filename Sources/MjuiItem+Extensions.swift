extension MjuiItem {
  @inlinable
  public var type: MjtItem {
    get { MjtItem(rawValue: _item.pointee.type)! }
    set { _item.pointee.type = newValue.rawValue }
  }
  @inlinable
  public var name: String {
    get {
      var value = _item.pointee.name
      return withUnsafePointer(to: &value.0) { String(cString: $0, encoding: .utf8)! }
    }
    set {
      var value = newValue
      value.withUTF8 { utf8 in
        precondition(utf8.count < 40)
        withUnsafeMutablePointer(to: &_item.pointee.name.0) { pos in
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
    get { _item.pointee.state }
    set { _item.pointee.state = newValue }
  }
  @inlinable
  public var sectionid: Int32 {
    get { _item.pointee.sectionid }
    set { _item.pointee.sectionid = newValue }
  }
  @inlinable
  public var itemid: Int32 {
    get { _item.pointee.itemid }
    set { _item.pointee.itemid = newValue }
  }
  @inlinable
  public var rect: MjrRect {
    get { _item.pointee.rect }
    set { _item.pointee.rect = newValue }
  }
}
