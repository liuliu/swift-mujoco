import C_mujoco

extension MjrContext {
  @inlinable
  public func changeFont(fontscale: Int32) {
    mjr_changeFont(fontscale, &self._context)
  }
  @inlinable
  public func addAux(index: Int32, width: Int32, height: Int32, samples: Int32) {
    mjr_addAux(index, width, height, samples, &self._context)
  }
  @inlinable
  public func uploadTexture(model: MjModel, texid: Int32) {
    var __context = self._context
    mjr_uploadTexture(model._model, &__context, texid)
  }
  @inlinable
  public func uploadMesh(model: MjModel, meshid: Int32) {
    var __context = self._context
    mjr_uploadMesh(model._model, &__context, meshid)
  }
  @inlinable
  public func uploadHField(model: MjModel, hfieldid: Int32) {
    var __context = self._context
    mjr_uploadHField(model._model, &__context, hfieldid)
  }
  @inlinable
  public func restoreBuffer() {
    var __context = self._context
    mjr_restoreBuffer(&__context)
  }
  @inlinable
  public func setBuffer(framebuffer: Int32) {
    mjr_setBuffer(framebuffer, &self._context)
  }
  @inlinable
  public func blitBuffer(src: MjrRect, dst: MjrRect, flgColor: Int32, flgDepth: Int32) {
    var __context = self._context
    mjr_blitBuffer(src, dst, flgColor, flgDepth, &__context)
  }
  @inlinable
  public func setAux(index: Int32) {
    var __context = self._context
    mjr_setAux(index, &__context)
  }
  @inlinable
  public func blitAux(index: Int32, src: MjrRect, left: Int32, bottom: Int32) {
    var __context = self._context
    mjr_blitAux(index, src, left, bottom, &__context)
  }
  @inlinable
  public func text(font: Int32, txt: String, x: Float, y: Float, r: Float, g: Float, b: Float) {
    var __context = self._context
    mjr_text(font, txt, &__context, x, y, r, g, b)
  }
  @inlinable
  public func overlay(
    font: Int32, gridpos: Int32, viewport: MjrRect, overlay: String, overlay2: String
  ) {
    var __context = self._context
    mjr_overlay(font, gridpos, viewport, overlay, overlay2, &__context)
  }
  @inlinable
  public func maxViewport() {
    var __context = self._context
    mjr_maxViewport(&__context)
  }
  @inlinable
  public func label(
    viewport: MjrRect, font: Int32, txt: String, r: Float, g: Float, b: Float, a: Float, rt: Float,
    gt: Float, bt: Float
  ) {
    var __context = self._context
    mjr_label(viewport, font, txt, r, g, b, a, rt, gt, bt, &__context)
  }
  @inlinable
  public func figure(viewport: MjrRect, fig: inout MjvFigure) {
    var __context = self._context
    mjr_figure(viewport, fig._figure, &__context)
  }
  @inlinable
  public func render(viewport: MjrRect, scene: inout MjvScene) {
    var __context = self._context
    mjr_render(viewport, &scene._scene, &__context)
  }
}
