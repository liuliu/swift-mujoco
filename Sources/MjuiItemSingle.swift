import C_mujoco

public final class MjuiItemSingle {
  @usableFromInline
  var object: AnyObject?
  @usableFromInline
  var _itemsingle: UnsafeMutablePointer<mjuiItemSingle_>
  public init(object: AnyObject?, itemsingle: UnsafeMutablePointer<mjuiItemSingle_>) {
    self.object = object
    _itemsingle = itemsingle
  }
  deinit {
    guard object == nil else { return }
    _itemsingle.deallocate()
  }
}
