extension MjUI {
  /// UI theme spacing
  @inlinable
  public var spacing: MjuiThemeSpacing {
    get { MjuiThemeSpacing(_ui.pointee.spacing) }
    set { _ui.pointee.spacing = newValue._themespacing }
  }
  /// UI theme color
  @inlinable
  public var color: MjuiThemeColor {
    get { MjuiThemeColor(_ui.pointee.color) }
    set { _ui.pointee.color = newValue._themecolor }
  }
  /// index of this ui rectangle in mjuiState
  @inlinable
  public var rectid: Int32 {
    get { _ui.pointee.rectid }
    set { _ui.pointee.rectid = newValue }
  }
  /// aux buffer index of this ui
  @inlinable
  public var auxid: Int32 {
    get { _ui.pointee.auxid }
    set { _ui.pointee.auxid = newValue }
  }
  /// number of radio columns (0 defaults to 2)
  @inlinable
  public var radiocol: Int32 {
    get { _ui.pointee.radiocol }
    set { _ui.pointee.radiocol = newValue }
  }
  /// width
  @inlinable
  public var width: Int32 {
    get { _ui.pointee.width }
    set { _ui.pointee.width = newValue }
  }
  /// current heigth
  @inlinable
  public var height: Int32 {
    get { _ui.pointee.height }
    set { _ui.pointee.height = newValue }
  }
  /// height when all sections open
  @inlinable
  public var maxheight: Int32 {
    get { _ui.pointee.maxheight }
    set { _ui.pointee.maxheight = newValue }
  }
  /// scroll from top of UI
  @inlinable
  public var scroll: Int32 {
    get { _ui.pointee.scroll }
    set { _ui.pointee.scroll = newValue }
  }
  /// 0: none, -1: scroll, otherwise 1+section
  @inlinable
  public var mousesect: Int32 {
    get { _ui.pointee.mousesect }
    set { _ui.pointee.mousesect = newValue }
  }
  /// item within section
  @inlinable
  public var mouseitem: Int32 {
    get { _ui.pointee.mouseitem }
    set { _ui.pointee.mouseitem = newValue }
  }
  /// help button down: print shortcuts
  @inlinable
  public var mousehelp: Int32 {
    get { _ui.pointee.mousehelp }
    set { _ui.pointee.mousehelp = newValue }
  }
  /// 0: none, otherwise 1+section
  @inlinable
  public var editsect: Int32 {
    get { _ui.pointee.editsect }
    set { _ui.pointee.editsect = newValue }
  }
  /// item within section
  @inlinable
  public var edititem: Int32 {
    get { _ui.pointee.edititem }
    set { _ui.pointee.edititem = newValue }
  }
  /// cursor position
  @inlinable
  public var editcursor: Int32 {
    get { _ui.pointee.editcursor }
    set { _ui.pointee.editcursor = newValue }
  }
  /// horizontal scroll
  @inlinable
  public var editscroll: Int32 {
    get { _ui.pointee.editscroll }
    set { _ui.pointee.editscroll = newValue }
  }
  /// current text
  @inlinable
  public var edittext: String {
    get {
      var value = _ui.pointee.edittext
      return withUnsafePointer(to: &value.0) { String(cString: $0, encoding: .utf8)! }
    }
    set {
      var value = newValue
      value.withUTF8 { utf8 in
        let count = min(utf8.count, 299)
        withUnsafeMutablePointer(to: &_ui.pointee.edittext.0) { pos in
          utf8.baseAddress?.withMemoryRebound(to: CChar.self, capacity: count) {
            pos.assign(from: $0, count: count)
          }
          pos[count] = 0
        }
      }
    }
  }
  /// number of sections in use
  @inlinable
  public var nsect: Int32 {
    get { _ui.pointee.nsect }
    set { _ui.pointee.nsect = newValue }
  }
}
extension MjUI: CustomReflectable {
  public var customMirror: Mirror {
    Mirror(
      self,
      children: [
        "spacing": spacing, "color": color, "rectid": rectid, "auxid": auxid, "radiocol": radiocol,
        "width": width, "height": height, "maxheight": maxheight, "scroll": scroll,
        "mousesect": mousesect, "mouseitem": mouseitem, "mousehelp": mousehelp,
        "editsect": editsect, "edititem": edititem, "editcursor": editcursor,
        "editscroll": editscroll, "edittext": edittext, "nsect": nsect,
        "predicate": predicate as Any, "editchanged": editchanged as Any, "sect": sect,
      ])
  }
}
