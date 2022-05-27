import C_mujoco

extension MjData {
  @inlinable
  public func warning(_ warning: Int32, info: Int32) {
    mj_warning(self._data, warning, info)
  }
}
