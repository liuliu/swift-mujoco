extension MjOption {
  /// timestep
  @inlinable
  public var timestep: Double {
    get { _option.timestep }
    set { _option.timestep = newValue }
  }
  /// update rate for remote API (Hz)
  @inlinable
  public var apirate: Double {
    get { _option.apirate }
    set { _option.apirate = newValue }
  }
  /// ratio of friction-to-normal contact impedance
  @inlinable
  public var impratio: Double {
    get { _option.impratio }
    set { _option.impratio = newValue }
  }
  /// main solver tolerance
  @inlinable
  public var tolerance: Double {
    get { _option.tolerance }
    set { _option.tolerance = newValue }
  }
  /// noslip solver tolerance
  @inlinable
  public var noslipTolerance: Double {
    get { _option.noslip_tolerance }
    set { _option.noslip_tolerance = newValue }
  }
  /// MPR solver tolerance
  @inlinable
  public var mprTolerance: Double {
    get { _option.mpr_tolerance }
    set { _option.mpr_tolerance = newValue }
  }
  /// gravitational acceleration
  @inlinable
  public var gravity: (Double, Double, Double) {
    get { _option.gravity }
    set { _option.gravity = newValue }
  }
  /// wind (for lift, drag and viscosity)
  @inlinable
  public var wind: (Double, Double, Double) {
    get { _option.wind }
    set { _option.wind = newValue }
  }
  /// global magnetic flux
  @inlinable
  public var magnetic: (Double, Double, Double) {
    get { _option.magnetic }
    set { _option.magnetic = newValue }
  }
  /// density of medium
  @inlinable
  public var density: Double {
    get { _option.density }
    set { _option.density = newValue }
  }
  /// viscosity of medium
  @inlinable
  public var viscosity: Double {
    get { _option.viscosity }
    set { _option.viscosity = newValue }
  }
  /// margin
  @inlinable
  public var oMargin: Double {
    get { _option.o_margin }
    set { _option.o_margin = newValue }
  }
  /// solref
  @inlinable
  public var oSolref: (Double, Double) {
    get { _option.o_solref }
    set { _option.o_solref = newValue }
  }
  /// solimp
  @inlinable
  public var oSolimp: (Double, Double, Double, Double, Double) {
    get { _option.o_solimp }
    set { _option.o_solimp = newValue }
  }
  /// integration mode (mjtIntegrator)
  @inlinable
  public var integrator: MjtIntegrator {
    get { MjtIntegrator(rawValue: _option.integrator)! }
    set { _option.integrator = newValue.rawValue }
  }
  /// collision mode (mjtCollision)
  @inlinable
  public var collision: MjtCollision {
    get { MjtCollision(rawValue: _option.collision)! }
    set { _option.collision = newValue.rawValue }
  }
  /// type of friction cone (mjtCone)
  @inlinable
  public var cone: MjtCone {
    get { MjtCone(rawValue: _option.cone)! }
    set { _option.cone = newValue.rawValue }
  }
  /// type of Jacobian (mjtJacobian)
  @inlinable
  public var jacobian: MjtJacobian {
    get { MjtJacobian(rawValue: _option.jacobian)! }
    set { _option.jacobian = newValue.rawValue }
  }
  /// solver algorithm (mjtSolver)
  @inlinable
  public var solver: MjtSolver {
    get { MjtSolver(rawValue: _option.solver)! }
    set { _option.solver = newValue.rawValue }
  }
  /// maximum number of main solver iterations
  @inlinable
  public var iterations: Int32 {
    get { _option.iterations }
    set { _option.iterations = newValue }
  }
  /// maximum number of noslip solver iterations
  @inlinable
  public var noslipIterations: Int32 {
    get { _option.noslip_iterations }
    set { _option.noslip_iterations = newValue }
  }
  /// maximum number of MPR solver iterations
  @inlinable
  public var mprIterations: Int32 {
    get { _option.mpr_iterations }
    set { _option.mpr_iterations = newValue }
  }
  /// bit flags for disabling standard features (mjtDisableBit)
  @inlinable
  public var disableflags: MjtDisableBit {
    get { MjtDisableBit(rawValue: _option.disableflags) }
    set { _option.disableflags = newValue.rawValue }
  }
  /// bit flags for enabling optional features (mjtEnableBit)
  @inlinable
  public var enableflags: MjtEnableBit {
    get { MjtEnableBit(rawValue: _option.enableflags) }
    set { _option.enableflags = newValue.rawValue }
  }
}
extension MjOption: CustomReflectable {
  public var customMirror: Mirror {
    Mirror(
      self,
      children: [
        "timestep": timestep, "apirate": apirate, "impratio": impratio, "tolerance": tolerance,
        "noslipTolerance": noslipTolerance, "mprTolerance": mprTolerance, "gravity": gravity,
        "wind": wind, "magnetic": magnetic, "density": density, "viscosity": viscosity,
        "oMargin": oMargin, "oSolref": oSolref, "oSolimp": oSolimp, "integrator": integrator,
        "collision": collision, "cone": cone, "jacobian": jacobian, "solver": solver,
        "iterations": iterations, "noslipIterations": noslipIterations,
        "mprIterations": mprIterations, "disableflags": disableflags, "enableflags": enableflags,
      ])
  }
}
