import C_mujoco

/// slider-related
public struct MjuiItemSlider {
  @usableFromInline
  var object: AnyObject
  @usableFromInline
  var _itemslider: UnsafeMutablePointer<mjuiItemSlider_>
  @usableFromInline
  init(object: AnyObject, itemslider: UnsafeMutablePointer<mjuiItemSlider_>) {
    self.object = object
    _itemslider = itemslider
  }
}
