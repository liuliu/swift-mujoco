import C_mujoco

extension MjvGeom {
  @inlinable
  public mutating func makeConnector(
    type: Int32, width: Double, a0: Double, a1: Double, a2: Double, b0: Double, b1: Double,
    b2: Double
  ) {
    mjv_makeConnector(&self._geom, type, width, a0, a1, a2, b0, b1, b2)
  }
}
