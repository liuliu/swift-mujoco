import C_glfw
import C_mujoco

public final class GLContext {
  // Note that we assume all accesses to this dictionary is from one thread. Which may not be
  // true depending on how you use GLFW.
  static var dragAndDrops = [OpaquePointer: ([String]) -> Void]()

  final class Factory {
    static let factory = Factory()
    init() {
      glfwInit()
    }
    func sink() {
    }
  }
  let window: OpaquePointer
  private var isCurrent: Bool = false
  private var pollEventsTriggered: Bool = false
  /// glfwSwapInterval
  public var swapInterval: Int32 = 0 {
    didSet {
      glfwSwapInterval(swapInterval)
    }
  }
  /// Callback when a file drag and dropped into current window.
  ///
  /// This doesn't receive drag and drop if the window is not current one (a.k.a. makeCurrent). You
  /// are responsible to avoid retain-cycle between this closure and the current GLContext class.
  /// (i.e. using weak pointer if you want to reference to GLContext inside the closure).
  public var dragAndDrop: (([String]) -> Void)? = nil {
    didSet {
      // If it is not current, we are not doing anything anyway.
      guard isCurrent else {
        return
      }
      guard let dragAndDrop = dragAndDrop else {
        GLContext.dragAndDrops[window] = nil
        glfwSetDropCallback(window, nil)
        return
      }
      // Make sure we set the callback.
      GLContext.dragAndDrops[window] = dragAndDrop
      glfwSetDropCallback(window, uiDrop)
    }
  }

  public init(width: Int, height: Int, title: String) {
    Factory.factory.sink()  // Make sure we init glfw.
    window = glfwCreateWindow(Int32(width), Int32(height), title, nil, nil)
  }

  deinit {
    glfwDestroyWindow(window)
  }

  /// glfwGetClipboardString, glfwSetClipboardString
  public var clipboard: String? {
    get { String(cString: glfwGetClipboardString(window), encoding: .utf8) }
    set { glfwSetClipboardString(window, newValue) }
  }

  /// glfwGetTime.
  public static var time: Double {
    glfwGetTime()
  }

  /// glfwGetVideoMode
  public static var videoMode: GLFWvidmode {
    glfwGetVideoMode(glfwGetPrimaryMonitor()).pointee
  }

  /// Make the window the current one to display and receive events.
  public func makeCurrent<Result>(_ closure: () throws -> Result) rethrows -> Result {
    isCurrent = true
    glfwMakeContextCurrent(window)
    // Register drop callback only when we are in current.
    if let dragAndDrop = dragAndDrop {
      GLContext.dragAndDrops[window] = dragAndDrop
      glfwSetDropCallback(window, uiDrop)
    }
    let result = try closure()
    isCurrent = false
    if dragAndDrop != nil {
      // Deregister the drop callback.
      GLContext.dragAndDrops[window] = nil
      glfwSetDropCallback(window, nil)
    }
    return result
  }

  /// Establish the event run loop for GL window.
  public func runLoop(
    swapInterval: Int32, _ closure: (_ width: Int32, _ height: Int32) throws -> Bool
  ) rethrows {
    self.swapInterval = swapInterval
    var continuerequest = true
    while glfwWindowShouldClose(window) == 0 && continuerequest {
      var width: Int32 = 0
      var height: Int32 = 0
      pollEventsTriggered = false
      glfwGetFramebufferSize(window, &width, &height)
      continuerequest = try closure(width, height)
      glfwSwapBuffers(window)
      if !pollEventsTriggered {
        glfwPollEvents()
      }
    }
  }

  /// Manually poll events for the run loop. It will be polled at the end of the run loop if no
  /// manual polling.
  public func pollEvents() {
    glfwPollEvents()
    pollEventsTriggered = true
  }
}

func uiDrop(
  _ wnd: OpaquePointer?, count: Int32, paths: UnsafeMutablePointer<UnsafePointer<CChar>?>?
) {
  guard let paths = paths, let wnd = wnd else { return }
  guard let dragAndDrop = GLContext.dragAndDrops[wnd] else { return }
  var filePaths = [String]()
  for i in 0..<Int(count) {
    guard let path = paths[i],
      let filePath = String(cString: path, encoding: .utf8)
    else { continue }
    filePaths.append(filePath)
  }
  dragAndDrop(filePaths)
}

