import C_mujoco

public struct MjvGeom {
  @usableFromInline
  var _geom: mjvGeom
  public init() {
    _geom = mjvGeom()
  }
}
