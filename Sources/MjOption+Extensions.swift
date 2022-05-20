extension MjOption {
  @inlinable
  public var timestep: Double {
    get { _option.timestep }
    set { _option.timestep = newValue }
  }
  @inlinable
  public var apirate: Double {
    get { _option.apirate }
    set { _option.apirate = newValue }
  }
  @inlinable
  public var impratio: Double {
    get { _option.impratio }
    set { _option.impratio = newValue }
  }
  @inlinable
  public var tolerance: Double {
    get { _option.tolerance }
    set { _option.tolerance = newValue }
  }
  @inlinable
  public var noslipTolerance: Double {
    get { _option.noslip_tolerance }
    set { _option.noslip_tolerance = newValue }
  }
  @inlinable
  public var mprTolerance: Double {
    get { _option.mpr_tolerance }
    set { _option.mpr_tolerance = newValue }
  }
  @inlinable
  public var gravity: (Double, Double, Double) {
    get { _option.gravity }
    set { _option.gravity = newValue }
  }
  @inlinable
  public var wind: (Double, Double, Double) {
    get { _option.wind }
    set { _option.wind = newValue }
  }
  @inlinable
  public var magnetic: (Double, Double, Double) {
    get { _option.magnetic }
    set { _option.magnetic = newValue }
  }
  @inlinable
  public var density: Double {
    get { _option.density }
    set { _option.density = newValue }
  }
  @inlinable
  public var viscosity: Double {
    get { _option.viscosity }
    set { _option.viscosity = newValue }
  }
  @inlinable
  public var oMargin: Double {
    get { _option.o_margin }
    set { _option.o_margin = newValue }
  }
  @inlinable
  public var oSolref: (Double, Double) {
    get { _option.o_solref }
    set { _option.o_solref = newValue }
  }
  @inlinable
  public var oSolimp: (Double, Double, Double, Double, Double) {
    get { _option.o_solimp }
    set { _option.o_solimp = newValue }
  }
  @inlinable
  public var integrator: Int32 {
    get { _option.integrator }
    set { _option.integrator = newValue }
  }
  @inlinable
  public var collision: Int32 {
    get { _option.collision }
    set { _option.collision = newValue }
  }
  @inlinable
  public var cone: Int32 {
    get { _option.cone }
    set { _option.cone = newValue }
  }
  @inlinable
  public var jacobian: Int32 {
    get { _option.jacobian }
    set { _option.jacobian = newValue }
  }
  @inlinable
  public var solver: Int32 {
    get { _option.solver }
    set { _option.solver = newValue }
  }
  @inlinable
  public var iterations: Int32 {
    get { _option.iterations }
    set { _option.iterations = newValue }
  }
  @inlinable
  public var noslipIterations: Int32 {
    get { _option.noslip_iterations }
    set { _option.noslip_iterations = newValue }
  }
  @inlinable
  public var mprIterations: Int32 {
    get { _option.mpr_iterations }
    set { _option.mpr_iterations = newValue }
  }
  @inlinable
  public var disableflags: Int32 {
    get { _option.disableflags }
    set { _option.disableflags = newValue }
  }
  @inlinable
  public var enableflags: Int32 {
    get { _option.enableflags }
    set { _option.enableflags = newValue }
  }
}
