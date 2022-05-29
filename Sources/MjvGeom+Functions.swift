import C_mujoco

extension MjvGeom {
  @inlinable
  public mutating func initGeom(
    type: MjtGeom, size: MjDoubleBufferPointer, pos: MjDoubleBufferPointer,
    mat: MjDoubleBufferPointer, rgba: MjFloatBufferPointer
  ) {
    precondition(size.count == 3)
    size.withUnsafeBufferPointer { size__p in
      precondition(pos.count == 3)
      pos.withUnsafeBufferPointer { pos__p in
        precondition(mat.count == 9)
        mat.withUnsafeBufferPointer { mat__p in
          precondition(rgba.count == 4)
          rgba.withUnsafeBufferPointer { rgba__p in
            mjv_initGeom(
              &self._geom, type.rawValue, size__p.baseAddress, pos__p.baseAddress,
              mat__p.baseAddress, rgba__p.baseAddress)
          }
        }
      }
    }
  }
  @inlinable
  public mutating func makeConnector(
    type: MjtGeom, width: Double, a0: Double, a1: Double, a2: Double, b0: Double, b1: Double,
    b2: Double
  ) {
    mjv_makeConnector(&self._geom, type.rawValue, width, a0, a1, a2, b0, b1, b2)
  }
}
