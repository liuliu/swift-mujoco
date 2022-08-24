extension MjvFigure {
  /// show legend
  @inlinable
  public var flgLegend: Int32 {
    get { _figure.pointee.flg_legend }
    set { _figure.pointee.flg_legend = newValue }
  }
  /// show grid tick labels (x,y)
  @inlinable
  public var flgTicklabel: (Int32, Int32) {
    get { _figure.pointee.flg_ticklabel }
    set { _figure.pointee.flg_ticklabel = newValue }
  }
  /// automatically extend axis ranges to fit data
  @inlinable
  public var flgExtend: Int32 {
    get { _figure.pointee.flg_extend }
    set { _figure.pointee.flg_extend = newValue }
  }
  /// isolated line segments (i.e. GL_LINES)
  @inlinable
  public var flgBarplot: Int32 {
    get { _figure.pointee.flg_barplot }
    set { _figure.pointee.flg_barplot = newValue }
  }
  /// vertical selection line
  @inlinable
  public var flgSelection: Int32 {
    get { _figure.pointee.flg_selection }
    set { _figure.pointee.flg_selection = newValue }
  }
  /// symmetric y-axis
  @inlinable
  public var flgSymmetric: Int32 {
    get { _figure.pointee.flg_symmetric }
    set { _figure.pointee.flg_symmetric = newValue }
  }
  /// line width
  @inlinable
  public var linewidth: Float {
    get { _figure.pointee.linewidth }
    set { _figure.pointee.linewidth = newValue }
  }
  /// grid line width
  @inlinable
  public var gridwidth: Float {
    get { _figure.pointee.gridwidth }
    set { _figure.pointee.gridwidth = newValue }
  }
  /// number of grid points in (x,y)
  @inlinable
  public var gridsize: (Int32, Int32) {
    get { _figure.pointee.gridsize }
    set { _figure.pointee.gridsize = newValue }
  }
  /// grid line rgb
  @inlinable
  public var gridrgb: (Float, Float, Float) {
    get { _figure.pointee.gridrgb }
    set { _figure.pointee.gridrgb = newValue }
  }
  /// figure color and alpha
  @inlinable
  public var figurergba: (Float, Float, Float, Float) {
    get { _figure.pointee.figurergba }
    set { _figure.pointee.figurergba = newValue }
  }
  /// pane color and alpha
  @inlinable
  public var panergba: (Float, Float, Float, Float) {
    get { _figure.pointee.panergba }
    set { _figure.pointee.panergba = newValue }
  }
  /// legend color and alpha
  @inlinable
  public var legendrgba: (Float, Float, Float, Float) {
    get { _figure.pointee.legendrgba }
    set { _figure.pointee.legendrgba = newValue }
  }
  /// text color
  @inlinable
  public var textrgb: (Float, Float, Float) {
    get { _figure.pointee.textrgb }
    set { _figure.pointee.textrgb = newValue }
  }
  /// line colors
  @inlinable
  public var linergb: MjArray<(Float, Float, Float)> {
    get {
      MjArray<(Float, Float, Float)>(
        array: withUnsafeMutablePointer(
          to: &_figure.pointee.linergb,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: (Float, Float, Float).self) }),
        object: _storage, len: 100)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<(Float, Float, Float)> =
        withUnsafeMutablePointer(
          to: &_figure.pointee.linergb,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: (Float, Float, Float).self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(100))
    }
  }
  /// axis ranges; (min>=max) automatic
  @inlinable
  public var range: MjArray<(Float, Float)> {
    get {
      MjArray<(Float, Float)>(
        array: withUnsafeMutablePointer(
          to: &_figure.pointee.range,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: (Float, Float).self) }),
        object: _storage, len: 2)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<(Float, Float)> = withUnsafeMutablePointer(
        to: &_figure.pointee.range,
        { UnsafeMutableRawPointer($0).assumingMemoryBound(to: (Float, Float).self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(2))
    }
  }
  /// x-tick label format for sprintf
  @inlinable
  public var xformat: String {
    get {
      var value = _figure.pointee.xformat
      return withUnsafePointer(to: &value) {
        String(cString: UnsafeRawPointer($0).assumingMemoryBound(to: CChar.self), encoding: .utf8)!
      }
    }
    set {
      var value = newValue
      value.withUTF8 { utf8 in
        let count = min(utf8.count, 19)
        withUnsafeMutablePointer(to: &_figure.pointee.xformat) {
          let pos = UnsafeMutableRawPointer($0).assumingMemoryBound(to: CChar.self)
          utf8.baseAddress?.withMemoryRebound(to: CChar.self, capacity: count) {
            pos.assign(from: $0, count: count)
          }
          pos[count] = 0
        }
      }
    }
  }
  /// y-tick label format for sprintf
  @inlinable
  public var yformat: String {
    get {
      var value = _figure.pointee.yformat
      return withUnsafePointer(to: &value) {
        String(cString: UnsafeRawPointer($0).assumingMemoryBound(to: CChar.self), encoding: .utf8)!
      }
    }
    set {
      var value = newValue
      value.withUTF8 { utf8 in
        let count = min(utf8.count, 19)
        withUnsafeMutablePointer(to: &_figure.pointee.yformat) {
          let pos = UnsafeMutableRawPointer($0).assumingMemoryBound(to: CChar.self)
          utf8.baseAddress?.withMemoryRebound(to: CChar.self, capacity: count) {
            pos.assign(from: $0, count: count)
          }
          pos[count] = 0
        }
      }
    }
  }
  /// string used to determine min y-tick width
  @inlinable
  public var minwidth: String {
    get {
      var value = _figure.pointee.minwidth
      return withUnsafePointer(to: &value) {
        String(cString: UnsafeRawPointer($0).assumingMemoryBound(to: CChar.self), encoding: .utf8)!
      }
    }
    set {
      var value = newValue
      value.withUTF8 { utf8 in
        let count = min(utf8.count, 19)
        withUnsafeMutablePointer(to: &_figure.pointee.minwidth) {
          let pos = UnsafeMutableRawPointer($0).assumingMemoryBound(to: CChar.self)
          utf8.baseAddress?.withMemoryRebound(to: CChar.self, capacity: count) {
            pos.assign(from: $0, count: count)
          }
          pos[count] = 0
        }
      }
    }
  }
  /// figure title; subplots separated with 2+ spaces
  @inlinable
  public var title: String {
    get {
      var value = _figure.pointee.title
      return withUnsafePointer(to: &value) {
        String(cString: UnsafeRawPointer($0).assumingMemoryBound(to: CChar.self), encoding: .utf8)!
      }
    }
    set {
      var value = newValue
      value.withUTF8 { utf8 in
        let count = min(utf8.count, 999)
        withUnsafeMutablePointer(to: &_figure.pointee.title) {
          let pos = UnsafeMutableRawPointer($0).assumingMemoryBound(to: CChar.self)
          utf8.baseAddress?.withMemoryRebound(to: CChar.self, capacity: count) {
            pos.assign(from: $0, count: count)
          }
          pos[count] = 0
        }
      }
    }
  }
  /// x-axis label
  @inlinable
  public var xlabel: String {
    get {
      var value = _figure.pointee.xlabel
      return withUnsafePointer(to: &value) {
        String(cString: UnsafeRawPointer($0).assumingMemoryBound(to: CChar.self), encoding: .utf8)!
      }
    }
    set {
      var value = newValue
      value.withUTF8 { utf8 in
        let count = min(utf8.count, 99)
        withUnsafeMutablePointer(to: &_figure.pointee.xlabel) {
          let pos = UnsafeMutableRawPointer($0).assumingMemoryBound(to: CChar.self)
          utf8.baseAddress?.withMemoryRebound(to: CChar.self, capacity: count) {
            pos.assign(from: $0, count: count)
          }
          pos[count] = 0
        }
      }
    }
  }
  /// line names for legend
  @inlinable
  public var linename: MjStaticStringArray {
    get {
      MjStaticStringArray(
        array: withUnsafeMutablePointer(
          to: &_figure.pointee.linename,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: CChar.self) }), object: _storage,
        len: 100, strlen: 100)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<CChar> = withUnsafeMutablePointer(
        to: &_figure.pointee.linename,
        { UnsafeMutableRawPointer($0).assumingMemoryBound(to: CChar.self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(100) * 100)
    }
  }
  /// number of lines to offset legend
  @inlinable
  public var legendoffset: Int32 {
    get { _figure.pointee.legendoffset }
    set { _figure.pointee.legendoffset = newValue }
  }
  /// selected subplot (for title rendering)
  @inlinable
  public var subplot: Int32 {
    get { _figure.pointee.subplot }
    set { _figure.pointee.subplot = newValue }
  }
  /// if point is in legend rect, highlight line
  @inlinable
  public var highlight: (Int32, Int32) {
    get { _figure.pointee.highlight }
    set { _figure.pointee.highlight = newValue }
  }
  /// if id>=0 and no point, highlight id
  @inlinable
  public var highlightid: Int32 {
    get { _figure.pointee.highlightid }
    set { _figure.pointee.highlightid = newValue }
  }
  /// selection line x-value
  @inlinable
  public var selection: Float {
    get { _figure.pointee.selection }
    set { _figure.pointee.selection = newValue }
  }
  /// number of points in line; (0) disable
  @inlinable
  public var linepnt: MjArray<Int32> {
    get {
      MjArray<Int32>(
        array: withUnsafeMutablePointer(
          to: &_figure.pointee.linepnt,
          { UnsafeMutableRawPointer($0).assumingMemoryBound(to: Int32.self) }), object: _storage,
        len: 100)
    }
    set {
      let unsafeMutablePointer: UnsafeMutablePointer<Int32> = withUnsafeMutablePointer(
        to: &_figure.pointee.linepnt,
        { UnsafeMutableRawPointer($0).assumingMemoryBound(to: Int32.self) })
      guard unsafeMutablePointer != newValue._array else { return }
      unsafeMutablePointer.assign(from: newValue._array, count: Int(100))
    }
  }
  /// range of x-axis in pixels
  @inlinable
  public var xaxispixel: (Int32, Int32) {
    get { _figure.pointee.xaxispixel }
    set { _figure.pointee.xaxispixel = newValue }
  }
  /// range of y-axis in pixels
  @inlinable
  public var yaxispixel: (Int32, Int32) {
    get { _figure.pointee.yaxispixel }
    set { _figure.pointee.yaxispixel = newValue }
  }
  /// range of x-axis in data units
  @inlinable
  public var xaxisdata: (Float, Float) {
    get { _figure.pointee.xaxisdata }
    set { _figure.pointee.xaxisdata = newValue }
  }
  /// range of y-axis in data units
  @inlinable
  public var yaxisdata: (Float, Float) {
    get { _figure.pointee.yaxisdata }
    set { _figure.pointee.yaxisdata = newValue }
  }
}
extension MjvFigure: CustomReflectable {
  public var customMirror: Mirror {
    Mirror(
      self,
      children: [
        "flgLegend": flgLegend, "flgTicklabel": flgTicklabel, "flgExtend": flgExtend,
        "flgBarplot": flgBarplot, "flgSelection": flgSelection, "flgSymmetric": flgSymmetric,
        "linewidth": linewidth, "gridwidth": gridwidth, "gridsize": gridsize, "gridrgb": gridrgb,
        "figurergba": figurergba, "panergba": panergba, "legendrgba": legendrgba,
        "textrgb": textrgb, "linergb": linergb, "range": range, "xformat": xformat,
        "yformat": yformat, "minwidth": minwidth, "title": title, "xlabel": xlabel,
        "linename": linename, "legendoffset": legendoffset, "subplot": subplot,
        "highlight": highlight, "highlightid": highlightid, "selection": selection,
        "linepnt": linepnt, "xaxispixel": xaxispixel, "yaxispixel": yaxispixel,
        "xaxisdata": xaxisdata, "yaxisdata": yaxisdata,
      ])
  }
}
