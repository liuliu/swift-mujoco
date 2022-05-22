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
