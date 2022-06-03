import C_mujoco

extension MjUI {
  ///  Compute UI sizes.
  @inlinable
  public mutating func resize(context: MjrContext) {
    mjui_resize(self._ui, context._context)
  }
  ///  Copy UI image to current buffer.
  @inlinable
  public mutating func render(state: MjuiState, context: MjrContext) {
    var state__state = state._state
    mjui_render(self._ui, &state__state, context._context)
  }
}
