import C_mujoco

public struct MjuiSection {
  @usableFromInline
  var object: AnyObject
  @usableFromInline
  var _section: UnsafeMutablePointer<mjuiSection_>
  @usableFromInline
  init(object: AnyObject, section: UnsafeMutablePointer<mjuiSection_>) {
    self.object = object
    _section = section
  }
}
