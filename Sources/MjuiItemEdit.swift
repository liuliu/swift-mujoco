import C_mujoco

public final class MjuiItemEdit {
  @usableFromInline
  var object: AnyObject?
  @usableFromInline
  var _itemedit: UnsafeMutablePointer<mjuiItemEdit_>
  init(object: AnyObject?, itemedit: UnsafeMutablePointer<mjuiItemEdit_>) {
    self.object = object
    _itemedit = itemedit
  }
  deinit {
    guard object == nil else { return }
    _itemedit.deallocate()
  }
}
