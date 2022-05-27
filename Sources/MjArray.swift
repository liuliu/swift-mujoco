// The difference of this v.s. using UnsafeMutableBufferPointer is that MjArray will hold a
// reference to the owner of that piece of memory, therefore, making sure the access is safe even
// though underlying it is backed by UnsafeMutablePointer.
public struct MjArray<Element> {
  private var object: AnyObject  // Make sure the array is valid.
  @usableFromInline
  var len: Int32
  @usableFromInline
  var _array: UnsafeMutablePointer<Element>
  @usableFromInline
  init(array: UnsafeMutablePointer<Element>, object: AnyObject, len: Int32) {
    _array = array
    self.object = object
    self.len = len
  }
  @inlinable
  public subscript(index: Int) -> Element {
    get {
      precondition(index < len)
      return _array[index]
    }
    set {
      precondition(index < len)
      _array[index] = newValue
    }
  }
  @inlinable
  public var count: Int { Int(len) }
}

public struct MjStaticStringArray {
  private var object: AnyObject  // Make sure the array is valid.
  @usableFromInline
  var len: Int32
  @usableFromInline
  var strlen: Int32
  @usableFromInline
  var _array: UnsafeMutablePointer<CChar>
  @usableFromInline
  init(array: UnsafeMutablePointer<CChar>, object: AnyObject, len: Int32, strlen: Int32) {
    _array = array
    self.object = object
    self.len = len
    self.strlen = strlen
  }
  @inlinable
  public subscript(index: Int) -> String {
    get {
      precondition(index < len)
      return String(cString: _array + index * Int(strlen))
    }
    set {
      precondition(index < len)
      var value = newValue
      value.withUTF8 {
        precondition($0.count < strlen)
        let pos = (_array + index * Int(strlen))
        let count = $0.count
        $0.baseAddress?.withMemoryRebound(to: CChar.self, capacity: count) {
          pos.assign(from: $0, count: count)
        }
        pos[count] = 0
      }
    }
  }
  @inlinable
  public var count: Int { Int(len) }
}

public protocol MjInt32BufferPointer {
  func withContiguousBufferPointer(_: (UnsafeBufferPointer<Int32>) -> Void)
}

public protocol MjInt32MutableBufferPointer: MjInt32BufferPointer {
  mutating func withContiguousMutableBufferPointer(_: (UnsafeMutableBufferPointer<Int32>) -> Void)
}

public protocol MjFloatBufferPointer {
  func withContiguousBufferPointer(_: (UnsafeBufferPointer<Float>) -> Void)
}

public protocol MjFloatMutableBufferPointer: MjFloatBufferPointer {
  mutating func withContiguousMutableBufferPointer(_: (UnsafeMutableBufferPointer<Float>) -> Void)
}

public protocol MjDoubleBufferPointer {
  func withContiguousBufferPointer(_: (UnsafeBufferPointer<Double>) -> Void)
}

public protocol MjDoubleMutableBufferPointer: MjDoubleBufferPointer {
  mutating func withContiguousMutableBufferPointer(_: (UnsafeMutableBufferPointer<Double>) -> Void)
}

extension MjArray: MjInt32MutableBufferPointer & MjInt32BufferPointer where Element == Int32 {
  public func withContiguousBufferPointer(_ closure: (UnsafeBufferPointer<Int32>) -> Void) {
    closure(UnsafeBufferPointer(start: _array, count: count))
  }
  public mutating func withContiguousMutableBufferPointer(
    _ closure: (UnsafeMutableBufferPointer<Int32>) -> Void
  ) {
    closure(UnsafeMutableBufferPointer(start: _array, count: count))
  }
}

extension MjArray: MjFloatMutableBufferPointer & MjFloatBufferPointer where Element == Float {
  public func withContiguousBufferPointer(_ closure: (UnsafeBufferPointer<Float>) -> Void) {
    closure(UnsafeBufferPointer(start: _array, count: count))
  }
  public mutating func withContiguousMutableBufferPointer(
    _ closure: (UnsafeMutableBufferPointer<Float>) -> Void
  ) {
    closure(UnsafeMutableBufferPointer(start: _array, count: count))
  }
}

extension MjArray: MjDoubleMutableBufferPointer & MjDoubleBufferPointer where Element == Double {
  public func withContiguousBufferPointer(_ closure: (UnsafeBufferPointer<Double>) -> Void) {
    closure(UnsafeBufferPointer(start: _array, count: count))
  }
  public mutating func withContiguousMutableBufferPointer(
    _ closure: (UnsafeMutableBufferPointer<Double>) -> Void
  ) {
    closure(UnsafeMutableBufferPointer(start: _array, count: count))
  }
}

extension Array: MjInt32MutableBufferPointer & MjInt32BufferPointer where Element == Int32 {
  public func withContiguousBufferPointer(_ closure: (UnsafeBufferPointer<Int32>) -> Void) {
    withUnsafeBufferPointer(closure)
  }
  public mutating func withContiguousMutableBufferPointer(
    _ closure: (UnsafeMutableBufferPointer<Int32>) -> Void
  ) {
    withUnsafeMutableBufferPointer { closure($0) }
  }
}

extension Array: MjFloatMutableBufferPointer & MjFloatBufferPointer where Element == Float {
  public func withContiguousBufferPointer(_ closure: (UnsafeBufferPointer<Float>) -> Void) {
    withUnsafeBufferPointer(closure)
  }
  public mutating func withContiguousMutableBufferPointer(
    _ closure: (UnsafeMutableBufferPointer<Float>) -> Void
  ) {
    withUnsafeMutableBufferPointer { closure($0) }
  }
}

extension Array: MjDoubleMutableBufferPointer & MjDoubleBufferPointer where Element == Double {
  public func withContiguousBufferPointer(_ closure: (UnsafeBufferPointer<Double>) -> Void) {
    withUnsafeBufferPointer(closure)
  }
  public mutating func withContiguousMutableBufferPointer(
    _ closure: (UnsafeMutableBufferPointer<Double>) -> Void
  ) {
    withUnsafeMutableBufferPointer { closure($0) }
  }
}

extension MjDoubleBufferPointer {
  // 1, 3, 4, 6, 9
  public static func tuple(_ element: (Double)) -> MjDoubleBufferPointer {
    return MjTuple(element, count: 1)
  }
  public static func tuple(_ element: (Double, Double, Double)) -> MjDoubleBufferPointer {
    return MjTuple(element, count: 3)
  }
  public static func tuple(_ element: (Double, Double, Double, Double)) -> MjDoubleBufferPointer {
    return MjTuple(element, count: 4)
  }
  public static func tuple(_ element: (Double, Double, Double, Double, Double, Double))
    -> MjDoubleBufferPointer
  {
    return MjTuple(element, count: 6)
  }
  public static func tuple(
    _ element: (Double, Double, Double, Double, Double, Double, Double, Double, Double)
  ) -> MjDoubleBufferPointer {
    return MjTuple(element, count: 9)
  }
}

public struct MjTuple<Element>: MjDoubleBufferPointer {
  private var element: Element
  private var count: Int
  init(_ element: Element, count: Int) {
    self.element = element
    self.count = count
  }
  public func withContiguousBufferPointer(_ closure: (UnsafeBufferPointer<Double>) -> Void) {
    var local = element
    withUnsafeMutablePointer(to: &local) {
      closure(
        UnsafeBufferPointer(
          start: UnsafeRawPointer($0).assumingMemoryBound(to: Double.self), count: count))
    }
  }
}
