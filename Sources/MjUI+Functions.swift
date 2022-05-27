import C_mujoco

extension MjUI {
  @inlinable
  public func resize(context: MjrContext) {
    mjui_resize(self._ui, &context._context)
  }
}
