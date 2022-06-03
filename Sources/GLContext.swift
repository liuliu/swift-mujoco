import C_glfw
import C_mujoco

public final class GLContext {
  final class Factory {
    static let factory = Factory()
    init() {
      glfwInit()
    }
    func sink() {
    }
  }
  let window: OpaquePointer

  public init(width: Int, height: Int, title: String) {
    Factory.factory.sink()  // Make sure we init glfw.
    window = glfwCreateWindow(Int32(width), Int32(height), title, nil, nil)
  }

  deinit {
    glfwDestroyWindow(window)
  }

  public func makeCurrent<Result>(_ closure: () throws -> Result) rethrows -> Result {
    glfwMakeContextCurrent(window)
    let result = try closure()
    return result
  }

  public func runLoop(
    swapInterval: Int32, _ closure: (_ width: Int32, _ height: Int32) throws -> Void
  ) rethrows {
    glfwSwapInterval(swapInterval)
    while glfwWindowShouldClose(window) == 0 {
      var width: Int32 = 0
      var height: Int32 = 0
      glfwGetFramebufferSize(window, &width, &height)
      try closure(width, height)
      glfwSwapBuffers(window)
      glfwPollEvents()
    }
  }
}
func uiUpdateState(_ wnd: OpaquePointer) {
  // extract data from user pointer
  let userPointer = Unmanaged<GLContext.UserPointer>.fromOpaque(glfwGetWindowUserPointer(wnd))
    .takeUnretainedValue()

  // mouse buttons
  userPointer.uiState.pointee.left =
    (glfwGetMouseButton(wnd, GLFW_MOUSE_BUTTON_LEFT) == GLFW_PRESS) ? 1 : 0
  userPointer.uiState.pointee.right =
    (glfwGetMouseButton(wnd, GLFW_MOUSE_BUTTON_RIGHT) == GLFW_PRESS) ? 1 : 0
  userPointer.uiState.pointee.middle =
    (glfwGetMouseButton(wnd, GLFW_MOUSE_BUTTON_MIDDLE) == GLFW_PRESS) ? 1 : 0

  // keyboard modifiers
  userPointer.uiState.pointee.control =
    (glfwGetKey(wnd, GLFW_KEY_LEFT_CONTROL) == GLFW_PRESS
      || glfwGetKey(wnd, GLFW_KEY_RIGHT_CONTROL) == GLFW_PRESS) ? 1 : 0
  userPointer.uiState.pointee.shift =
    (glfwGetKey(wnd, GLFW_KEY_LEFT_SHIFT) == GLFW_PRESS
      || glfwGetKey(wnd, GLFW_KEY_RIGHT_SHIFT) == GLFW_PRESS) ? 1 : 0
  userPointer.uiState.pointee.alt =
    (glfwGetKey(wnd, GLFW_KEY_LEFT_ALT) == GLFW_PRESS
      || glfwGetKey(wnd, GLFW_KEY_RIGHT_ALT) == GLFW_PRESS) ? 1 : 0

  // swap left and right if Alt
  if userPointer.uiState.pointee.alt != 0 {
    let tmp = userPointer.uiState.pointee.left
    userPointer.uiState.pointee.left = userPointer.uiState.pointee.right
    userPointer.uiState.pointee.right = tmp
  }

  // get mouse position, scale by buffer-to-window ratio
  var x: Double = 0
  var y: Double = 0
  glfwGetCursorPos(wnd, &x, &y)
  x *= userPointer.buffer2window
  y *= userPointer.buffer2window

  // invert y to match OpenGL convention
  y = Double(userPointer.uiState.pointee.rect.0.height) - y

  // save
  userPointer.uiState.pointee.dx = x - userPointer.uiState.pointee.x
  userPointer.uiState.pointee.dy = y - userPointer.uiState.pointee.y
  userPointer.uiState.pointee.x = x
  userPointer.uiState.pointee.y = y

  // find mouse rectangle
  withUnsafePointer(to: &userPointer.uiState.pointee.rect.1) {
    userPointer.uiState.pointee.mouserect =
      mjr_findRect(
        Int32(x.rounded()), Int32(y.rounded()), userPointer.uiState.pointee.nrect - 1, $0) + 1
  }
}

