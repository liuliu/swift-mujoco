import C_mujoco

/// entire UI
///
/// This structure defines the entire UI.
public struct MjUI {
  @usableFromInline
  let _storage = Storage()
  @inlinable
  var _ui: UnsafeMutablePointer<mjUI_> { _storage._ui }

  public init() {}

  @usableFromInline
  final class Storage {
    @usableFromInline
    let _ui: UnsafeMutablePointer<mjUI_>
    init() {
      _ui = UnsafeMutablePointer.allocate(capacity: 1)
    }
    deinit {
      if let userdata = _ui.pointee.userdata {
        Unmanaged<WrappedPredicate>.fromOpaque(userdata).release()
      }
      _ui.deallocate()
    }
  }
}

extension MjUI {
  public static let maxUISect = mjMAXUISECT
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
  /// preallocated array of sections
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
  ///  pointer to changed edit in last mjui_event
  @inlinable
  public var editchanged: MjuiItem? {
    let unsafeMutablePointer: UnsafeMutablePointer<mjuiItem_>? = _ui.pointee.editchanged
    return unsafeMutablePointer.flatMap { MjuiItem($0, object: _storage) }
  }
  ///  Add definitions to UI.
  @inlinable
  public func add(defs: [MjuiDef]) {
    var _defs = defs
    _defs.append(MjuiDef(.end, name: "", state: 0, pdata: nil, other: ""))
    _defs.withUnsafeBufferPointer {
      mjui_add(
        self._ui, $0.baseAddress?.withMemoryRebound(to: mjuiDef.self, capacity: $0.count) { $0 })
    }
  }
  ///  Add definitions to UI section.
  @inlinable
  public func addToSection(sect: Int32, defs: [MjuiDef]) {
    var _defs = defs
    _defs.append(MjuiDef(.end, name: "", state: 0, pdata: nil, other: ""))
    _defs.withUnsafeBufferPointer {
      mjui_addToSection(
        self._ui, sect,
        $0.baseAddress?.withMemoryRebound(to: mjuiDef.self, capacity: $0.count) { $0 })
    }
  }

  @usableFromInline
  final class WrappedPredicate {
    @usableFromInline
    let predicate: (Int32) -> Bool
    @usableFromInline
    init(predicate: @escaping (Int32) -> Bool) {
      self.predicate = predicate
    }
  }

  /// callback to set item state programmatically
  @inlinable
  public var predicate: ((Int32) -> Bool)? {
    get {
      _ui.pointee.userdata.map {
        Unmanaged<WrappedPredicate>.fromOpaque($0).takeUnretainedValue().predicate
      }
    }
    set {
      guard let newValue = newValue else {
        if let userdata = _ui.pointee.userdata {
          Unmanaged<WrappedPredicate>.fromOpaque(userdata).release()
        }
        _ui.pointee.predicate = nil
        _ui.pointee.userdata = nil
        return
      }
      _ui.pointee.predicate = { cat, userdata in
        guard let userdata = userdata else { return 1 }
        return Unmanaged<WrappedPredicate>.fromOpaque(userdata).takeUnretainedValue().predicate(cat)
          ? 1 : 0
      }
      if let userdata = _ui.pointee.userdata {
        _ui.pointee.userdata = Unmanaged.passRetained(WrappedPredicate(predicate: newValue))
          .toOpaque()
        // Release after retained. In case we assign the same block again and again, this will still be correct.
        Unmanaged<WrappedPredicate>.fromOpaque(userdata).release()
      } else {  // no userdata, just retain it.
        _ui.pointee.userdata = Unmanaged.passRetained(WrappedPredicate(predicate: newValue))
          .toOpaque()
      }

    }
  }
  ///  Handle UI event, return pointer to changed item, NULL if no change.
  @inlinable
  public mutating func event(state: inout MjuiState, context: MjrContext) -> MjuiItem? {
    return mjui_event(self._ui, &state._state, context._context).map {
      MjuiItem($0, object: _storage)
    }
  }
}
