import C_mujoco

protocol MjuiItemStateWrappedStorage {
  var wrappedValue: Any { get set }
  var pdata: UnsafeMutableRawPointer { get }
}

final class MjuiItemStateStorage<U>: MjuiItemStateWrappedStorage {
  var wrappedValue: Any {
    get { _wrappedValue }
    set { _wrappedValue = newValue as! U }
  }
  var pdata: UnsafeMutableRawPointer {
    withUnsafeMutablePointer(to: &_wrappedValue) { UnsafeMutableRawPointer($0) }
  }
  private var _wrappedValue: U
  init(wrappedValue: U) {
    _wrappedValue = wrappedValue
  }
}

final class MjuiItemStateStringStorage: MjuiItemStateWrappedStorage {
  var wrappedValue: Any {
    get { _wrappedValue }
    set { _wrappedValue = newValue as! String }
  }
  var pdata: UnsafeMutableRawPointer {
    UnsafeMutableRawPointer(_array)
  }
  private var _array: UnsafeMutablePointer<CChar>
  private var _wrappedValue: String {
    get {
      return String(cString: _array)
    }
    set {
      var value = newValue
      value.withUTF8 {
        precondition($0.count < mjMAXUITEXT)
        let count = $0.count
        $0.baseAddress?.withMemoryRebound(to: CChar.self, capacity: count) {
          _array.assign(from: $0, count: count)
        }
        _array[count] = 0
      }
    }
  }
  init(wrappedValue: String) {
    _array = UnsafeMutablePointer.allocate(capacity: Int(mjMAXUITEXT))
    if !wrappedValue.isEmpty {
      _wrappedValue = wrappedValue
    } else {
      _array[0] = 0
    }
  }
  deinit {
    _array.deallocate()
  }
}

@propertyWrapper
public struct MjuiItemState<T> {
  // I can use this directly as the backing, but I can also use UnsafeMutablePointer.
  // Later is better because I can dynamically specialize for T == String case, which is difficult
  // to do at compile time.
  public var wrappedValue: T {
    get { storage.wrappedValue as! T }
    set { storage.wrappedValue = newValue }
  }
  public var projectedValue: MjuiDef {
    MjuiDef(type, name: name, state: state, pdata: storage.pdata, other: other)
  }
  private var storage: MjuiItemStateWrappedStorage
  private let type: MjtItem
  private let name: String
  private let state: Int32
  private let other: String
  public init(wrappedValue: T, _ type: MjtItem, name: String, state: Int32, other: String) {
    if T.self == String.self {
      storage = MjuiItemStateStringStorage(wrappedValue: wrappedValue as! String)
    } else {
      storage = MjuiItemStateStorage(wrappedValue: wrappedValue)
    }
    self.type = type
    self.name = name
    self.state = state
    self.other = other
  }
}
