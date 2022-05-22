extension MjUI {
  @inlinable
  public var spacing: MjuiThemeSpacing {
    get { MjuiThemeSpacing(_ui.pointee.spacing) }
    set { _ui.pointee.spacing = newValue._themespacing }
  }
  @inlinable
  public var color: MjuiThemeColor {
    get { MjuiThemeColor(_ui.pointee.color) }
    set { _ui.pointee.color = newValue._themecolor }
  }
  @inlinable
  public var rectid: Int32 {
    get { _ui.pointee.rectid }
    set { _ui.pointee.rectid = newValue }
  }
  @inlinable
  public var auxid: Int32 {
    get { _ui.pointee.auxid }
    set { _ui.pointee.auxid = newValue }
  }
  @inlinable
  public var radiocol: Int32 {
    get { _ui.pointee.radiocol }
    set { _ui.pointee.radiocol = newValue }
  }
  @inlinable
  public var width: Int32 {
    get { _ui.pointee.width }
    set { _ui.pointee.width = newValue }
  }
  @inlinable
  public var height: Int32 {
    get { _ui.pointee.height }
    set { _ui.pointee.height = newValue }
  }
  @inlinable
  public var maxheight: Int32 {
    get { _ui.pointee.maxheight }
    set { _ui.pointee.maxheight = newValue }
  }
  @inlinable
  public var scroll: Int32 {
    get { _ui.pointee.scroll }
    set { _ui.pointee.scroll = newValue }
  }
  @inlinable
  public var mousesect: Int32 {
    get { _ui.pointee.mousesect }
    set { _ui.pointee.mousesect = newValue }
  }
  @inlinable
  public var mouseitem: Int32 {
    get { _ui.pointee.mouseitem }
    set { _ui.pointee.mouseitem = newValue }
  }
  @inlinable
  public var mousehelp: Int32 {
    get { _ui.pointee.mousehelp }
    set { _ui.pointee.mousehelp = newValue }
  }
  @inlinable
  public var editsect: Int32 {
    get { _ui.pointee.editsect }
    set { _ui.pointee.editsect = newValue }
  }
  @inlinable
  public var edititem: Int32 {
    get { _ui.pointee.edititem }
    set { _ui.pointee.edititem = newValue }
  }
  @inlinable
  public var editcursor: Int32 {
    get { _ui.pointee.editcursor }
    set { _ui.pointee.editcursor = newValue }
  }
  @inlinable
  public var editscroll: Int32 {
    get { _ui.pointee.editscroll }
    set { _ui.pointee.editscroll = newValue }
  }
  @inlinable
  public var edittext: String {
    get {
      var value = _ui.pointee.edittext
      return withUnsafePointer(to: &value.0) { String(cString: $0, encoding: .utf8)! }
    }
    set {
      var value = newValue
      value.withUTF8 { utf8 in
        precondition(utf8.count < 300)
        withUnsafeMutablePointer(to: &_ui.pointee.edittext.0) { pos in
          utf8.baseAddress?.withMemoryRebound(to: CChar.self, capacity: utf8.count) {
            pos.assign(from: $0, count: utf8.count)
          }
          pos[utf8.count] = 0
        }
      }
    }
  }
  @inlinable
  public var nsect: Int32 {
    get { _ui.pointee.nsect }
    set { _ui.pointee.nsect = newValue }
  }
}
