import C_mujoco

/// UI visualization theme color
///
/// This structure defines the colors of UI items in the theme.
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