func uiKeyboard(_ wnd: OpaquePointer?, _ key: Int32, _ scancode: Int32, _ act: Int32, _ mods: Int32)
{
  guard let wnd = wnd else { return }
  // release: nothing to do
  guard act != GLFW_RELEASE else { return }

  // extract data from user pointer
  let userPointer = Unmanaged<GLContext.UserPointer>.fromOpaque(glfwGetWindowUserPointer(wnd))
    .takeUnretainedValue()

  // update state
  uiUpdateState(wnd)

  // set key info
  userPointer.uiState.pointee.type = .key
  userPointer.uiState.pointee.key = key
  userPointer.uiState.pointee.keytime = glfwGetTime()

  // application-specific processing
  userPointer.uiEvent(&userPointer.uiState.pointee)
}

func uiMouseMove(_ wnd: OpaquePointer?, _ xpos: Double, _ ypos: Double) {
  guard let wnd = wnd else { return }
  // extract data from user pointer
  let userPointer = Unmanaged<GLContext.UserPointer>.fromOpaque(glfwGetWindowUserPointer(wnd))
    .takeUnretainedValue()

  // no buttons down: nothing to do
  guard
    userPointer.uiState.pointee.left != 0 || userPointer.uiState.pointee.right != 0
      || userPointer.uiState.pointee.middle != 0
  else { return }

  // update state
  uiUpdateState(wnd)

  // set move info
  userPointer.uiState.pointee.type = .move

  // application-specific processing
  userPointer.uiEvent(&userPointer.uiState.pointee)
}

func uiMouseButton(_ wnd: OpaquePointer?, _ button: Int32, _ act: Int32, _ mods: Int32) {
  guard let wnd = wnd else { return }
  // extract data from user pointer
  let userPointer = Unmanaged<GLContext.UserPointer>.fromOpaque(glfwGetWindowUserPointer(wnd))
    .takeUnretainedValue()

  // update state
  uiUpdateState(wnd)

  var btn: MjtButton

  // translate button
  if button == GLFW_MOUSE_BUTTON_LEFT {
    btn = .left
  } else if button == GLFW_MOUSE_BUTTON_RIGHT {
    btn = .right
  } else {
    btn = .middle
  }

  // swap left and right if Alt
  if glfwGetKey(wnd, GLFW_KEY_LEFT_ALT) == GLFW_PRESS
    || glfwGetKey(wnd, GLFW_KEY_RIGHT_ALT) == GLFW_PRESS
  {
    if btn == .left {
      btn = .right
    } else if btn == .right {
      btn = .left
    }
  }

  // press
  if act == GLFW_PRESS {
    // detect doubleclick: 250 ms
    if btn == userPointer.uiState.pointee.button
      && glfwGetTime() - userPointer.uiState.pointee.buttontime < 0.25
    {
      userPointer.uiState.pointee.doubleclick = 1
    } else {
      userPointer.uiState.pointee.doubleclick = 0
    }

    // set info
    userPointer.uiState.pointee.type = .press
    userPointer.uiState.pointee.button = btn
    userPointer.uiState.pointee.buttontime = glfwGetTime()

    // start dragging
    if userPointer.uiState.pointee.mouserect != 0 {
      userPointer.uiState.pointee.dragbutton = userPointer.uiState.pointee.button
      userPointer.uiState.pointee.dragrect = userPointer.uiState.pointee.mouserect
    }
  } else {
    // release
    userPointer.uiState.pointee.type = .release
  }

  // application-specific processing
  userPointer.uiEvent(&userPointer.uiState.pointee)

  // stop dragging after application processing
  if userPointer.uiState.pointee.type == .release {
    userPointer.uiState.pointee.dragrect = 0
    userPointer.uiState.pointee.dragbutton = .none
  }
}

func uiScroll(_ wnd: OpaquePointer?, _ xoffset: Double, _ yoffset: Double) {
  guard let wnd = wnd else { return }
  // extract data from user pointer
  let userPointer = Unmanaged<GLContext.UserPointer>.fromOpaque(glfwGetWindowUserPointer(wnd))
    .takeUnretainedValue()

  // update state
  uiUpdateState(wnd)

  // set scroll info, scale by buffer-to-window ratio
  userPointer.uiState.pointee.type = .scroll
  userPointer.uiState.pointee.sx = xoffset * userPointer.buffer2window
  userPointer.uiState.pointee.sy = yoffset * userPointer.buffer2window

  // application-specific processing
  userPointer.uiEvent(&userPointer.uiState.pointee)
}

