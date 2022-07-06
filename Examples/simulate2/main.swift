import Foundation
import MuJoCo
import Numerics

let simulate = Simulate(width: 1280, height: 720)
let syncmisalign: Double = 0.1  // maximum time mis-alignment before re-sync
let refreshfactor: Double = 0.7  // fraction of refresh available for simulation
let vmode = GLContext.videoMode
var ctrlnoise: [Double]? = nil
if CommandLine.arguments.count > 1 {
  simulate.filename = CommandLine.arguments[1]
  simulate.loadrequest = 2
}
final class Timer {
  var simsync: Double = 0
  var cpusync: Double = 0
}
let timer = Timer()
while !simulate.exitrequest {
  simulate.yield()
  guard let m = simulate.model, var d = simulate.data else { continue }
  if simulate.run {
    let tmstart = GLContext.time
    if simulate.ctrlnoisestd > 0 {
      let rate = exp(-m.opt.timestep / simulate.ctrlnoiserate)
      let scale = simulate.ctrlnoisestd * (1 - rate * rate).squareRoot()
      let prevctrlnoise = ctrlnoise
      if ctrlnoise == nil {
        // allocate ctrlnoise
        ctrlnoise = Array(repeating: 0, count: Int(m.nu))
      }
      for i in 0..<Int(m.nu) {
        ctrlnoise?[i] = rate * (prevctrlnoise?[i] ?? 0) + scale * Simulate.normal(1)
        d.ctrl[i] = ctrlnoise?[i] ?? 0
      }
    }
    let offset = abs(
      (d.time * Double(simulate.slowdown) - timer.simsync) - (tmstart - timer.cpusync))
    // Out of sync.
    if d.time * Double(simulate.slowdown) < timer.simsync || tmstart < timer.cpusync
      || timer.cpusync == 0 || offset > syncmisalign * Double(simulate.slowdown)
      || simulate.speedchanged
    {
      timer.cpusync = tmstart
      timer.simsync = d.time * Double(simulate.slowdown)
      simulate.speedchanged = false
      d.xfrcApplied.zero()
      simulate.perturb.applyPerturbPose(model: m, data: &d, flgPaused: 0)
      simulate.perturb.applyPerturbForce(model: m, data: &d)
      m.step(data: &d)
    } else {
      // In sync.
      // step while simtime lags behind cputime, and within safefactor
      while d.time * Double(simulate.slowdown) - timer.simsync < GLContext.time - timer.cpusync
        && GLContext.time - tmstart < refreshfactor / Double(vmode.refreshRate)
      {
        // clear old perturbations, apply new
        d.xfrcApplied.zero()
        simulate.perturb.applyPerturbPose(model: m, data: &d, flgPaused: 0)
        simulate.perturb.applyPerturbForce(model: m, data: &d)
        let prevtm = d.time * Double(simulate.slowdown)
        m.step(data: &d)

        // break on reset
        if d.time * Double(simulate.slowdown) < prevtm {
          break
        }
      }
    }
  } else {
    simulate.perturb.applyPerturbPose(model: m, data: &d, flgPaused: 1)
    m.forward(data: &d)
  }
}
