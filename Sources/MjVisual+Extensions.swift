import C_mujoco

extension MjVisual {
  @inlinable
  public var global: mjVisual_.__Unnamed_struct_global {
    get { _visual.global }
    set { _visual.global = newValue }
  }
  @inlinable
  public var quality: mjVisual_.__Unnamed_struct_quality {
    get { _visual.quality }
    set { _visual.quality = newValue }
  }
  @inlinable
  public var headlight: mjVisual_.__Unnamed_struct_headlight {
    get { _visual.headlight }
    set { _visual.headlight = newValue }
  }
  @inlinable
  public var map: mjVisual_.__Unnamed_struct_map {
    get { _visual.map }
    set { _visual.map = newValue }
  }
  @inlinable
  public var scale: mjVisual_.__Unnamed_struct_scale {
    get { _visual.scale }
    set { _visual.scale = newValue }
  }
  @inlinable
  public var rgba: mjVisual_.__Unnamed_struct_rgba {
    get { _visual.rgba }
    set { _visual.rgba = newValue }
  }
}
extension MjVisual: CustomReflectable {
  public var customMirror: Mirror {
    Mirror(
      self,
      children: [
        "global": global, "quality": quality, "headlight": headlight, "map": map, "scale": scale,
        "rgba": rgba,
      ])
  }
}
