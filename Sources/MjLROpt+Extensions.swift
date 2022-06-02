extension MjLROpt {
  /// which actuators to process (mjtLRMode)
  @inlinable
  public var mode: MjtLRMode {
    get { MjtLRMode(rawValue: _lropt.mode)! }
    set { _lropt.mode = newValue.rawValue }
  }
  /// use existing length range if available
  @inlinable
  public var useexisting: Int32 {
    get { _lropt.useexisting }
    set { _lropt.useexisting = newValue }
  }
  /// use joint and tendon limits if available
  @inlinable
  public var uselimit: Int32 {
    get { _lropt.uselimit }
    set { _lropt.uselimit = newValue }
  }
  /// target acceleration used to compute force
  @inlinable
  public var accel: Double {
    get { _lropt.accel }
    set { _lropt.accel = newValue }
  }
  /// maximum force; 0: no limit
  @inlinable
  public var maxforce: Double {
    get { _lropt.maxforce }
    set { _lropt.maxforce = newValue }
  }
  /// time constant for velocity reduction; min 0.01
  @inlinable
  public var timeconst: Double {
    get { _lropt.timeconst }
    set { _lropt.timeconst = newValue }
  }
  /// simulation timestep; 0: use mjOption.timestep
  @inlinable
  public var timestep: Double {
    get { _lropt.timestep }
    set { _lropt.timestep = newValue }
  }
  /// total simulation time interval
  @inlinable
  public var inttotal: Double {
    get { _lropt.inttotal }
    set { _lropt.inttotal = newValue }
  }
  /// evaluation time interval (at the end)
  @inlinable
  public var inteval: Double {
    get { _lropt.inteval }
    set { _lropt.inteval = newValue }
  }
  /// convergence tolerance (relative to range)
  @inlinable
  public var tolrange: Double {
    get { _lropt.tolrange }
    set { _lropt.tolrange = newValue }
  }
}
