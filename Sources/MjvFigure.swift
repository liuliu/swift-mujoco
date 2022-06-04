import C_mujoco

/// abstract 2D figure passed to OpenGL renderer
///
/// This structure contains everything needed to render a 2D plot in OpenGL. The buffers for line points etc. are preallocated, and the user has to populate them before calling the function mjr_figure with this data structure as an argument.
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
