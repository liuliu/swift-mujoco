import C_mujoco

// I am pretty certain this cannot be created manually, hence, it is a struct.
public struct MjuiItem {
  @usableFromInline
  var object: AnyObject
  @usableFromInline
  var _item: UnsafeMutablePointer<mjuiItem_>
  @usableFromInline
  init(object: AnyObject, item: UnsafeMutablePointer<mjuiItem_>) {
    self.object = object
    _item = item
  }
}

extension MjuiItem {
  @inlinable
  public var single: MjuiItemSingle {
    get {
      MjuiItemSingle(
        object: object, itemsingle: withUnsafeMutablePointer(to: &_item.pointee.single) { $0 })
    }
    set {
      let unsafeMutablePointer = withUnsafeMutablePointer(to: &_item.pointee.single) { $0 }
      guard unsafeMutablePointer != newValue._itemsingle else { return }
      unsafeMutablePointer.assign(from: newValue._itemsingle, count: 1)
    }
  }
  @inlinable
  public var multi: MjuiItemMulti {
    get {
      MjuiItemMulti(
        object: object, itemmulti: withUnsafeMutablePointer(to: &_item.pointee.multi) { $0 })
    }
    set {
      let unsafeMutablePointer = withUnsafeMutablePointer(to: &_item.pointee.multi) { $0 }
      guard unsafeMutablePointer != newValue._itemmulti else { return }
      unsafeMutablePointer.assign(from: newValue._itemmulti, count: 1)
    }
  }
  @inlinable
  public var slider: MjuiItemSlider {
    get {
      MjuiItemSlider(
        object: object, itemslider: withUnsafeMutablePointer(to: &_item.pointee.slider) { $0 })
    }
    set {
      let unsafeMutablePointer = withUnsafeMutablePointer(to: &_item.pointee.slider) { $0 }
      guard unsafeMutablePointer != newValue._itemslider else { return }
      unsafeMutablePointer.assign(from: newValue._itemslider, count: 1)
    }
  }
  @inlinable
  public var edit: MjuiItemEdit {
    get {
      MjuiItemEdit(
        object: object, itemedit: withUnsafeMutablePointer(to: &_item.pointee.edit) { $0 })
    }
    set {
      let unsafeMutablePointer = withUnsafeMutablePointer(to: &_item.pointee.edit) { $0 }
      guard unsafeMutablePointer != newValue._itemedit else { return }
      unsafeMutablePointer.assign(from: newValue._itemedit, count: 1)
    }
  }
}
