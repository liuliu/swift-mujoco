import C_mujoco

public struct MjuiThemeColor {
  @usableFromInline
  var _themecolor: mjuiThemeColor_
  public init(_ ind: Int32) {
    _themecolor = mjui_themeColor(ind)
  }
  @usableFromInline
  init(_ themecolor: mjuiThemeColor_) {
    _themecolor = themecolor
  }
}
