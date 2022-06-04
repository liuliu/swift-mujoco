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

extension MjvFigure {
  /// line data (x,y)
  @inlinable
  public var linedata: Mj2DArray<(x: Float, y: Float)> {
    get {
      Mj2DArray<(x: Float, y: Float)>(
        array: withUnsafeMutablePointer(
          to: &_figure.pointee.linedata.0.0,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: (x: Float, y: Float).self) }),
        object: _storage,
        len: (mjMAXLINE, mjMAXLINEPNT))
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<(x: Float, y: Float)> =
        withUnsafeMutablePointer(
          to: &_figure.pointee.linedata.0.0,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: (x: Float, y: Float).self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(mjMAXLINE * mjMAXLINEPNT))
    }
  }
}
