import C_mujoco

public struct MjUI {
  @usableFromInline
  let _storage = Storage()
  @inlinable
  var _ui: UnsafeMutablePointer<mjUI_> { _storage._ui }

  @usableFromInline
  final class Storage {
    @usableFromInline
    let _ui: UnsafeMutablePointer<mjUI_>
    init() {
      _ui = UnsafeMutablePointer.allocate(capacity: 1)
    }
    deinit {
      _ui.deallocate()
    }
  }
}

public struct MjuiSectionArray {
  @usableFromInline
  var object: AnyObject  // Make sure the array is valid.
  @usableFromInline
  var len: Int32
  @usableFromInline
  var _array: UnsafeMutablePointer<mjuiSection_>
  @usableFromInline
  init(array: UnsafeMutablePointer<mjuiSection_>, object: AnyObject, len: Int32) {
    _array = array
    self.object = object
    self.len = len
  }
  @inlinable
  public subscript(index: Int) -> MjuiSection {
    get {
      precondition(index < len)
      return MjuiSection(object: object, section: _array + index)
    }
    set {
      precondition(index < len)
      guard _array + index != newValue._section else { return }
      (_array + index).assign(from: newValue._section, count: 1)
    }
  }
  @inlinable
  public var count: Int { Int(len) }
}

extension MjUI {
  @inlinable
  public var sect: MjuiSectionArray {
    get {
      MjuiSectionArray(
        array: withUnsafeMutablePointer(to: &_ui.pointee.sect.0) { $0 }, object: _storage,
        len: _ui.pointee.nsect)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<mjuiSection_> = withUnsafeMutablePointer(
        to: &_ui.pointee.sect.0
      ) { $0 }
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(_ui.pointee.nsect))
    }
  }
  @inlinable
  public var editchanged: MjuiItem? {
    let unsafeMutablePointer: UnsafeMutablePointer<mjuiItem_>? = _ui.pointee.editchanged
    return unsafeMutablePointer.flatMap { MjuiItem($0, object: _storage) }
  }
}
