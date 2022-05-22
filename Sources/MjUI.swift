import C_mujoco

public final class MjUI {
  @usableFromInline
  var _ui: UnsafeMutablePointer<mjUI_>
  public init() {
    _ui = UnsafeMutablePointer.allocate(capacity: 1)
  }
  deinit {
    _ui.deallocate()
  }
}
