extension MjLROpt {
  @inlinable
  public var mode: Int32 {
    get { _lropt.mode }
    set { _lropt.mode = newValue }
  }
  @inlinable
  public var useexisting: Int32 {
    get { _lropt.useexisting }
    set { _lropt.useexisting = newValue }
  }
  @inlinable
  public var uselimit: Int32 {
    get { _lropt.uselimit }
    set { _lropt.uselimit = newValue }
  }
  @inlinable
  public var accel: Double {
    get { _lropt.accel }
    set { _lropt.accel = newValue }
  }
  @inlinable
  public var maxforce: Double {
    get { _lropt.maxforce }
    set { _lropt.maxforce = newValue }
  }
  @inlinable
  public var timeconst: Double {
    get { _lropt.timeconst }
    set { _lropt.timeconst = newValue }
  }
  @inlinable
  public var timestep: Double {
    get { _lropt.timestep }
    set { _lropt.timestep = newValue }
  }
  @inlinable
  public var inttotal: Double {
    get { _lropt.inttotal }
    set { _lropt.inttotal = newValue }
  }
  @inlinable
  public var inteval: Double {
    get { _lropt.inteval }
    set { _lropt.inteval = newValue }
  }
  @inlinable
  public var tolrange: Double {
    get { _lropt.tolrange }
    set { _lropt.tolrange = newValue }
  }
}
