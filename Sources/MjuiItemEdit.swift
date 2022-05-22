import C_mujoco

public struct MjuiItemEdit {
  @usableFromInline
  var object: AnyObject
  @usableFromInline
  var _itemedit: UnsafeMutablePointer<mjuiItemEdit_>
  public init(object: AnyObject, itemedit: UnsafeMutablePointer<mjuiItemEdit_>) {
    self.object = object
    _itemedit = itemedit
  }
}
