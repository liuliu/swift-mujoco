extension MjuiItemSingle {
  @inlinable
  public var modifier: Int32 {
    get { _itemsingle.pointee.modifier }
    set { _itemsingle.pointee.modifier = newValue }
  }
  @inlinable
  public var shortcut: Int32 {
    get { _itemsingle.pointee.shortcut }
    set { _itemsingle.pointee.shortcut = newValue }
  }
}
