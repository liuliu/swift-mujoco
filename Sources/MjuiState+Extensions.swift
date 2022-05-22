extension MjuiState {
  @inlinable
  public var nrect: Int32 {
    get { _state.nrect }
    set { _state.nrect = newValue }
  }
  @inlinable
  public var rect:
    (
      MjrRect, MjrRect, MjrRect, MjrRect, MjrRect, MjrRect, MjrRect, MjrRect, MjrRect, MjrRect,
      MjrRect, MjrRect, MjrRect, MjrRect, MjrRect, MjrRect, MjrRect, MjrRect, MjrRect, MjrRect,
      MjrRect, MjrRect, MjrRect, MjrRect, MjrRect
    )
  {
    get { _state.rect }
    set { _state.rect = newValue }
  }
  @inlinable
  public var type: Int32 {
    get { _state.type }
    set { _state.type = newValue }
  }
  @inlinable
  public var left: Int32 {
    get { _state.left }
    set { _state.left = newValue }
  }
  @inlinable
  public var right: Int32 {
    get { _state.right }
    set { _state.right = newValue }
  }
  @inlinable
  public var middle: Int32 {
    get { _state.middle }
    set { _state.middle = newValue }
  }
  @inlinable
  public var doubleclick: Int32 {
    get { _state.doubleclick }
    set { _state.doubleclick = newValue }
  }
  @inlinable
  public var button: MjButton {
    get { MjButton(rawValue: _state.button)! }
    set { _state.button = newValue.rawValue }
  }
  @inlinable
  public var buttontime: Double {
    get { _state.buttontime }
    set { _state.buttontime = newValue }
  }
  @inlinable
  public var x: Double {
    get { _state.x }
    set { _state.x = newValue }
  }
  @inlinable
  public var y: Double {
    get { _state.y }
    set { _state.y = newValue }
  }
  @inlinable
  public var dx: Double {
    get { _state.dx }
    set { _state.dx = newValue }
  }
  @inlinable
  public var dy: Double {
    get { _state.dy }
    set { _state.dy = newValue }
  }
  @inlinable
  public var sx: Double {
    get { _state.sx }
    set { _state.sx = newValue }
  }
  @inlinable
  public var sy: Double {
    get { _state.sy }
    set { _state.sy = newValue }
  }
  @inlinable
  public var control: Int32 {
    get { _state.control }
    set { _state.control = newValue }
  }
  @inlinable
  public var shift: Int32 {
    get { _state.shift }
    set { _state.shift = newValue }
  }
  @inlinable
  public var alt: Int32 {
    get { _state.alt }
    set { _state.alt = newValue }
  }
  @inlinable
  public var key: Int32 {
    get { _state.key }
    set { _state.key = newValue }
  }
  @inlinable
  public var keytime: Double {
    get { _state.keytime }
    set { _state.keytime = newValue }
  }
  @inlinable
  public var mouserect: Int32 {
    get { _state.mouserect }
    set { _state.mouserect = newValue }
  }
  @inlinable
  public var dragrect: Int32 {
    get { _state.dragrect }
    set { _state.dragrect = newValue }
  }
  @inlinable
  public var dragbutton: MjButton {
    get { MjButton(rawValue: _state.dragbutton)! }
    set { _state.dragbutton = newValue.rawValue }
  }
}