func uiUpdateState(_ wnd: OpaquePointer, uiState: inout MjuiState, buffer2window: Double) {
  // mouse buttons
  uiState.left =
    (glfwGetMouseButton(wnd, GLFW_MOUSE_BUTTON_LEFT) == GLFW_PRESS) ? 1 : 0
  uiState.right =
    (glfwGetMouseButton(wnd, GLFW_MOUSE_BUTTON_RIGHT) == GLFW_PRESS) ? 1 : 0
  uiState.middle =
    (glfwGetMouseButton(wnd, GLFW_MOUSE_BUTTON_MIDDLE) == GLFW_PRESS) ? 1 : 0

  // keyboard modifiers
  uiState.control =
    (glfwGetKey(wnd, GLFW_KEY_LEFT_CONTROL) == GLFW_PRESS
      || glfwGetKey(wnd, GLFW_KEY_RIGHT_CONTROL) == GLFW_PRESS) ? 1 : 0
  uiState.shift =
    (glfwGetKey(wnd, GLFW_KEY_LEFT_SHIFT) == GLFW_PRESS
      || glfwGetKey(wnd, GLFW_KEY_RIGHT_SHIFT) == GLFW_PRESS) ? 1 : 0
  uiState.alt =
    (glfwGetKey(wnd, GLFW_KEY_LEFT_ALT) == GLFW_PRESS
      || glfwGetKey(wnd, GLFW_KEY_RIGHT_ALT) == GLFW_PRESS) ? 1 : 0

  // swap left and right if Alt
  if uiState.alt != 0 {
    let tmp = uiState.left
    uiState.left = uiState.right
    uiState.right = tmp
  }

  // get mouse position, scale by buffer-to-window ratio
  var x: Double = 0
  var y: Double = 0
  glfwGetCursorPos(wnd, &x, &y)
  x *= buffer2window
  y *= buffer2window

  // invert y to match OpenGL convention
  y = Double(uiState.rect.0.height) - y

  // save
  uiState.dx = x - uiState.x
  uiState.dy = y - uiState.y
  uiState.x = x
  uiState.y = y

  // find mouse rectangle
  uiState.mouserect =
    mjr_findRect(
      Int32(x.rounded()), Int32(y.rounded()), uiState.nrect - 1,
      withUnsafePointer(to: &uiState.rect.1) { $0 }) + 1
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
  uiUpdateState(
    wnd, uiState: &userPointer.uiState.pointee, buffer2window: userPointer.buffer2window)

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
  uiUpdateState(
    wnd, uiState: &userPointer.uiState.pointee, buffer2window: userPointer.buffer2window)

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
  uiUpdateState(
    wnd, uiState: &userPointer.uiState.pointee, buffer2window: userPointer.buffer2window)

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
  uiUpdateState(
    wnd, uiState: &userPointer.uiState.pointee, buffer2window: userPointer.buffer2window)

  // set scroll info, scale by buffer-to-window ratio
  userPointer.uiState.pointee.type = .scroll
  userPointer.uiState.pointee.sx = xoffset * userPointer.buffer2window
  userPointer.uiState.pointee.sy = yoffset * userPointer.buffer2window

  // application-specific processing
  userPointer.uiEvent(&userPointer.uiState.pointee)
}

func uiResizeLayout(
  _ wnd: OpaquePointer, width: Int32, height: Int32, uiState: inout MjuiState, buffer2window: Double
) {
  if let userPointer = glfwGetWindowUserPointer(wnd).map({
    Unmanaged<GLContext.UserPointer>.fromOpaque($0).takeUnretainedValue()
  }) {
    // set layout
    userPointer.uiLayout(&uiState, width, height)
  }

  // update state
  uiUpdateState(wnd, uiState: &uiState, buffer2window: buffer2window)

  // set resize info
  uiState.type = .resize

  // stop dragging
  uiState.dragbutton = .none
  uiState.dragrect = 0
}

func uiResize(_ wnd: OpaquePointer?, _ width: Int32, _ height: Int32) {
  guard let wnd = wnd else { return }
  // extract data from user pointer
  let userPointer = Unmanaged<GLContext.UserPointer>.fromOpaque(glfwGetWindowUserPointer(wnd))
    .takeUnretainedValue()

  uiResizeLayout(
    wnd, width: width, height: height, uiState: &userPointer.uiState.pointee,
    buffer2window: userPointer.buffer2window)

  // application-specific processing
  userPointer.uiEvent(&userPointer.uiState.pointee)
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
    var uiLayout: (inout MjuiState, Int32, Int32) -> Void
    var buffer2window: Double = 0
    init(
      uiState: UnsafeMutablePointer<MjuiState>, uiEvent: @escaping (inout MjuiState) -> Void,
      uiLayout: @escaping (inout MjuiState, Int32, Int32) -> Void
    ) {
      self.uiState = uiState
      self.uiEvent = uiEvent
      self.uiLayout = uiLayout
    }
  }

  /// Set internal and user-supplied UI callbacks in GLFW window.
  public func setCallbacks(
    uiState: inout MjuiState, uiEvent: @escaping (inout MjuiState) -> Void,
    uiLayout: @escaping (inout MjuiState, Int32, Int32) -> Void
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
  public func clearCallbacks() {
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

  /// Propagate that the uiState has new updates.
  public func modify(ui: MjUI, uiState: inout MjuiState, context: inout MjrContext) {
    var widthWin: Int32 = 1
    var widthBuf: Int32 = 0
    var height: Int32 = 0
    glfwGetWindowSize(window, &widthWin, &height)
    glfwGetFramebufferSize(window, &widthBuf, &height)
    let buffer2window = Double(widthBuf) / Double(widthWin)
    context.addAux(
      index: ui.auxid, width: ui.width, height: ui.maxheight, samples: ui.spacing.samples)
    uiResizeLayout(
      window, width: widthBuf, height: height, uiState: &uiState, buffer2window: buffer2window)
    uiState.update(section: -1, item: -1, ui: ui, context: context)
  }
}
