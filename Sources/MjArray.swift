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

public protocol MjUInt8BufferPointer {
  var count: Int { get }
  func withUnsafeBufferPointer<R>(_: (UnsafeBufferPointer<UInt8>) throws -> R) rethrows -> R
}

public protocol MjUInt8MutableBufferPointer: MjUInt8BufferPointer {
  mutating func withUnsafeMutableBufferPointer<R>(
    _: (inout UnsafeMutableBufferPointer<UInt8>) throws -> R
  ) rethrows -> R
}

public protocol MjInt32BufferPointer {
  var count: Int { get }
  func withUnsafeBufferPointer<R>(_: (UnsafeBufferPointer<Int32>) throws -> R) rethrows -> R
}

public protocol MjInt32MutableBufferPointer: MjInt32BufferPointer {
  mutating func withUnsafeMutableBufferPointer<R>(
    _: (inout UnsafeMutableBufferPointer<Int32>) throws -> R
  ) rethrows -> R
}

public protocol MjFloatBufferPointer {
  var count: Int { get }
  func withUnsafeBufferPointer<R>(_: (UnsafeBufferPointer<Float>) throws -> R) rethrows -> R
}

public protocol MjFloatMutableBufferPointer: MjFloatBufferPointer {
  mutating func withUnsafeMutableBufferPointer<R>(
    _: (inout UnsafeMutableBufferPointer<Float>) throws -> R
  ) rethrows -> R
}

public protocol MjDoubleBufferPointer {
  var count: Int { get }
  func withUnsafeBufferPointer<R>(_: (UnsafeBufferPointer<Double>) throws -> R) rethrows -> R
}

public protocol MjDoubleMutableBufferPointer: MjDoubleBufferPointer {
  mutating func withUnsafeMutableBufferPointer<R>(
    _: (inout UnsafeMutableBufferPointer<Double>) throws -> R
  ) rethrows -> R
}

extension MjArray: MjUInt8MutableBufferPointer & MjUInt8BufferPointer where Element == UInt8 {
  @inlinable
  public func withUnsafeBufferPointer<R>(_ body: (UnsafeBufferPointer<UInt8>) throws -> R) rethrows
    -> R
  {
    return try body(UnsafeBufferPointer(start: _array, count: count))
  }
  @inlinable
  public mutating func withUnsafeMutableBufferPointer<R>(
    _ body: (inout UnsafeMutableBufferPointer<UInt8>) throws -> R
  ) rethrows -> R {
    var ump = UnsafeMutableBufferPointer(start: _array, count: count)
    return try body(&ump)
  }
}

extension MjArray: MjInt32MutableBufferPointer & MjInt32BufferPointer where Element == Int32 {
  @inlinable
  public func withUnsafeBufferPointer<R>(_ body: (UnsafeBufferPointer<Int32>) throws -> R) rethrows
    -> R
  {
    return try body(UnsafeBufferPointer(start: _array, count: count))
  }
  @inlinable
  public mutating func withUnsafeMutableBufferPointer<R>(
    _ body: (inout UnsafeMutableBufferPointer<Int32>) throws -> R
  ) rethrows -> R {
    var ump = UnsafeMutableBufferPointer(start: _array, count: count)
    return try body(&ump)
  }
}

extension MjArray: MjFloatMutableBufferPointer & MjFloatBufferPointer where Element == Float {
  @inlinable
  public func withUnsafeBufferPointer<R>(_ body: (UnsafeBufferPointer<Float>) throws -> R) rethrows
    -> R
  {
    return try body(UnsafeBufferPointer(start: _array, count: count))
  }
  @inlinable
  public mutating func withUnsafeMutableBufferPointer<R>(
    _ body: (inout UnsafeMutableBufferPointer<Float>) throws -> R
  ) rethrows -> R {
    var ump = UnsafeMutableBufferPointer(start: _array, count: count)
    return try body(&ump)
  }
}

extension MjArray: MjDoubleMutableBufferPointer & MjDoubleBufferPointer where Element == Double {
  @inlinable
  public func withUnsafeBufferPointer<R>(_ body: (UnsafeBufferPointer<Double>) throws -> R) rethrows
    -> R
  {
    return try body(UnsafeBufferPointer(start: _array, count: count))
  }
  @inlinable
  public mutating func withUnsafeMutableBufferPointer<R>(
    _ body: (inout UnsafeMutableBufferPointer<Double>) throws -> R
  ) rethrows -> R {
    var ump = UnsafeMutableBufferPointer(start: _array, count: count)
    return try body(&ump)
  }
}

extension Array: MjUInt8MutableBufferPointer & MjUInt8BufferPointer where Element == UInt8 {
}

extension Array: MjInt32MutableBufferPointer & MjInt32BufferPointer where Element == Int32 {
}

extension Array: MjFloatMutableBufferPointer & MjFloatBufferPointer where Element == Float {
}

extension Array: MjDoubleMutableBufferPointer & MjDoubleBufferPointer where Element == Double {
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
  @usableFromInline
  var element: Element
  public let count: Int
  init(_ element: Element, count: Int) {
    self.element = element
    self.count = count
  }
  @inlinable
  public func withUnsafeBufferPointer<R>(_ body: (UnsafeBufferPointer<Double>) throws -> R) rethrows
    -> R
  {
    var local = element
    return try withUnsafeMutablePointer(to: &local) {
      return try body(
        UnsafeBufferPointer(
          start: UnsafeRawPointer($0).assumingMemoryBound(to: Double.self), count: count))
    }
  }
}
