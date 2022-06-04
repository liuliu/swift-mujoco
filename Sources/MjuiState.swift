import C_mujoco

/// mouse and keyboard state
///
/// This structure contains the keyboard and mouse state used by the UI framework.
public struct MjuiState {
  @usableFromInline
  var _state: mjuiState_
  public init() {
    _state = mjuiState_()
  }
}
