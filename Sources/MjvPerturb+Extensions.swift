extension MjvPerturb {
  @inlinable
  public var select: Int32 {
    get { _perturb.select }
    set { _perturb.select = newValue }
  }
  @inlinable
  public var skinselect: Int32 {
    get { _perturb.skinselect }
    set { _perturb.skinselect = newValue }
  }
  @inlinable
  public var active: MjPertBit {
    get { MjPertBit(rawValue: _perturb.active)! }
    set { _perturb.active = newValue.rawValue }
  }
  @inlinable
  public var active2: MjPertBit {
    get { MjPertBit(rawValue: _perturb.active2)! }
    set { _perturb.active2 = newValue.rawValue }
  }
  @inlinable
  public var refpos: (Double, Double, Double) {
    get { _perturb.refpos }
    set { _perturb.refpos = newValue }
  }
  @inlinable
  public var refquat: (Double, Double, Double, Double) {
    get { _perturb.refquat }
    set { _perturb.refquat = newValue }
  }
  @inlinable
  public var localpos: (Double, Double, Double) {
    get { _perturb.localpos }
    set { _perturb.localpos = newValue }
  }
  @inlinable
  public var scale: Double {
    get { _perturb.scale }
    set { _perturb.scale = newValue }
  }
}