func uiResize(_ wnd: OpaquePointer?, _ width: Int32, _ height: Int32) {
  guard let wnd = wnd else { return }
  // extract data from user pointer
  let userPointer = Unmanaged<GLContext.UserPointer>.fromOpaque(glfwGetWindowUserPointer(wnd))
    .takeUnretainedValue()

  // set layout
  userPointer.uiLayout(&userPointer.uiState.pointee)

  // update state
  uiUpdateState(wnd)

  // set resize info
  userPointer.uiState.pointee.type = .resize

  // stop dragging
  userPointer.uiState.pointee.dragbutton = .none
  userPointer.uiState.pointee.dragrect = 0

  // application-specific processing (unless called with 0,0 from uiModify)
  if width != 0 && height != 0 {
    userPointer.uiEvent(&userPointer.uiState.pointee)
  }
}

extension GLContext {
  /// Compute suitable font scale.
  public var fontScale: Int32 {
    // compute framebuffer-to-window ratio
    var widthWin: Int32 = 1
    var widthBuf: Int32 = 0
    var height: Int32 = 0
    glfwGetWindowSize(window, &widthWin, &height)
    glfwGetFramebufferSize(window, &widthBuf, &height)
    let b2w = Double(widthBuf) / Double(widthWin)

    // compute PPI
    var widthMM: Int32 = 0
    var heightMM: Int32 = 0
    glfwGetMonitorPhysicalSize(glfwGetPrimaryMonitor(), &widthMM, &heightMM)
    let widthVmode = glfwGetVideoMode(glfwGetPrimaryMonitor()).pointee.width
    let PPI = 25.4 * b2w * Double(widthVmode) / Double(widthMM)

    // estimate font scaling, guard against unrealistic PPI
    var fs: Int32
    if widthBuf > widthWin {
      fs = Int32((b2w * 100).rounded())
    } else if PPI > 50 && PPI < 350 {
      fs = Int32(PPI)
    } else {
      fs = 150
    }
    fs = Int32((Double(fs) * 0.02).rounded() * 50)
    fs = min(300, max(100, fs))

    return fs
  }

  final class UserPointer {
    var uiState: UnsafeMutablePointer<MjuiState>
    var uiEvent: (inout MjuiState) -> Void
    var uiLayout: (inout MjuiState) -> Void
    var buffer2window: Double = 0
    init(
      uiState: UnsafeMutablePointer<MjuiState>, uiEvent: @escaping (inout MjuiState) -> Void,
      uiLayout: @escaping (inout MjuiState) -> Void
    ) {
      self.uiState = uiState
      self.uiEvent = uiEvent
      self.uiLayout = uiLayout
    }
  }

  /// Set internal and user-supplied UI callbacks in GLFW window.
  public func setCallback(
    uiState: inout MjuiState, uiEvent: @escaping (inout MjuiState) -> Void,
    uiLayout: @escaping (inout MjuiState) -> Void
  ) {
    let userPointer = UserPointer(
      uiState: withUnsafeMutablePointer(to: &uiState) { $0 }, uiEvent: uiEvent, uiLayout: uiLayout)
    glfwSetWindowUserPointer(window, Unmanaged.passRetained(userPointer).toOpaque())

    // compute framebuffer-to-window pixel ratio
    var widthWin: Int32 = 1
    var widthBuf: Int32 = 0
    var height: Int32 = 0
    glfwGetWindowSize(window, &widthWin, &height)
    glfwGetFramebufferSize(window, &widthBuf, &height)
    userPointer.buffer2window = Double(widthBuf) / Double(widthWin)

    // set internal callbacks
    glfwSetKeyCallback(window, uiKeyboard)
    glfwSetCursorPosCallback(window, uiMouseMove)
    glfwSetMouseButtonCallback(window, uiMouseButton)
    glfwSetScrollCallback(window, uiScroll)
    glfwSetWindowSizeCallback(window, uiResize)
  }

  /// Clear UI callbacks in GLFW window.
  public func clearCallback() {
    // clear container
    if let userPointer = glfwGetWindowUserPointer(window) {
      glfwSetWindowUserPointer(window, nil)
      Unmanaged<UserPointer>.fromOpaque(userPointer).release()
    }

    // clear internal callbacks
    glfwSetKeyCallback(window, nil)
    glfwSetCursorPosCallback(window, nil)
    glfwSetMouseButtonCallback(window, nil)
    glfwSetScrollCallback(window, nil)
    glfwSetWindowSizeCallback(window, nil)
  }
}
