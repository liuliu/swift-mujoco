import C_mujoco

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
