extension MjuiItemSingle {
  /// 0: none, 1: control, 2: shift; 4: alt
  @inlinable
  public var modifier: Int32 {
    get { _itemsingle.pointee.modifier }
    set { _itemsingle.pointee.modifier = newValue }
  }
  /// shortcut key; 0: undefined
  @inlinable
  public var shortcut: Int32 {
    get { _itemsingle.pointee.shortcut }
    set { _itemsingle.pointee.shortcut = newValue }
  }
}
