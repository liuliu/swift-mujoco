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
        array: withUnsafeMutablePointer(
          to: &_itemmulti.pointee.name,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: CChar.self) }), object: object,
        len: 35, strlen: 40)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<CChar> = withUnsafeMutablePointer(
        to: &_itemmulti.pointee.name,
        { UnsafeMutableRawPointer($0).assumingMemoryBound(to: CChar.self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(35) * 40)
    }
  }
}
extension MjuiItemMulti: CustomReflectable {
  public var customMirror: Mirror {
    Mirror(self, children: ["nelem": nelem, "name": name])
  }
}
