import C_mujoco

/// callbacks extending computation pipeline
public struct Mjcb {
  /// MjModel and MjData in the callback cannot be used outside of the callback.
  public static var passive: ((MjModel?, MjData?) -> Void)? = nil {
    didSet {
      guard passive != nil else {
        mjcb_passive = nil
        return
      }
      mjcb_passive = {
        guard let _model = $0, let _data = $1 else { return }
        let model = MjModel(staticModel: UnsafeMutablePointer(mutating: _model))
        let data = MjData(
          data: _data, nq: _model.pointee.nq, nv: _model.pointee.nv, na: _model.pointee.na,
          nu: _model.pointee.nu, nbody: _model.pointee.nbody, nmocap: _model.pointee.nmocap,
          nuserdata: _model.pointee.nuserdata, nsensordata: _model.pointee.nsensordata,
          njnt: _model.pointee.njnt, ngeom: _model.pointee.ngeom, nsite: _model.pointee.nsite,
          ncam: _model.pointee.ncam, nlight: _model.pointee.nlight, ntendon: _model.pointee.ntendon,
          nwrap: _model.pointee.nwrap, nM: _model.pointee.nM, nconmax: _model.pointee.nconmax,
          njmax: _model.pointee.njmax, nD: _model.pointee.nD,
          npluginstate: _model.pointee.npluginstate)
        Mjcb.passive?(model, data)
      }
    }
  }
  /// MjModel and MjData in this callback cannot be used outside of the callback.
  public static var control: ((MjModel, MjData) -> Void)? = nil {
    didSet {
      guard control != nil else {
        mjcb_control = nil
        return
      }
      mjcb_control = {
        guard let _model = $0, let _data = $1 else { return }
        let model = MjModel(staticModel: UnsafeMutablePointer(mutating: _model))
        let data = MjData(
          data: _data, nq: _model.pointee.nq, nv: _model.pointee.nv, na: _model.pointee.na,
          nu: _model.pointee.nu, nbody: _model.pointee.nbody, nmocap: _model.pointee.nmocap,
          nuserdata: _model.pointee.nuserdata, nsensordata: _model.pointee.nsensordata,
          njnt: _model.pointee.njnt, ngeom: _model.pointee.ngeom, nsite: _model.pointee.nsite,
          ncam: _model.pointee.ncam, nlight: _model.pointee.nlight, ntendon: _model.pointee.ntendon,
          nwrap: _model.pointee.nwrap, nM: _model.pointee.nM, nconmax: _model.pointee.nconmax,
          njmax: _model.pointee.njmax, nD: _model.pointee.nD,
          npluginstate: _model.pointee.npluginstate)
        Mjcb.control?(model, data)
      }
    }
  }
  /// contact filter: 1- discard, 0- collide
  ///
  /// MjModel and MjData in this callback cannot be used outside of the callback.
  public static var contactfilter: ((MjModel, MjData, Int32, Int32) -> Int32)? = nil {
    didSet {
      guard contactfilter != nil else {
        mjcb_contactfilter = nil
        return
      }
      mjcb_contactfilter = {
        guard let _model = $0, let _data = $1 else { return 0 }
        let model = MjModel(staticModel: UnsafeMutablePointer(mutating: _model))
        let data = MjData(
          data: _data, nq: _model.pointee.nq, nv: _model.pointee.nv, na: _model.pointee.na,
          nu: _model.pointee.nu, nbody: _model.pointee.nbody, nmocap: _model.pointee.nmocap,
          nuserdata: _model.pointee.nuserdata, nsensordata: _model.pointee.nsensordata,
          njnt: _model.pointee.njnt, ngeom: _model.pointee.ngeom, nsite: _model.pointee.nsite,
          ncam: _model.pointee.ncam, nlight: _model.pointee.nlight, ntendon: _model.pointee.ntendon,
          nwrap: _model.pointee.nwrap, nM: _model.pointee.nM, nconmax: _model.pointee.nconmax,
          njmax: _model.pointee.njmax, nD: _model.pointee.nD,
          npluginstate: _model.pointee.npluginstate)
        return Mjcb.contactfilter?(model, data, $2, $3) ?? 0
      }
    }
  }
  /// sensor simulation
  ///
  /// MjModel and MjData in this callback cannot be used outside of the callback.
  public static var sensor: ((MjModel, MjData, Int32) -> Void)? = nil {
    didSet {
      guard sensor != nil else {
        mjcb_sensor = nil
        return
      }
      mjcb_sensor = {
        guard let _model = $0, let _data = $1 else { return }
        let model = MjModel(staticModel: UnsafeMutablePointer(mutating: _model))
        let data = MjData(
          data: _data, nq: _model.pointee.nq, nv: _model.pointee.nv, na: _model.pointee.na,
          nu: _model.pointee.nu, nbody: _model.pointee.nbody, nmocap: _model.pointee.nmocap,
          nuserdata: _model.pointee.nuserdata, nsensordata: _model.pointee.nsensordata,
          njnt: _model.pointee.njnt, ngeom: _model.pointee.ngeom, nsite: _model.pointee.nsite,
          ncam: _model.pointee.ncam, nlight: _model.pointee.nlight, ntendon: _model.pointee.ntendon,
          nwrap: _model.pointee.nwrap, nM: _model.pointee.nM, nconmax: _model.pointee.nconmax,
          njmax: _model.pointee.njmax, nD: _model.pointee.nD,
          npluginstate: _model.pointee.npluginstate)
        Mjcb.sensor?(model, data, $2)
      }
    }
  }
  /// timer
  public static var time: (() -> Double)? = nil {
    didSet {
      guard time != nil else {
        mjcb_time = nil
        return
      }
      mjcb_time = {
        return Mjcb.time?() ?? 0
      }
    }
  }
  /// actuator dynamics
  ///
  /// MjModel and MjData in this callback cannot be used outside of the callback.
  public static var actDyn: ((MjModel, MjData, Int32) -> Double)? = nil {
    didSet {
      guard actDyn != nil else {
        mjcb_act_dyn = nil
        return
      }
      mjcb_act_dyn = {
        guard let _model = $0, let _data = $1 else { return 0 }
        let model = MjModel(staticModel: UnsafeMutablePointer(mutating: _model))
        let data = MjData(
          data: UnsafeMutablePointer(mutating: _data), nq: _model.pointee.nq, nv: _model.pointee.nv,
          na: _model.pointee.na,
          nu: _model.pointee.nu, nbody: _model.pointee.nbody, nmocap: _model.pointee.nmocap,
          nuserdata: _model.pointee.nuserdata, nsensordata: _model.pointee.nsensordata,
          njnt: _model.pointee.njnt, ngeom: _model.pointee.ngeom, nsite: _model.pointee.nsite,
          ncam: _model.pointee.ncam, nlight: _model.pointee.nlight, ntendon: _model.pointee.ntendon,
          nwrap: _model.pointee.nwrap, nM: _model.pointee.nM, nconmax: _model.pointee.nconmax,
          njmax: _model.pointee.njmax, nD: _model.pointee.nD,
          npluginstate: _model.pointee.npluginstate)
        return Mjcb.actDyn?(model, data, $2) ?? 0
      }
    }
  }
  /// actuator gain
  ///
  /// MjModel and MjData in this callback cannot be used outside of the callback.
  public static var actGain: ((MjModel, MjData, Int32) -> Double)? = nil {
    didSet {
      guard actGain != nil else {
        mjcb_act_gain = nil
        return
      }
      mjcb_act_gain = {
        guard let _model = $0, let _data = $1 else { return 1 }
        let model = MjModel(staticModel: UnsafeMutablePointer(mutating: _model))
        let data = MjData(
          data: UnsafeMutablePointer(mutating: _data), nq: _model.pointee.nq, nv: _model.pointee.nv,
          na: _model.pointee.na,
          nu: _model.pointee.nu, nbody: _model.pointee.nbody, nmocap: _model.pointee.nmocap,
          nuserdata: _model.pointee.nuserdata, nsensordata: _model.pointee.nsensordata,
          njnt: _model.pointee.njnt, ngeom: _model.pointee.ngeom, nsite: _model.pointee.nsite,
          ncam: _model.pointee.ncam, nlight: _model.pointee.nlight, ntendon: _model.pointee.ntendon,
          nwrap: _model.pointee.nwrap, nM: _model.pointee.nM, nconmax: _model.pointee.nconmax,
          njmax: _model.pointee.njmax, nD: _model.pointee.nD,
          npluginstate: _model.pointee.npluginstate)
        return Mjcb.actGain?(model, data, $2) ?? 1  // src/engine/engine_forward.c for why default to 1
      }
    }
  }
  /// actuator bias
  ///
  /// MjModel and MjData in this callback cannot be used outside of the callback.
  public static var actBias: ((MjModel, MjData, Int32) -> Double)? = nil {
    didSet {
      guard actBias != nil else {
        mjcb_act_bias = nil
        return
      }
      mjcb_act_bias = {
        guard let _model = $0, let _data = $1 else { return 0 }
        let model = MjModel(staticModel: UnsafeMutablePointer(mutating: _model))
        let data = MjData(
          data: UnsafeMutablePointer(mutating: _data), nq: _model.pointee.nq, nv: _model.pointee.nv,
          na: _model.pointee.na,
          nu: _model.pointee.nu, nbody: _model.pointee.nbody, nmocap: _model.pointee.nmocap,
          nuserdata: _model.pointee.nuserdata, nsensordata: _model.pointee.nsensordata,
          njnt: _model.pointee.njnt, ngeom: _model.pointee.ngeom, nsite: _model.pointee.nsite,
          ncam: _model.pointee.ncam, nlight: _model.pointee.nlight, ntendon: _model.pointee.ntendon,
          nwrap: _model.pointee.nwrap, nM: _model.pointee.nM, nconmax: _model.pointee.nconmax,
          njmax: _model.pointee.njmax, nD: _model.pointee.nD,
          npluginstate: _model.pointee.npluginstate)
        return Mjcb.actBias?(model, data, $2) ?? 0
      }
    }
  }
}
