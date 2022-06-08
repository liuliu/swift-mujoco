extension MjuiItem {
  /// type (mjtItem)
  @inlinable
  public var type: MjtItem {
    get { MjtItem(rawValue: _item.pointee.type)! }
    set { _item.pointee.type = newValue.rawValue }
  }
  /// name
  @inlinable
  public var name: String {
    get {
      var value = _item.pointee.name
      return withUnsafePointer(to: &value.0) { String(cString: $0, encoding: .utf8)! }
    }
    set {
      var value = newValue
      value.withUTF8 { utf8 in
        let count = min(utf8.count, 39)
        withUnsafeMutablePointer(to: &_item.pointee.name.0) { pos in
          utf8.baseAddress?.withMemoryRebound(to: CChar.self, capacity: count) {
            pos.assign(from: $0, count: count)
          }
          pos[count] = 0
        }
      }
    }
  }
  /// 0: disable, 1: enable, 2+: use predicate
  @inlinable
  public var state: Int32 {
    get { _item.pointee.state }
    set { _item.pointee.state = newValue }
  }
  /// id of section containing item
  @inlinable
  public var sectionid: Int32 {
    get { _item.pointee.sectionid }
    set { _item.pointee.sectionid = newValue }
  }
  /// id of item within section
  @inlinable
  public var itemid: Int32 {
    get { _item.pointee.itemid }
    set { _item.pointee.itemid = newValue }
  }
  /// rectangle occupied by item
  @inlinable
  public var rect: MjrRect {
    get { _item.pointee.rect }
    set { _item.pointee.rect = newValue }
  }
}
extension MjuiItem: CustomReflectable {
  public var customMirror: Mirror {
    Mirror(
      self,
      children: [
        "type": type, "name": name, "state": state, "sectionid": sectionid, "itemid": itemid,
        "rect": rect, "pdata": pdata as Any, "single": single, "multi": multi, "slider": slider,
        "edit": edit,
      ])
  }
}
