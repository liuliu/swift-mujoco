import C_mujoco

/// check and button-related
public struct MjuiItemSingle {
  @usableFromInline
  var object: AnyObject
  @usableFromInline
  var _itemsingle: UnsafeMutablePointer<mjuiItemSingle_>
  @usableFromInline
  init(object: AnyObject, itemsingle: UnsafeMutablePointer<mjuiItemSingle_>) {
    self.object = object
    _itemsingle = itemsingle
  }
}
