import C_mujoco

extension MjUI {
  ///  Add definitions to UI.
  @inlinable
  public func add(def: MjuiDef) {
    var def__def = def._def
    mjui_add(self._ui, &def__def)
  }
  ///  Add definitions to UI section.
  @inlinable
  public func addToSection(sect: Int32, def: MjuiDef) {
    var def__def = def._def
    mjui_addToSection(self._ui, sect, &def__def)
  }
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
