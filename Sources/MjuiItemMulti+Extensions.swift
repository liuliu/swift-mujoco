extension MjuiItemMulti {
  @inlinable
  public var nelem: Int32 {
    get { _itemmulti.nelem }
    set { _itemmulti.nelem = newValue }
  }
  @inlinable
  public var name: MjStaticStringArray {
    get {
      MjStaticStringArray(
        array: withUnsafeMutablePointer(to: &_itemmulti.name.0.0, { $0 }), object: self, len: 35,
        strlen: 40)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<CChar> = withUnsafeMutablePointer(
        to: &_itemmulti.name.0.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(35) * 40)
    }
  }
}
