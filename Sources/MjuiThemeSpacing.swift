import C_mujoco

/// UI visualization theme spacing
///
/// This structure defines the spacing of UI items in the theme.
public struct MjuiThemeSpacing {
  @usableFromInline
  var _themespacing: mjuiThemeSpacing_
  public init(_ ind: Int32) {
    _themespacing = mjui_themeSpacing(ind)
  }
  @usableFromInline
  init(_ themespacing: mjuiThemeSpacing_) {
    _themespacing = themespacing
  }
}
