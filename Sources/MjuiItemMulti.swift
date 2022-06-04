import C_mujoco

/// static, radio and select-related
public struct MjuiItemMulti {
  @usableFromInline
  var object: AnyObject
  @usableFromInline
  var _itemmulti: UnsafeMutablePointer<mjuiItemMulti_>
  @usableFromInline
  init(object: AnyObject, itemmulti: UnsafeMutablePointer<mjuiItemMulti_>) {
    self.object = object
    _itemmulti = itemmulti
  }
}
