import C_mujoco

public struct MjuiSection {
  @usableFromInline
  var object: AnyObject
  @usableFromInline
  var _section: UnsafeMutablePointer<mjuiSection_>
  public init(object: AnyObject, section: UnsafeMutablePointer<mjuiSection_>) {
    self.object = object
    _section = section
  }
}
