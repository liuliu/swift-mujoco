import C_mujoco

public struct MjuiItemMulti {
  @usableFromInline
  var object: AnyObject
  @usableFromInline
  var _itemmulti: UnsafeMutablePointer<mjuiItemMulti_>
  public init(object: AnyObject, itemmulti: UnsafeMutablePointer<mjuiItemMulti_>) {
    self.object = object
    _itemmulti = itemmulti
  }
}
