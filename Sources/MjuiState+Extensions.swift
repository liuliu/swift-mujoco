extension MjuiState {
  /// number of rectangles used
  @inlinable
  public var nrect: Int32 {
    get { _state.nrect }
    set { _state.nrect = newValue }
  }
  /// rectangles (index 0: entire window)
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
  /// (type mjtEvent)
  @inlinable
  public var type: MjtEvent {
    get { MjtEvent(rawValue: _state.type)! }
    set { _state.type = newValue.rawValue }
  }
  /// is left button down
  @inlinable
  public var left: Int32 {
    get { _state.left }
    set { _state.left = newValue }
  }
  /// is right button down
  @inlinable
  public var right: Int32 {
    get { _state.right }
    set { _state.right = newValue }
  }
  /// is middle button down
  @inlinable
  public var middle: Int32 {
    get { _state.middle }
    set { _state.middle = newValue }
  }
  /// is last press a double click
  @inlinable
  public var doubleclick: Int32 {
    get { _state.doubleclick }
    set { _state.doubleclick = newValue }
  }
  /// which button was pressed (mjtButton)
  @inlinable
  public var button: MjtButton {
    get { MjtButton(rawValue: _state.button)! }
    set { _state.button = newValue.rawValue }
  }
  /// time of last button press
  @inlinable
  public var buttontime: Double {
    get { _state.buttontime }
    set { _state.buttontime = newValue }
  }
  /// x position
  @inlinable
  public var x: Double {
    get { _state.x }
    set { _state.x = newValue }
  }
  /// y position
  @inlinable
  public var y: Double {
    get { _state.y }
    set { _state.y = newValue }
  }
  /// x displacement
  @inlinable
  public var dx: Double {
    get { _state.dx }
    set { _state.dx = newValue }
  }
  /// y displacement
  @inlinable
  public var dy: Double {
    get { _state.dy }
    set { _state.dy = newValue }
  }
  /// x scroll
  @inlinable
  public var sx: Double {
    get { _state.sx }
    set { _state.sx = newValue }
  }
  /// y scroll
  @inlinable
  public var sy: Double {
    get { _state.sy }
    set { _state.sy = newValue }
  }
  /// is control down
  @inlinable
  public var control: Int32 {
    get { _state.control }
    set { _state.control = newValue }
  }
  /// is shift down
  @inlinable
  public var shift: Int32 {
    get { _state.shift }
    set { _state.shift = newValue }
  }
  /// is alt down
  @inlinable
  public var alt: Int32 {
    get { _state.alt }
    set { _state.alt = newValue }
  }
  /// which key was pressed
  @inlinable
  public var key: Int32 {
    get { _state.key }
    set { _state.key = newValue }
  }
  /// time of last key press
  @inlinable
  public var keytime: Double {
    get { _state.keytime }
    set { _state.keytime = newValue }
  }
  /// which rectangle contains mouse
  @inlinable
  public var mouserect: Int32 {
    get { _state.mouserect }
    set { _state.mouserect = newValue }
  }
  /// which rectangle is dragged with mouse
  @inlinable
  public var dragrect: Int32 {
    get { _state.dragrect }
    set { _state.dragrect = newValue }
  }
  /// which button started drag (mjtButton)
  @inlinable
  public var dragbutton: MjtButton {
    get { MjtButton(rawValue: _state.dragbutton)! }
    set { _state.dragbutton = newValue.rawValue }
  }
}
