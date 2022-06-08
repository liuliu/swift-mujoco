extension MjContact {
  /// distance between nearest points; neg: penetration
  @inlinable
  public var dist: Double {
    get { _contact.dist }
    set { _contact.dist = newValue }
  }
  /// position of contact point: midpoint between geoms
  @inlinable
  public var pos: (Double, Double, Double) {
    get { _contact.pos }
    set { _contact.pos = newValue }
  }
  /// normal is in [0-2]
  @inlinable
  public var frame: (Double, Double, Double, Double, Double, Double, Double, Double, Double) {
    get { _contact.frame }
    set { _contact.frame = newValue }
  }
  /// include if dist<includemargin=margin-gap
  @inlinable
  public var includemargin: Double {
    get { _contact.includemargin }
    set { _contact.includemargin = newValue }
  }
  /// tangent1, 2, spin, roll1, 2
  @inlinable
  public var friction: (Double, Double, Double, Double, Double) {
    get { _contact.friction }
    set { _contact.friction = newValue }
  }
  /// constraint solver reference
  @inlinable
  public var solref: (Double, Double) {
    get { _contact.solref }
    set { _contact.solref = newValue }
  }
  /// constraint solver impedance
  @inlinable
  public var solimp: (Double, Double, Double, Double, Double) {
    get { _contact.solimp }
    set { _contact.solimp = newValue }
  }
  /// friction of regularized cone, set by mj_makeConstraint
  @inlinable
  public var mu: Double {
    get { _contact.mu }
    set { _contact.mu = newValue }
  }
  /// cone Hessian, set by mj_updateConstraint
  @inlinable
  public var H:
    (
      Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double,
      Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double,
      Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double,
      Double, Double, Double
    )
  {
    get { _contact.H }
    set { _contact.H = newValue }
  }
  /// contact space dimensionality: 1, 3, 4 or 6
  @inlinable
  public var dim: Int32 {
    get { _contact.dim }
    set { _contact.dim = newValue }
  }
  /// id of geom 1
  @inlinable
  public var geom1: Int32 {
    get { _contact.geom1 }
    set { _contact.geom1 = newValue }
  }
  /// id of geom 2
  @inlinable
  public var geom2: Int32 {
    get { _contact.geom2 }
    set { _contact.geom2 = newValue }
  }
  /// 0: include, 1: in gap, 2: fused, 3: equality, 4: no dofs
  @inlinable
  public var exclude: Int32 {
    get { _contact.exclude }
    set { _contact.exclude = newValue }
  }
  /// address in efc; -1: not included, -2-i: distance constraint i
  @inlinable
  public var efcAddress: Int32 {
    get { _contact.efc_address }
    set { _contact.efc_address = newValue }
  }
}
extension MjContact: CustomReflectable {
  public var customMirror: Mirror {
    Mirror(
      self,
      children: [
        "dist": dist, "pos": pos, "frame": frame, "includemargin": includemargin,
        "friction": friction, "solref": solref, "solimp": solimp, "mu": mu, "H": H, "dim": dim,
        "geom1": geom1, "geom2": geom2, "exclude": exclude, "efcAddress": efcAddress,
      ])
  }
}
