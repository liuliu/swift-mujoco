import C_glfw

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
    Factory.factory.sink() // Make sure we init glfw.
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

  public func runLoop(swapInterval: Int32, _ closure: (_ width: Int32, _ height: Int32) throws -> Void) rethrows {
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
