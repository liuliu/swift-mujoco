extension MjuiItemEdit {
  @inlinable
  public var nelem: Int32 {
    get { _itemedit.pointee.nelem }
    set { _itemedit.pointee.nelem = newValue }
  }
  @inlinable
  public var range: MjArray<(Double, Double)> {
    get {
      MjArray<(Double, Double)>(
        array: withUnsafeMutablePointer(to: &_itemedit.pointee.range.0, { $0 }), object: object,
        len: 7)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<(Double, Double)> = withUnsafeMutablePointer(
        to: &_itemedit.pointee.range.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(7))
    }
  }
}
