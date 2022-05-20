extension MjContact {
  @inlinable
  public var dist: Double {
    get { _contact.dist }
    set { _contact.dist = newValue }
  }
  @inlinable
  public var pos: (Double, Double, Double) {
    get { _contact.pos }
    set { _contact.pos = newValue }
  }
  @inlinable
  public var frame: (Double, Double, Double, Double, Double, Double, Double, Double, Double) {
    get { _contact.frame }
    set { _contact.frame = newValue }
  }
  @inlinable
  public var includemargin: Double {
    get { _contact.includemargin }
    set { _contact.includemargin = newValue }
  }
  @inlinable
  public var friction: (Double, Double, Double, Double, Double) {
    get { _contact.friction }
    set { _contact.friction = newValue }
  }
  @inlinable
  public var solref: (Double, Double) {
    get { _contact.solref }
    set { _contact.solref = newValue }
  }
  @inlinable
  public var solimp: (Double, Double, Double, Double, Double) {
    get { _contact.solimp }
    set { _contact.solimp = newValue }
  }
  @inlinable
  public var mu: Double {
    get { _contact.mu }
    set { _contact.mu = newValue }
  }
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
  @inlinable
  public var dim: Int32 {
    get { _contact.dim }
    set { _contact.dim = newValue }
  }
  @inlinable
  public var geom1: Int32 {
    get { _contact.geom1 }
    set { _contact.geom1 = newValue }
  }
  @inlinable
  public var geom2: Int32 {
    get { _contact.geom2 }
    set { _contact.geom2 = newValue }
  }
  @inlinable
  public var exclude: Int32 {
    get { _contact.exclude }
    set { _contact.exclude = newValue }
  }
  @inlinable
  public var efcAddress: Int32 {
    get { _contact.efc_address }
    set { _contact.efc_address = newValue }
  }
}
