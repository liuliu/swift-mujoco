import C_mujoco

public struct MjvFigure {
  @usableFromInline
  let _storage = Storage()
  @inlinable
  var _figure: UnsafeMutablePointer<mjvFigure> { _storage._figure }

  @usableFromInline
  final class Storage {
    @usableFromInline
    let _figure: UnsafeMutablePointer<mjvFigure>

    deinit {
      _figure.deallocate()
    }

    init() {
      _figure = UnsafeMutablePointer.allocate(capacity: 1)
      mjv_defaultFigure(_figure)
    }
  }
}
