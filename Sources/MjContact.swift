import C_mujoco

public struct MjContact {
  @usableFromInline
  var _contact: mjContact
  public init() {
    _contact = mjContact()
  }
}
