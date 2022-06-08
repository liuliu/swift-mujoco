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

extension MjuiState {
  /// pointer to user data (for callbacks)
  @inlinable
  public var userdata: UnsafeMutableRawPointer? {
    get { _state.userdata }
    set { _state.userdata = newValue }
  }
}
