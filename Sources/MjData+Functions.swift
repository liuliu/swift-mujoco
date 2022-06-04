import C_mujoco

extension MjData {
  ///  Map from body local to global Cartesian coordinates.
  @inlinable
  public mutating func local2Global<
    T0: MjDoubleMutableBufferPointer, T1: MjDoubleMutableBufferPointer
  >(
    xpos: inout T0, xmat: inout T1, pos: MjDoubleBufferPointer, quat: MjDoubleBufferPointer,
    body: Int32, sameframe: UInt8
  ) {
    precondition(xpos.count == 3)
    xpos.withUnsafeMutableBufferPointer { xpos__p in
      precondition(xmat.count == 9)
      xmat.withUnsafeMutableBufferPointer { xmat__p in
        precondition(pos.count == 3)
        pos.withUnsafeBufferPointer { pos__p in
          precondition(quat.count == 4)
          quat.withUnsafeBufferPointer { quat__p in
            mj_local2Global(
              self._data, xpos__p.baseAddress, xmat__p.baseAddress, pos__p.baseAddress,
              quat__p.baseAddress, body, sameframe)
          }
        }
      }
    }
  }
  ///  High-level warning function: count warnings in mjData, print only the first.
  @inlinable
  public mutating func warning(_ warning: Int32, info: Int32) {
    mj_warning(self._data, warning, info)
  }
}
