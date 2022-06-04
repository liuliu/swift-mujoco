import C_mujoco

/// abstract geom
///
/// This is the data structure describing one abstract visualization geom - which could correspond to a model geom or to a decoration element constructed by the visualizer.
public struct MjvGeom {
  @usableFromInline
  var _geom: mjvGeom
  public init() {
    _geom = mjvGeom()
  }
}
