import C_mujoco

extension MjuiState {
  @inlinable
  public func update(section: Int32, item: Int32, ui: MjUI, context: MjrContext) {
    var __state = self._state
    mjui_update(section, item, ui._ui, &__state, context._context)
  }
}
