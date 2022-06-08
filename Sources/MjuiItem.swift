import CShim_mujoco
import C_mujoco

/// UI item
///
/// This structure defines one UI item.
public struct MjuiItem {
  @usableFromInline
  var object: AnyObject
  @usableFromInline
  var _item: UnsafeMutablePointer<mjuiItem_>
  @usableFromInline
  init(_ item: UnsafeMutablePointer<mjuiItem_>, object: AnyObject) {
    self.object = object
    _item = item
  }
}

extension MjuiItem {
  public static let maxUIMulti = mjMAXUIMULTI
  public static let maxUIEdit = mjMAXUIEDIT
}

extension MjuiItem {
  /// check and button
  @inlinable
  public var single: MjuiItemSingle {
    get {
      MjuiItemSingle(
        object: object,
        itemsingle: (UnsafeMutableRawPointer(_item) + Int(offsetAnonymousUnionOfMjuiItem()))
          .assumingMemoryBound(to: mjuiItemSingle_.self))
    }
    set {
      let unsafeMutablePointer =
        (UnsafeMutableRawPointer(_item) + Int(offsetAnonymousUnionOfMjuiItem()))
        .assumingMemoryBound(to: mjuiItemSingle_.self)
      guard unsafeMutablePointer != newValue._itemsingle else { return }
      unsafeMutablePointer.assign(from: newValue._itemsingle, count: 1)
    }
  }
  /// static, radio and select
  @inlinable
  public var multi: MjuiItemMulti {
    get {
      MjuiItemMulti(
        object: object,
        itemmulti: (UnsafeMutableRawPointer(_item) + Int(offsetAnonymousUnionOfMjuiItem()))
          .assumingMemoryBound(
            to: mjuiItemMulti_.self))
    }
    set {
      let unsafeMutablePointer =
        (UnsafeMutableRawPointer(_item) + Int(offsetAnonymousUnionOfMjuiItem()))
        .assumingMemoryBound(to: mjuiItemMulti_.self)
      guard unsafeMutablePointer != newValue._itemmulti else { return }
      unsafeMutablePointer.assign(from: newValue._itemmulti, count: 1)
    }
  }
  /// slider
  @inlinable
  public var slider: MjuiItemSlider {
    get {
      MjuiItemSlider(
        object: object,
        itemslider: (UnsafeMutableRawPointer(_item) + Int(offsetAnonymousUnionOfMjuiItem()))
          .assumingMemoryBound(to: mjuiItemSlider_.self))
    }
    set {
      let unsafeMutablePointer =
        (UnsafeMutableRawPointer(_item) + Int(offsetAnonymousUnionOfMjuiItem()))
        .assumingMemoryBound(to: mjuiItemSlider_.self)
      guard unsafeMutablePointer != newValue._itemslider else { return }
      unsafeMutablePointer.assign(from: newValue._itemslider, count: 1)
    }
  }
  /// edit
  @inlinable
  public var edit: MjuiItemEdit {
    get {
      MjuiItemEdit(
        object: object,
        itemedit: (UnsafeMutableRawPointer(_item) + Int(offsetAnonymousUnionOfMjuiItem()))
          .assumingMemoryBound(
            to: mjuiItemEdit_.self))
    }
    set {
      let unsafeMutablePointer =
        (UnsafeMutableRawPointer(_item) + Int(offsetAnonymousUnionOfMjuiItem()))
        .assumingMemoryBound(to: mjuiItemEdit_.self)
      guard unsafeMutablePointer != newValue._itemedit else { return }
      unsafeMutablePointer.assign(from: newValue._itemedit, count: 1)
    }
  }
  /// data pointer (type-specific)
  @inlinable
  public var pdata: UnsafeMutableRawPointer? {
    get { _item.pointee.pdata }
    set { _item.pointee.pdata = newValue }
  }
}
