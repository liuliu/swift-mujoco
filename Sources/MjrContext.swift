import C_mujoco

public final class MjrContext {
  @usableFromInline
  var _context: mjrContext
  public init(model: MjModel, fontScale: MjFontScale) {
    _context = mjrContext()
    mjr_defaultContext(&_context)
    mjr_makeContext(model._model, &_context, fontScale.rawValue)
  }
  deinit {
    mjr_freeContext(&_context)
  }
}
