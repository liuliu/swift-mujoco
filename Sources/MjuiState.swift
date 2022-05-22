import C_mujoco

public struct MjuiState {
  @usableFromInline
  var _state: mjuiState_
  public init() {
    _state = mjuiState_()
  }
}
