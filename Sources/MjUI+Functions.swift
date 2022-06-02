import C_mujoco

extension MjUI {
  ///  Compute UI sizes.
  @inlinable
  public func resize(context: MjrContext) {
    mjui_resize(self._ui, context._context)
  }
  ///  Handle UI event, return pointer to changed item, NULL if no change.
  @inlinable
  public func event(state: inout MjuiState, context: MjrContext) -> MjuiItem {
    return MjuiItem(mjui_event(self._ui, &state._state, context._context), object: _storage)
  }
  ///  Copy UI image to current buffer.
  @inlinable
  public func render(state: MjuiState, context: MjrContext) {
    var state__state = state._state
    mjui_render(self._ui, &state__state, context._context)
  }
}
