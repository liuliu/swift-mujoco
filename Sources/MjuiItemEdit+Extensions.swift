extension MjuiItemEdit {
  /// number of elements in list
  @inlinable
  public var nelem: Int32 {
    get { _itemedit.pointee.nelem }
    set { _itemedit.pointee.nelem = newValue }
  }
  /// element range (min>=max: ignore)
  @inlinable
  public var range: MjArray<(Double, Double)> {
    get {
      MjArray<(Double, Double)>(
        array: withUnsafeMutablePointer(
          to: &_itemedit.pointee.range,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: (Double, Double).self) }),
        object: object, len: 7)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<(Double, Double)> = withUnsafeMutablePointer(
        to: &_itemedit.pointee.range,
        { UnsafeMutableRawPointer($0).assumingMemoryBound(to: (Double, Double).self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(7))
    }
  }
}
extension MjuiItemEdit: CustomReflectable {
  public var customMirror: Mirror {
    Mirror(self, children: ["nelem": nelem, "range": range])
  }
}
