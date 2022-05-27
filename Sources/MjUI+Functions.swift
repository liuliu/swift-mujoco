import C_mujoco

extension MjUI {
  @inlinable
  public func add(def: MjuiDef) {
    var def__def = def._def
    mjui_add(self._ui, &def__def)
  }
  @inlinable
  public func addToSection(sect: Int32, def: MjuiDef) {
    var def__def = def._def
    mjui_addToSection(self._ui, sect, &def__def)
  }
  @inlinable
  public func resize(context: MjrContext) {
    mjui_resize(self._ui, context._context)
  }
  @inlinable
  public func event(state: inout MjuiState, context: MjrContext) {
    mjui_event(self._ui, &state._state, context._context)
  }
  @inlinable
  public func render(state: MjuiState, context: MjrContext) {
    var state__state = state._state
    mjui_render(self._ui, &state__state, context._context)
  }
}
