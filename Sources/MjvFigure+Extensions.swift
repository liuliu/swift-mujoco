extension MjvFigure {
  @inlinable
  public var flgLegend: Int32 {
    get { _figure.pointee.flg_legend }
    set { _figure.pointee.flg_legend = newValue }
  }
  @inlinable
  public var flgTicklabel: (Int32, Int32) {
    get { _figure.pointee.flg_ticklabel }
    set { _figure.pointee.flg_ticklabel = newValue }
  }
  @inlinable
  public var flgExtend: Int32 {
    get { _figure.pointee.flg_extend }
    set { _figure.pointee.flg_extend = newValue }
  }
  @inlinable
  public var flgBarplot: Int32 {
    get { _figure.pointee.flg_barplot }
    set { _figure.pointee.flg_barplot = newValue }
  }
  @inlinable
  public var flgSelection: Int32 {
    get { _figure.pointee.flg_selection }
    set { _figure.pointee.flg_selection = newValue }
  }
  @inlinable
  public var flgSymmetric: Int32 {
    get { _figure.pointee.flg_symmetric }
    set { _figure.pointee.flg_symmetric = newValue }
  }
  @inlinable
  public var linewidth: Float {
    get { _figure.pointee.linewidth }
    set { _figure.pointee.linewidth = newValue }
  }
  @inlinable
  public var gridwidth: Float {
    get { _figure.pointee.gridwidth }
    set { _figure.pointee.gridwidth = newValue }
  }
  @inlinable
  public var gridsize: (Int32, Int32) {
    get { _figure.pointee.gridsize }
    set { _figure.pointee.gridsize = newValue }
  }
  @inlinable
  public var gridrgb: (Float, Float, Float) {
    get { _figure.pointee.gridrgb }
    set { _figure.pointee.gridrgb = newValue }
  }
  @inlinable
  public var figurergba: (Float, Float, Float, Float) {
    get { _figure.pointee.figurergba }
    set { _figure.pointee.figurergba = newValue }
  }
  @inlinable
  public var panergba: (Float, Float, Float, Float) {
    get { _figure.pointee.panergba }
    set { _figure.pointee.panergba = newValue }
  }
  @inlinable
  public var legendrgba: (Float, Float, Float, Float) {
    get { _figure.pointee.legendrgba }
    set { _figure.pointee.legendrgba = newValue }
  }
  @inlinable
  public var textrgb: (Float, Float, Float) {
    get { _figure.pointee.textrgb }
    set { _figure.pointee.textrgb = newValue }
  }
  @inlinable
  public var linergb: MjArray<(Float, Float, Float)> {
    get {
      MjArray<(Float, Float, Float)>(
        array: withUnsafeMutablePointer(to: &_figure.pointee.linergb.0, { $0 }), object: _storage,
        len: 100)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<(Float, Float, Float)> =
        withUnsafeMutablePointer(to: &_figure.pointee.linergb.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(100))
    }
  }
  @inlinable
  public var range: MjArray<(Float, Float)> {
    get {
      MjArray<(Float, Float)>(
        array: withUnsafeMutablePointer(to: &_figure.pointee.range.0, { $0 }), object: _storage,
        len: 2)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<(Float, Float)> = withUnsafeMutablePointer(
        to: &_figure.pointee.range.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(2))
    }
  }
  @inlinable
  public var xformat: String {
    get {
      var value = _figure.pointee.xformat
      return withUnsafePointer(to: &value.0) { String(cString: $0, encoding: .utf8)! }
    }
    set {
      var value = newValue
      value.withUTF8 { utf8 in
        precondition(utf8.count < 20)
        withUnsafeMutablePointer(to: &_figure.pointee.xformat.0) { pos in
          utf8.baseAddress?.withMemoryRebound(to: CChar.self, capacity: utf8.count) {
            pos.assign(from: $0, count: utf8.count)
          }
          pos[utf8.count] = 0
        }
      }
    }
  }
  @inlinable
  public var yformat: String {
    get {
      var value = _figure.pointee.yformat
      return withUnsafePointer(to: &value.0) { String(cString: $0, encoding: .utf8)! }
    }
    set {
      var value = newValue
      value.withUTF8 { utf8 in
        precondition(utf8.count < 20)
        withUnsafeMutablePointer(to: &_figure.pointee.yformat.0) { pos in
          utf8.baseAddress?.withMemoryRebound(to: CChar.self, capacity: utf8.count) {
            pos.assign(from: $0, count: utf8.count)
          }
          pos[utf8.count] = 0
        }
      }
    }
  }
  @inlinable
  public var minwidth: String {
    get {
      var value = _figure.pointee.minwidth
      return withUnsafePointer(to: &value.0) { String(cString: $0, encoding: .utf8)! }
    }
    set {
      var value = newValue
      value.withUTF8 { utf8 in
        precondition(utf8.count < 20)
        withUnsafeMutablePointer(to: &_figure.pointee.minwidth.0) { pos in
          utf8.baseAddress?.withMemoryRebound(to: CChar.self, capacity: utf8.count) {
            pos.assign(from: $0, count: utf8.count)
          }
          pos[utf8.count] = 0
        }
      }
    }
  }
  @inlinable
  public var title: String {
    get {
      var value = _figure.pointee.title
      return withUnsafePointer(to: &value.0) { String(cString: $0, encoding: .utf8)! }
    }
    set {
      var value = newValue
      value.withUTF8 { utf8 in
        precondition(utf8.count < 1000)
        withUnsafeMutablePointer(to: &_figure.pointee.title.0) { pos in
          utf8.baseAddress?.withMemoryRebound(to: CChar.self, capacity: utf8.count) {
            pos.assign(from: $0, count: utf8.count)
          }
          pos[utf8.count] = 0
        }
      }
    }
  }
  @inlinable
  public var xlabel: String {
    get {
      var value = _figure.pointee.xlabel
      return withUnsafePointer(to: &value.0) { String(cString: $0, encoding: .utf8)! }
    }
    set {
      var value = newValue
      value.withUTF8 { utf8 in
        precondition(utf8.count < 100)
        withUnsafeMutablePointer(to: &_figure.pointee.xlabel.0) { pos in
          utf8.baseAddress?.withMemoryRebound(to: CChar.self, capacity: utf8.count) {
            pos.assign(from: $0, count: utf8.count)
          }
          pos[utf8.count] = 0
        }
      }
    }
  }
  @inlinable
  public var linename: MjStaticStringArray {
    get {
      MjStaticStringArray(
        array: withUnsafeMutablePointer(to: &_figure.pointee.linename.0.0, { $0 }),
        object: _storage, len: 100, strlen: 100)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<CChar> = withUnsafeMutablePointer(
        to: &_figure.pointee.linename.0.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(100) * 100)
    }
  }
  @inlinable
  public var legendoffset: Int32 {
    get { _figure.pointee.legendoffset }
    set { _figure.pointee.legendoffset = newValue }
  }
  @inlinable
  public var subplot: Int32 {
    get { _figure.pointee.subplot }
    set { _figure.pointee.subplot = newValue }
  }
  @inlinable
  public var highlight: (Int32, Int32) {
    get { _figure.pointee.highlight }
    set { _figure.pointee.highlight = newValue }
  }
  @inlinable
  public var highlightid: Int32 {
    get { _figure.pointee.highlightid }
    set { _figure.pointee.highlightid = newValue }
  }
  @inlinable
  public var selection: Float {
    get { _figure.pointee.selection }
    set { _figure.pointee.selection = newValue }
  }
  @inlinable
  public var linepnt: MjArray<Int32> {
    get {
      MjArray<Int32>(
        array: withUnsafeMutablePointer(to: &_figure.pointee.linepnt.0, { $0 }), object: _storage,
        len: 100)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = withUnsafeMutablePointer(
        to: &_figure.pointee.linepnt.0, { $0 })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(100))
    }
  }
  @inlinable
  public var xaxispixel: (Int32, Int32) {
    get { _figure.pointee.xaxispixel }
    set { _figure.pointee.xaxispixel = newValue }
  }
  @inlinable
  public var yaxispixel: (Int32, Int32) {
    get { _figure.pointee.yaxispixel }
    set { _figure.pointee.yaxispixel = newValue }
  }
  @inlinable
  public var xaxisdata: (Float, Float) {
    get { _figure.pointee.xaxisdata }
    set { _figure.pointee.xaxisdata = newValue }
  }
  @inlinable
  public var yaxisdata: (Float, Float) {
    get { _figure.pointee.yaxisdata }
    set { _figure.pointee.yaxisdata = newValue }
  }
}
