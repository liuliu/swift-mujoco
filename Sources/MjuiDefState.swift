import C_mujoco

protocol MjuiDefStateWrappedStorage {
  var wrappedValue: Any { get set }
  var pdata: UnsafeMutableRawPointer { get }
}

final class MjuiDefStateStorage<U>: MjuiDefStateWrappedStorage {
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

final class MjuiDefStateBoolStorage: MjuiDefStateWrappedStorage {
  var wrappedValue: Any {
    get { _wrappedValue != 0 ? true : false }
    set { _wrappedValue = (newValue as! Bool) ? 1 : 0 }
  }
  var pdata: UnsafeMutableRawPointer {
    withUnsafeMutablePointer(to: &_wrappedValue) { UnsafeMutableRawPointer($0) }
  }
  private var _wrappedValue: Int32
  init(wrappedValue: Bool) {
    _wrappedValue = wrappedValue ? 1 : 0
  }
}

final class MjuiDefStateStringStorage: MjuiDefStateWrappedStorage {
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

/// A propertyWrapper that enables light-weight MjuiDef construction.
///
/// Usage: @MjuiDefState(.MjtItem, name:, state:, other) var property
///        and on MjUI.add(defs: [$property]). property itself will auto-updated along.
@propertyWrapper
public struct MjuiDefState<T> {
  public var wrappedValue: T {
    get { storage.wrappedValue as! T }
    set { storage.wrappedValue = newValue }
  }
  public var projectedValue: MjuiDef {
    MjuiDef(type, name: name, state: state, pdata: storage.pdata, other: other)
  }
  private var storage: MjuiDefStateWrappedStorage
  private let type: MjtItem
  private let name: String
  private let state: Int32
  private let other: String
  public init(wrappedValue: T, _ type: MjtItem, name: String, state: Int32, other: String) {
    if T.self == String.self {
      storage = MjuiDefStateStringStorage(wrappedValue: wrappedValue as! String)
    } else if T.self == Bool.self {
      storage = MjuiDefStateBoolStorage(wrappedValue: wrappedValue as! Bool)
    } else {
      storage = MjuiDefStateStorage(wrappedValue: wrappedValue)
    }
    self.type = type
    self.name = name
    self.state = state
    self.other = other
  }
}
