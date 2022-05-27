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
    var context__context = context._context
    mjui_resize(self._ui, &context__context)
  }
  @inlinable
  public func event(state: inout MjuiState, context: MjrContext) {
    var context__context = context._context
    mjui_event(self._ui, &state._state, &context__context)
  }
  @inlinable
  public func render(state: MjuiState, context: MjrContext) {
    var state__state = state._state
    var context__context = context._context
    mjui_render(self._ui, &state__state, &context__context)
  }
}
