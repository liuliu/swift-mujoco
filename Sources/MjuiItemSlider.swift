import C_mujoco

public final class MjuiItemSlider {
  @usableFromInline
  var object: AnyObject?
  @usableFromInline
  var _itemslider: UnsafeMutablePointer<mjuiItemSlider_>
  public init(object: AnyObject?, itemslider: UnsafeMutablePointer<mjuiItemSlider_>) {
    self.object = object
    _itemslider = itemslider
  }
  deinit {
    guard object == nil else { return }
    _itemslider.deallocate()
  }
}
