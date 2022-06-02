extension MjuiItemMulti {
  /// number of elements in group
  @inlinable
  public var nelem: Int32 {
    get { _itemmulti.pointee.nelem }
    set { _itemmulti.pointee.nelem = newValue }
  }
  /// element names
  @inlinable
  public var name: MjStaticStringArray {
    get {
      MjStaticStringArray(
        array: withUnsafeMutablePointer(to: &_itemmulti.pointee.name.0.0, { $0 }), object: object,
        len: 35, strlen: 40)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<CChar> = withUnsafeMutablePointer(
        to: &_itemmulti.pointee.name.0.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(35) * 40)
    }
  }
}
