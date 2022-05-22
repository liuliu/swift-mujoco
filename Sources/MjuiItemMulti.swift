import C_mujoco

public final class MjuiItemMulti {
  @usableFromInline
  var object: AnyObject?
  @usableFromInline
  var _itemmulti: UnsafeMutablePointer<mjuiItemMulti_>
  public init(object: AnyObject?, itemmulti: UnsafeMutablePointer<mjuiItemMulti_>) {
    self.object = object
    _itemmulti = itemmulti
  }
  deinit {
    guard object == nil else { return }
    _itemmulti.deallocate()
  }
}
