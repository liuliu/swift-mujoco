import C_mujoco

extension MjrContext {
  @inlinable
  public func makeContext(model: MjModel, fontscale: MjtFontScale) {
    mjr_makeContext(model._model, self._context, fontscale.rawValue)
  }
  @inlinable
  public func changeFont(fontscale: MjtFontScale) {
    mjr_changeFont(fontscale.rawValue, self._context)
  }
  @inlinable
  public func addAux(index: Int32, width: Int32, height: Int32, samples: Int32) {
    mjr_addAux(index, width, height, samples, self._context)
  }
  @inlinable
  public func uploadTexture(model: MjModel, texid: Int32) {
    mjr_uploadTexture(model._model, self._context, texid)
  }
  @inlinable
  public func uploadMesh(model: MjModel, meshid: Int32) {
    mjr_uploadMesh(model._model, self._context, meshid)
  }
  @inlinable
  public func uploadHField(model: MjModel, hfieldid: Int32) {
    mjr_uploadHField(model._model, self._context, hfieldid)
  }
  @inlinable
  public func restoreBuffer() {
    mjr_restoreBuffer(self._context)
  }
  @inlinable
  public func setBuffer(framebuffer: MjtFramebuffer) {
    mjr_setBuffer(framebuffer.rawValue, self._context)
  }
  @inlinable
  public func blitBuffer(src: MjrRect, dst: MjrRect, flgColor: Int32, flgDepth: Int32) {
    mjr_blitBuffer(src, dst, flgColor, flgDepth, self._context)
  }
  @inlinable
  public func setAux(index: Int32) {
    mjr_setAux(index, self._context)
  }
  @inlinable
  public func blitAux(index: Int32, src: MjrRect, left: Int32, bottom: Int32) {
    mjr_blitAux(index, src, left, bottom, self._context)
  }
  @inlinable
  public func text(font: MjtFont, txt: String, x: Float, y: Float, r: Float, g: Float, b: Float) {
    mjr_text(font.rawValue, txt, self._context, x, y, r, g, b)
  }
  @inlinable
  public func overlay(
    font: MjtFont, gridpos: MjtGridPos, viewport: MjrRect, overlay: String, overlay2: String
  ) {
    mjr_overlay(font.rawValue, gridpos.rawValue, viewport, overlay, overlay2, self._context)
  }
  @inlinable
  public func maxViewport() -> MjrRect {
    return mjr_maxViewport(self._context)
  }
  @inlinable
  public func label(
    viewport: MjrRect, font: MjtFont, txt: String, r: Float, g: Float, b: Float, a: Float,
    rt: Float, gt: Float, bt: Float
  ) {
    mjr_label(viewport, font.rawValue, txt, r, g, b, a, rt, gt, bt, self._context)
  }
  @inlinable
  public func figure(viewport: MjrRect, fig: inout MjvFigure) {
    mjr_figure(viewport, fig._figure, self._context)
  }
  @inlinable
  public func render(viewport: MjrRect, scene: inout MjvScene) {
    mjr_render(viewport, scene._scene, self._context)
  }
}
