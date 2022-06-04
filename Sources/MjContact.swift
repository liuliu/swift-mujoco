import C_mujoco

/// result of collision detection functions
///
/// This is the data structure holding information about one contact. mjData.contact is a preallocated array of mjContact data structures, populated at runtime with the contacts found by the collision detector. Additional contact information is then filled-in by the simulator.
public struct MjContact {
  @usableFromInline
  var _contact: mjContact
  public init() {
    _contact = mjContact()
  }
}
