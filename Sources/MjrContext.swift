import C_mujoco

public struct MjrContext {
  @usableFromInline
  let _storage: Storage
  @inlinable
  var _context: UnsafeMutablePointer<mjrContext> {
    withUnsafeMutablePointer(to: &_storage._context) { $0 }
  }

  @usableFromInline
  final class Storage {
    @usableFromInline
    var _context: mjrContext
    init(model: MjModel, fontScale: MjFontScale) {
      _context = mjrContext()
      mjr_defaultContext(&_context)
      mjr_makeContext(model._model, &_context, fontScale.rawValue)
    }
    deinit {
      mjr_freeContext(&_context)
    }
  }

  public init(model: MjModel, fontScale: MjFontScale) {
    _storage = Storage(model: model, fontScale: fontScale)
  }
}

extension MjrContext {
  @inlinable
  public func readPixels(
    rgb: inout UnsafeMutablePointer<UInt8>, depth: inout UnsafeMutablePointer<Float>,
    viewport: MjrRect
  ) {
    mjr_readPixels(rgb, depth, viewport, self._context)
  }
  @inlinable
  public func drawPixels(rgb: UnsafePointer<UInt8>, depth: UnsafePointer<Float>, viewport: MjrRect)
  {
    mjr_drawPixels(rgb, depth, viewport, self._context)
  }
}
