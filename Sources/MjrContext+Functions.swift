extension MjrContext {
  @inlinable
  public func changeFont(fontscale: Int32) {
  }
  @inlinable
  public func addAux(index: Int32, width: Int32, height: Int32, samples: Int32) {
  }
  @inlinable
  public func uploadTexture(model: MjModel, texid: Int32) {
  }
  @inlinable
  public func uploadMesh(model: MjModel, meshid: Int32) {
  }
  @inlinable
  public func uploadHField(model: MjModel, hfieldid: Int32) {
  }
  @inlinable
  public func restoreBuffer() {
  }
  @inlinable
  public func setBuffer(framebuffer: Int32) {
  }
  @inlinable
  public func readPixels(rgb: CChar, depth: Float, viewport: MjrRect) {
  }
  @inlinable
  public func drawPixels(rgb: Int8, depth: Float, viewport: MjrRect) {
  }
  @inlinable
  public func blitBuffer(src: MjrRect, dst: MjrRect, flg_color: Int32, flg_depth: Int32) {
  }
  @inlinable
  public func setAux(index: Int32) {
  }
  @inlinable
  public func blitAux(index: Int32, src: MjrRect, left: Int32, bottom: Int32) {
  }
  @inlinable
  public func text(font: Int32, txt: String, x: Float, y: Float, r: Float, g: Float, b: Float) {
  }
  @inlinable
  public func overlay(
    font: Int32, gridpos: Int32, viewport: MjrRect, overlay: String, overlay2: String
  ) {
  }
  @inlinable
  public func maxViewport() {
  }
  @inlinable
  public func label(
    viewport: MjrRect, font: Int32, txt: String, r: Float, g: Float, b: Float, a: Float, rt: Float,
    gt: Float, bt: Float
  ) {
  }
  @inlinable
  public func figure(viewport: MjrRect, fig: MjvFigure) {
  }
}
