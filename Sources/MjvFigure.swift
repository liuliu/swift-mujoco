import C_mujoco

public final class MjvFigure {
  @usableFromInline
  var _figure: UnsafeMutablePointer<mjvFigure>

  deinit {
    _figure.deallocate()
  }

  public init() {
    _figure = UnsafeMutablePointer.allocate(capacity: 1)
    mjv_defaultFigure(_figure)
  }
}
