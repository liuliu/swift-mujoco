extension MjuiItemSlider {
  @inlinable
  public var range: (Double, Double) {
    get { _itemslider.pointee.range }
    set { _itemslider.pointee.range = newValue }
  }
  @inlinable
  public var divisions: Double {
    get { _itemslider.pointee.divisions }
    set { _itemslider.pointee.divisions = newValue }
  }
}
