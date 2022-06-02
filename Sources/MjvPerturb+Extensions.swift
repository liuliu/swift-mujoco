extension MjvPerturb {
  /// selected body id; non-positive: none
  @inlinable
  public var select: Int32 {
    get { _perturb.select }
    set { _perturb.select = newValue }
  }
  /// selected skin id; negative: none
  @inlinable
  public var skinselect: Int32 {
    get { _perturb.skinselect }
    set { _perturb.skinselect = newValue }
  }
  /// perturbation bitmask (mjtPertBit)
  @inlinable
  public var active: MjtPertBit {
    get { MjtPertBit(rawValue: _perturb.active)! }
    set { _perturb.active = newValue.rawValue }
  }
  /// secondary perturbation bitmask (mjtPertBit)
  @inlinable
  public var active2: MjtPertBit {
    get { MjtPertBit(rawValue: _perturb.active2)! }
    set { _perturb.active2 = newValue.rawValue }
  }
  /// desired position for selected object
  @inlinable
  public var refpos: (Double, Double, Double) {
    get { _perturb.refpos }
    set { _perturb.refpos = newValue }
  }
  /// desired orientation for selected object
  @inlinable
  public var refquat: (Double, Double, Double, Double) {
    get { _perturb.refquat }
    set { _perturb.refquat = newValue }
  }
  /// selection point in object coordinates
  @inlinable
  public var localpos: (Double, Double, Double) {
    get { _perturb.localpos }
    set { _perturb.localpos = newValue }
  }
  /// relative mouse motion-to-space scaling (set by initPerturb)
  @inlinable
  public var scale: Double {
    get { _perturb.scale }
    set { _perturb.scale = newValue }
  }
}
