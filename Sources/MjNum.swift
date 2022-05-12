
public struct MjNumArray {
  private var object: AnyObject // Make sure the array is valid.
  @usableFromInline
  var len: Int32
  @usableFromInline
  var _array: UnsafeMutablePointer<Double>
  @usableFromInline
  init(array: UnsafeMutablePointer<Double>, object: AnyObject, len: Int32) {
    _array = array
    self.object = object
    self.len = len
  }
  @inlinable
  public subscript(index: Int) -> Double {
    get {
      precondition(index < len)
      return _array[index]
    }
    set {
      precondition(index < len)
      _array[index] = newValue
    }
  }
}
