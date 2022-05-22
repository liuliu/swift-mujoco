import C_mujoco

public struct MjuiItemSingle {
  @usableFromInline
  var object: AnyObject
  @usableFromInline
  var _itemsingle: UnsafeMutablePointer<mjuiItemSingle_>
  public init(object: AnyObject, itemsingle: UnsafeMutablePointer<mjuiItemSingle_>) {
    self.object = object
    _itemsingle = itemsingle
  }
}
