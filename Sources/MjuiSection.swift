import C_mujoco

/// UI section
///
/// This structure defines one section of the UI.
public struct MjuiSection {
  @usableFromInline
  var object: AnyObject
  @usableFromInline
  var _section: UnsafeMutablePointer<mjuiSection_>
  @usableFromInline
  init(object: AnyObject, section: UnsafeMutablePointer<mjuiSection_>) {
    self.object = object
    _section = section
  }
}

extension MjuiSection {
  public static let maxUIItem = mjMAXUIITEM
}

public struct MjuiItemArray {
  @usableFromInline
  var object: AnyObject  // Make sure the array is valid.
  @usableFromInline
  var len: Int32
  @usableFromInline
  var _array: UnsafeMutablePointer<mjuiItem_>
  @usableFromInline
  init(array: UnsafeMutablePointer<mjuiItem_>, object: AnyObject, len: Int32) {
    _array = array
    self.object = object
    self.len = len
  }
  @inlinable
  public subscript(index: Int) -> MjuiItem {
    get {
      precondition(index < len)
      return MjuiItem(_array + index, object: object)
    }
    set {
      precondition(index < len)
      guard _array + index != newValue._item else { return }
      (_array + index).assign(from: newValue._item, count: 1)
    }
  }
  @inlinable
  public var count: Int { Int(len) }
}

extension MjuiSection {
  /// preallocated array of items
  @inlinable
  public var item: MjuiItemArray {
    get {
      MjuiItemArray(
        array: withUnsafeMutablePointer(to: &_section.pointee.item) {
          UnsafeMutableRawPointer($0).assumingMemoryBound(to: mjuiItem_.self)
        }, object: object,
        len: _section.pointee.nitem)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<mjuiItem_> = withUnsafeMutablePointer(
        to: &_section.pointee.item
      ) { UnsafeMutableRawPointer($0).assumingMemoryBound(to: mjuiItem_.self) }
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(_section.pointee.nitem))
    }
  }
}
