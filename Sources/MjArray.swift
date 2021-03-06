import C_mujoco

@usableFromInline
final class Wrapped<T> {
  @usableFromInline
  var value: T
  @usableFromInline
  init(_ value: T) {
    self.value = value
  }
}

// The difference of this v.s. using UnsafeMutableBufferPointer is that MjArray will hold a
// reference to the owner of that piece of memory, therefore, making sure the access is safe even
// though underlying it is backed by UnsafeMutablePointer.
public struct MjArray<Element> {
  @usableFromInline
  var object: AnyObject  // Make sure the array is valid.
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
  public init(_ array: [Element]) {
    precondition(array.count > 0)
    let wrapped = Wrapped(array)
    object = wrapped
    _array = wrapped.value.withUnsafeMutableBufferPointer { $0.baseAddress! }
    len = Int32(array.count)
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
  public subscript(bounds: Range<Int>) -> Self {
    get {
      precondition(bounds.lowerBound >= 0 && bounds.lowerBound < Int(len))
      precondition(bounds.upperBound >= 0 && bounds.upperBound <= Int(len))
      precondition(bounds.lowerBound < bounds.upperBound)
      return Self(
        array: _array + bounds.lowerBound, object: object,
        len: Int32(bounds.upperBound - bounds.lowerBound))
    }
    set {
      precondition(bounds.lowerBound >= 0 && bounds.lowerBound < Int(len))
      precondition(bounds.upperBound >= 0 && bounds.upperBound <= Int(len))
      precondition(bounds.lowerBound < bounds.upperBound)
      precondition(bounds.upperBound - bounds.lowerBound == Int(newValue.len))
      (_array + bounds.lowerBound).assign(
        from: newValue._array, count: bounds.upperBound - bounds.lowerBound)
    }
  }
  @inlinable
  public subscript(bounds: ClosedRange<Int>) -> Self {
    get {
      return self[bounds.lowerBound..<(bounds.upperBound + 1)]
    }
    set {
      self[bounds.lowerBound..<(bounds.upperBound + 1)] = newValue
    }
  }
  @inlinable
  public subscript(bounds: PartialRangeUpTo<Int>) -> Self {
    get {
      return self[0..<bounds.upperBound]
    }
    set {
      self[0..<bounds.upperBound] = newValue
    }
  }
  @inlinable
  public subscript(bounds: PartialRangeThrough<Int>) -> Self {
    get {
      return self[0..<(bounds.upperBound + 1)]
    }
    set {
      self[0..<(bounds.upperBound + 1)] = newValue
    }
  }
  @inlinable
  public subscript(bounds: PartialRangeFrom<Int>) -> Self {
    get {
      return self[bounds.lowerBound..<Int(len)]
    }
    set {
      self[bounds.lowerBound..<Int(len)] = newValue
    }
  }
  @inlinable
  public subscript(x: (UnboundedRange_) -> Void) -> Self {
    get {
      return self
    }
    set {
      precondition(len == newValue.len)
      _array.assign(from: newValue._array, count: Int(len))
    }
  }
  @inlinable
  public var count: Int { Int(len) }
  @inlinable
  public static func + (lhs: Self, rhs: Int) -> UnsafeMutablePointer<Element> {
    return lhs._array + rhs
  }
  @inlinable
  public static func + (lhs: Int, rhs: Self) -> UnsafeMutablePointer<Element> {
    return lhs + rhs._array
  }
}

extension MjArray: ExpressibleByArrayLiteral {
  @inlinable
  public init(arrayLiteral elements: Element...) {
    self.init(elements)
  }
}

public struct Mj2DArray<Element> {
  private var object: AnyObject  // Make sure the array is valid.
  @usableFromInline
  var len: (Int32, Int32)
  @usableFromInline
  var _array: UnsafeMutablePointer<Element>
  @usableFromInline
  init(array: UnsafeMutablePointer<Element>, object: AnyObject, len: (Int32, Int32)) {
    _array = array
    self.object = object
    self.len = len
  }
  @inlinable
  public subscript(x: Int, y: Int) -> Element {
    get {
      precondition(x < len.0 && y < len.1)
      return _array[x * Int(len.1) + y]
    }
    set {
      precondition(x < len.0 && y < len.1)
      _array[x * Int(len.1) + y] = newValue
    }
  }
  @inlinable
  public var count: (Int, Int) { (Int(len.0), Int(len.1)) }
}

extension MjArray where Element == Double {
  /// Zero out the array.
  @inlinable
  public mutating func zero() {
    mju_zero(_array, len)
  }
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
        let pos = (_array + index * Int(strlen))
        let count = min($0.count, Int(strlen) - 1)  // This will be wrong for UTF8, especially emojis.
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
