import C_mujoco

extension MjrContext {
  ///  Allocate resources in custom OpenGL context; fontscale is mjtFontScale.
  @inlinable
  public mutating func makeContext(model: MjModel, fontscale: MjtFontScale) {
    mjr_makeContext(model._model, self._context, fontscale.rawValue)
  }
  ///  Change font of existing context; fontscale is mjtFontScale.
  @inlinable
  public mutating func changeFont(fontscale: MjtFontScale) {
    mjr_changeFont(fontscale.rawValue, self._context)
  }
  ///  Add Aux buffer with given index to context; free previous Aux buffer.
  @inlinable
  public mutating func addAux(index: Int32, width: Int32, height: Int32, samples: Int32) {
    mjr_addAux(index, width, height, samples, self._context)
  }
  ///  Upload texture to GPU, overwriting previous upload if any.
  @inlinable
  public func uploadTexture(model: MjModel, texid: Int32) {
    mjr_uploadTexture(model._model, self._context, texid)
  }
  ///  Upload mesh to GPU, overwriting previous upload if any.
  @inlinable
  public func uploadMesh(model: MjModel, meshid: Int32) {
    mjr_uploadMesh(model._model, self._context, meshid)
  }
  ///  Upload height field to GPU, overwriting previous upload if any.
  @inlinable
  public func uploadHField(model: MjModel, hfieldid: Int32) {
    mjr_uploadHField(model._model, self._context, hfieldid)
  }
  ///  Make con->currentBuffer current again.
  @inlinable
  public func restoreBuffer() {
    mjr_restoreBuffer(self._context)
  }
  /// Set OpenGL framebuffer for rendering: mjFB_WINDOW or mjFB_OFFSCREEN. framebuffer is mjtFramebuffer. If only one buffer is available, set that buffer and ignore framebuffer argument.
  @inlinable
  public mutating func setBuffer(framebuffer: MjtFramebuffer) {
    mjr_setBuffer(framebuffer.rawValue, self._context)
  }
  /// Blit from src viewpoint in current framebuffer to dst viewport in other framebuffer. If src, dst have different size and flg_depth==0, color is interpolated with GL_LINEAR.
  @inlinable
  public func blitBuffer(src: MjrRect, dst: MjrRect, flgColor: Int32, flgDepth: Int32) {
    mjr_blitBuffer(src, dst, flgColor, flgDepth, self._context)
  }
  ///  Set Aux buffer for custom OpenGL rendering (call restoreBuffer when done).
  @inlinable
  public func setAux(index: Int32) {
    mjr_setAux(index, self._context)
  }
  ///  Blit from Aux buffer to con->currentBuffer.
  @inlinable
  public func blitAux(index: Int32, src: MjrRect, left: Int32, bottom: Int32) {
    mjr_blitAux(index, src, left, bottom, self._context)
  }
  ///  Draw text at (x,y) in relative coordinates; font is mjtFont.
  @inlinable
  public func text(font: MjtFont, txt: String, x: Float, y: Float, r: Float, g: Float, b: Float) {
    mjr_text(font.rawValue, txt, self._context, x, y, r, g, b)
  }
  ///  Draw text overlay; font is mjtFont; gridpos is mjtGridPos.
  @inlinable
  public func overlay(
    font: MjtFont, gridpos: MjtGridPos, viewport: MjrRect, overlay: String, overlay2: String
  ) {
    mjr_overlay(font.rawValue, gridpos.rawValue, viewport, overlay, overlay2, self._context)
  }
  ///  Get maximum viewport for active buffer.
  @inlinable
  public func maxViewport() -> MjrRect {
    return mjr_maxViewport(self._context)
  }
  ///  Draw rectangle with centered text. font is mjtFont.
  @inlinable
  public func label(
    viewport: MjrRect, font: MjtFont, txt: String, r: Float, g: Float, b: Float, a: Float,
    rt: Float, gt: Float, bt: Float
  ) {
    mjr_label(viewport, font.rawValue, txt, r, g, b, a, rt, gt, bt, self._context)
  }
  ///  Draw 2D figure.
  @inlinable
  public func figure(viewport: MjrRect, figure: inout MjvFigure) {
    mjr_figure(viewport, figure._figure, self._context)
  }
  ///  Render 3D scene.
  @inlinable
  public func render(viewport: MjrRect, scene: inout MjvScene) {
    mjr_render(viewport, scene._scene, self._context)
  }
}
