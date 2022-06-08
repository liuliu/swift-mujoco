import Foundation
import MuJoCo
import Numerics

struct Settings {
  var exitrequest = false
  var slowdown: Int32 = 1
  var speedchanged = false
  @MjuiDefState(.select, name: "Camera", state: 2, other: "Free\nTracking")
  var camera: Int32 = 0
  // option section of UI
  @MjuiDefState(.select, name: "Spacing", state: 1, other: "Tight\nWide")
  var spacing: Int32 = 0
  @MjuiDefState(.select, name: "Color", state: 1, other: "Default\nOrange\nWhite\nBlack")
  var color: Int32 = 0
  @MjuiDefState(.select, name: "Font", state: 1, other: "50 %\n100 %\n150 %\n200 %\n250 %\n300%")
  var font: Int32 = 0
  @MjuiDefState(.checkint, name: "Left UI (Tab)", state: 1, other: " #258")
  var ui0 = true
  @MjuiDefState(.checkint, name: "Right UI", state: 1, other: "S#258")
  var ui1 = true
  @MjuiDefState(.checkint, name: "Help", state: 2, other: " #290")
  var help = false
  @MjuiDefState(.checkint, name: "Info", state: 2, other: " #291")
  var info = false
  @MjuiDefState(.checkint, name: "Profiler", state: 2, other: " #292")
  var profiler = false
  @MjuiDefState(.checkint, name: "Sensor", state: 2, other: " #293")
  var sensor = false
  @MjuiDefState(.checkint, name: "Fullscreen", state: 1, other: " #294")
  var fullscreen = false
  @MjuiDefState(.checkint, name: "Vertical Sync", state: 1, other: "")
  var vsync: Int32 = 1
  @MjuiDefState(.checkint, name: "Busy Wait", state: 1, other: "")
  var busywait = false
  // simulation section of UI
  @MjuiDefState(.radio, name: "", state: 2, other: "Pause\nRun")
  var run = true
  @MjuiDefState(.sliderint, name: "Key", state: 3, other: "0 0")
  var key: Int32 = 0
  @MjuiDefState(.slidernum, name: "Noise scale", state: 2, other: "0 2")
  var ctrlnoisestd: Double = 0
  @MjuiDefState(.slidernum, name: "Noise rate", state: 2, other: "0 2")
  var ctrlnoiserate: Double = 0
  // watch section of UI
  @MjuiDefState(.edittxt, name: "Field", state: 2, other: "qpos")
  var field: String = "qpos"
  @MjuiDefStateMap({ i, _ in
    (type: .checkint, name: "\(MjtDisableBit.allCases[i])", state: 2, other: "")
  })
  var disable: [Bool] = Array(repeating: false, count: MjtDisableBit.allCases.count)
  @MjuiDefStateMap({ i, _ in
    (type: .checkint, name: "\(MjtEnableBit.allCases[i])", state: 2, other: "")
  })
  var enable: [Bool] = Array(repeating: false, count: MjtEnableBit.allCases.count)
  @MjuiDefState(.editint, name: "Index", state: 2, other: "1")
  var index: Int32 = 0
  var loadrequest: Int32 = 0
}

enum UI0Section: Int32, CaseIterable {
  // left ui
  case file = 0
  case option
  case simulation
  case watch
  case physics
  case rendering
  case group
}

enum UI1Section: Int32, CaseIterable {
  // right ui
  case joint = 0
  case control
}

// help strings
let helpContent = """
  Space
  +  -
  Right arrow
  [  ]
  Esc
  Double-click
  Page Up
  Right double-click
  Ctrl Right double-click
  Scroll, middle drag
  Left drag
  [Shift] right drag
  Ctrl [Shift] drag
  Ctrl [Shift] right drag
  F1
  F2
  F3
  F4
  F5
  UI right hold
  UI title double-click
  """
let helpTitle = """
  Play / Pause
  Speed up / down
  Step
  Cycle cameras
  Free camera
  Select
  Select parent
  Center
  Tracking camera
  Zoom
  View rotate
  View translate
  Object rotate
  Object translate
  Help
  Info
  Profiler
  Sensors
  Full screen
  Show UI shortcuts
  Expand/collapse all
  """

var infoContent = ""
var infoTitle = ""

let glContext = GLContext(width: 1280, height: 720, title: "simulate")
let mtx = DispatchQueue(label: "mtx")
var m: MjModel? = nil
var d: MjData? = nil
var pert = MjvPerturb()
var settings = Settings()
let syncmisalign: Double = 0.1  // maximum time mis-alignment before re-sync
let refreshfactor: Double = 0.7  // fraction of refresh available for simulation
let vmode = GLContext.videoMode
var ctrlnoise: [Double]? = nil
let maxgeom: Int32 = 5_000
let maxSlowdown: Int32 = 128  // maximum slow-down quotient
let zoomIncrement: Double = 0.02  // ratio of single click-wheel zoom increment to vertical extent

func noise(_ std: Double) -> Double {
  let u1 = Double.random(in: 0...1)
  let u2 = Double.random(in: 0...1)
  let mag = std * (-2.0 * .log(u1)).squareRoot()
  return mag * .cos(.pi * 2 * u2)
}

var filename: String? = nil
var previousFilename: String? = nil
if CommandLine.arguments.count > 1 {
  filename = CommandLine.arguments[1]
  settings.loadrequest = 2
}

// We will run this function off main thread on a default global queue.
@Sendable
func simulate() async throws {
  final class Timer {
    var simsync: Double = 0
    var cpusync: Double = 0
  }
  let timer = Timer()
  while !settings.exitrequest {
    if settings.run && settings.busywait {
      await Task.yield()
    } else {
      try await Task.sleep(nanoseconds: 1_000_000)
    }
    mtx.sync {
      guard let m = m, var d = d else { return }
      if settings.run {
        let tmstart = GLContext.time
        if settings.ctrlnoisestd > 0 {
          let rate = exp(-m.opt.timestep / settings.ctrlnoiserate)
          let scale = settings.ctrlnoisestd * (1 - rate * rate).squareRoot()
          let prevctrlnoise = ctrlnoise
          for i in 0..<Int(m.nu) {
            ctrlnoise?[i] = rate * (prevctrlnoise?[i] ?? 0) + scale * noise(1)
            d.ctrl[i] = ctrlnoise?[i] ?? 0
          }
        }
        let offset = abs(
          (d.time * Double(settings.slowdown) - timer.simsync) - (tmstart - timer.cpusync))
        // Out of sync.
        if d.time * Double(settings.slowdown) < timer.simsync || tmstart < timer.cpusync
          || timer.cpusync == 0 || offset > syncmisalign * Double(settings.slowdown)
          || settings.speedchanged
        {
          timer.cpusync = tmstart
          timer.simsync = d.time * Double(settings.slowdown)
          settings.speedchanged = false
          d.xfrcApplied.zero()
          pert.applyPerturbPose(model: m, data: &d, flgPaused: 0)
          pert.applyPerturbForce(model: m, data: &d)
          m.step(data: &d)
        } else {
          // In sync.
          // step while simtime lags behind cputime, and within safefactor
          while d.time * Double(settings.slowdown) - timer.simsync < GLContext.time - timer.cpusync
            && GLContext.time - tmstart < refreshfactor / Double(vmode.refreshRate)
          {
            // clear old perturbations, apply new
            d.xfrcApplied.zero()
            pert.applyPerturbPose(model: m, data: &d, flgPaused: 0)
            pert.applyPerturbForce(model: m, data: &d)
            let prevtm = d.time * Double(settings.slowdown)
            m.step(data: &d)

            // break on reset
            if d.time * Double(settings.slowdown) < prevtm {
              break
            }
          }
        }
      } else {
        pert.applyPerturbPose(model: m, data: &d, flgPaused: 1)
        m.forward(data: &d)
      }
    }
  }
}

var camera = MjvCamera()
var vopt = MjvOption()
var figconstraint = MjvFigure()
var figcost = MjvFigure()
var figtimer = MjvFigure()
var figsize = MjvFigure()
var figsensor = MjvFigure()
var voptMapper = MjuiDefObjectMapper(to: &vopt)

Mjcb.time = { 1000 * GLContext.time }

// init profiler figures
func profilerinit() {
  // titles
  figconstraint.title = "Counts"
  figcost.title = "Convergence (log 10)"
  figsize.title = "Dimensions"
  figtimer.title = "CPU time (msec)"

  // x-labels
  figconstraint.xlabel = "Solver iteration"
  figcost.xlabel = "Solver iteration"
  figsize.xlabel = "Video frame"
  figtimer.xlabel = "Video frame"

  // y-tick nubmer formats
  figconstraint.yformat = "%.0f"
  figcost.yformat = "%.1f"
  figsize.yformat = "%.0f"
  figtimer.yformat = "%.2f"

  // colors
  figconstraint.figurergba = (0.1, 0, 0, 0.5)
  figcost.figurergba = (0, 0, 0.2, 0.5)
  figsize.figurergba = (0.1, 0, 0, 0.5)
  figtimer.figurergba = (0, 0, 0.2, 0.5)

  // legends
  figconstraint.linename[0] = "total"
  figconstraint.linename[1] = "active"
  figconstraint.linename[2] = "changed"
  figconstraint.linename[3] = "evals"
  figconstraint.linename[4] = "updates"
  figcost.linename[0] = "improvement"
  figcost.linename[1] = "gradient"
  figcost.linename[2] = "lineslope"
  figsize.linename[0] = "dof"
  figsize.linename[1] = "body"
  figsize.linename[2] = "constraint"
  figsize.linename[3] = "sqrt(nnz)"
  figsize.linename[4] = "contact"
  figsize.linename[5] = "iteration"
  figtimer.linename[0] = "total"
  figtimer.linename[1] = "collision"
  figtimer.linename[2] = "prepare"
  figtimer.linename[3] = "solve"
  figtimer.linename[4] = "other"

  // grid sizes
  figconstraint.gridsize = (5, 5)
  figcost.gridsize = (5, 5)
  figsize.gridsize = (3, 5)
  figtimer.gridsize = (3, 5)

  // minimum ranges
  figconstraint.range[0] = (0, 20)
  figconstraint.range[1] = (0, 80)
  figcost.range[0] = (0, 20)
  figcost.range[1] = (-15, 5)
  figsize.range[0] = (-200, 0)
  figsize.range[1] = (0, 100)
  figtimer.range[0] = (-200, 0)
  figtimer.range[1] = (0, 0.4)

  // init x axis on history figures (do not show yet)
  for n in 0..<6 {
    for i in 0..<1000 {
      figtimer.linedata[n, i].0 = Float(-i)
      figsize.linedata[n, i].0 = Float(-i)
    }
  }
}

// update profiler figures
func profilerupdate() {
  guard let d = d, let m = m else { return }
  // update constraint figure
  figconstraint.linepnt[0] = min(d.solverIter, 1000)
  for i in 1..<5 {
    figconstraint.linepnt[i] = figconstraint.linepnt[0]
  }
  if m.opt.solver == .pgs {
    figconstraint.linepnt[3] = 0
    figconstraint.linepnt[4] = 0
  }
  if m.opt.solver == .cg {
    figconstraint.linepnt[4] = 0
  }
  for i in 0..<Int(figconstraint.linepnt[0]) {
    figconstraint.linedata[0, i] = (Float(i), Float(d.nefc))
    figconstraint.linedata[1, i] = (Float(i), Float(d.solver[i].nactive))
    figconstraint.linedata[2, i] = (Float(i), Float(d.solver[i].nchange))
    figconstraint.linedata[3, i] = (Float(i), Float(d.solver[i].neval))
    figconstraint.linedata[4, i] = (Float(i), Float(d.solver[i].nupdate))
  }

  // update cost figure
  figcost.linepnt[0] = min(d.solverIter, 1000)
  for i in 0..<3 {
    figcost.linepnt[i] = figcost.linepnt[0]
  }
  if m.opt.solver == .pgs {
    figcost.linepnt[1] = 0
    figcost.linepnt[2] = 0
  }

  for i in 0..<Int(figcost.linepnt[0]) {
    figcost.linedata[0, i] = (Float(i), Float(log10(max(1e-15, d.solver[i].improvement))))
    figcost.linedata[1, i] = (Float(i), Float(log10(max(1e-15, d.solver[i].gradient))))
    figcost.linedata[2, i] = (Float(i), Float(log10(max(1e-15, d.solver[i].lineslope))))
  }

  // get timers: total, collision, prepare, solve, other
  var total = d.timer[Int(MjtTimer.step.rawValue)].duration
  var number = d.timer[Int(MjtTimer.step.rawValue)].number
  if number == 0 {
    total = d.timer[Int(MjtTimer.forward.rawValue)].duration
    number = d.timer[Int(MjtTimer.forward.rawValue)].number
  }
  number = max(1, number)
  var tdata: [Float] = [
    Float(total / Double(number)),
    Float(d.timer[Int(MjtTimer.posCollision.rawValue)].duration / Double(number)),
    Float(
      d.timer[Int(MjtTimer.posMake.rawValue)].duration / Double(number)
        + d.timer[Int(MjtTimer.posProject.rawValue)].duration / Double(number)),
    Float(d.timer[Int(MjtTimer.constraint.rawValue)].duration / Double(number)),
    0,
  ]
  tdata[4] = tdata[0] - tdata[1] - tdata[2] - tdata[3]

  // update figtimer
  var pnt = min(201, Int(figtimer.linepnt[0] + 1))
  for n in 0..<5 {
    // shift data
    for i in stride(from: pnt - 1, to: 0, by: -1) {
      figtimer.linedata[n, i].1 = figtimer.linedata[n, i - 1].1
    }

    // assign new
    figtimer.linepnt[n] = Int32(pnt)
    figtimer.linedata[n, 0].1 = tdata[n]
  }

  // get sizes: nv, nbody, nefc, sqrt(nnz), ncont, iter
  let sdata: [Float] = [
    Float(m.nv),
    Float(m.nbody),
    Float(d.nefc),
    Float(d.solverNnz).squareRoot(),
    Float(d.ncon),
    Float(d.solverIter),
  ]

  // update figsize
  pnt = min(201, Int(figsize.linepnt[0] + 1))
  for n in 0..<6 {
    // shift data
    for i in stride(from: pnt - 1, to: 0, by: -1) {
      figsize.linedata[n, i].1 = figsize.linedata[n, i - 1].1
    }

    // assign new
    figsize.linepnt[n] = Int32(pnt)
    figsize.linedata[n, 0].1 = sdata[n]
  }
}

// show profiler figures
func profilershow(rect: MjrRect, context: MjrContext) {
  var viewport = MjrRect(
    left: rect.left + rect.width - rect.width / 4,
    bottom: rect.bottom,
    width: rect.width / 4,
    height: rect.height / 4
  )
  context.figure(viewport: viewport, figure: &figtimer)
  viewport.bottom += rect.height / 4
  context.figure(viewport: viewport, figure: &figsize)
  viewport.bottom += rect.height / 4
  context.figure(viewport: viewport, figure: &figcost)
  viewport.bottom += rect.height / 4
  context.figure(viewport: viewport, figure: &figconstraint)
}

// init sensor figure
func sensorinit() {
  // set figure to default
  figsensor.figurergba = (0, 0, 0, 0.5)

  // set flags
  figsensor.flgExtend = 1
  figsensor.flgBarplot = 1
  figsensor.flgSymmetric = 1

  // title
  figsensor.title = "Sensor data"

  // y-tick nubmer format
  figsensor.yformat = "%.0f"

  // grid size
  figsensor.gridsize = (2, 3)

  // minimum range
  figsensor.range[0] = (0, 0)
  figsensor.range[1] = (-1, 1)
}

// update sensor figure
func sensorupdate() {
  guard let m = m, let d = d else { return }
  let maxline = 10

  // clear linepnt
  for i in 0..<maxline {
    figsensor.linepnt[i] = 0
  }

  // start with line 0
  var lineid = 0

  // loop over sensors
  for n in 0..<Int(m.nsensor) {
    // go to next line if type is different
    if n > 0 && m.sensorType[n] != m.sensorType[n - 1] {
      lineid = min(lineid + 1, maxline - 1)
    }

    // get info about this sensor
    let cutoff = m.sensorCutoff[n] > 0 ? m.sensorCutoff[n] : 1
    let adr = m.sensorAdr[n]
    let dim = m.sensorDim[n]

    // data pointer in line
    let p = figsensor.linepnt[lineid]

    // fill in data for this sensor
    for i in 0..<Int(dim) {
      // check size
      guard (Int(p) + 2 * i) < 1000 / 2 else { break }

      // x
      figsensor.linedata[lineid, Int(p) + 2 * i] = (Float(adr + Int32(i)), 0)
      figsensor.linedata[lineid, Int(p) + 2 * i + 1] = (
        Float(adr + Int32(i)), Float(d.sensordata[Int(adr) + i] / cutoff)
      )
    }

    // update linepnt
    figsensor.linepnt[lineid] = min(1000 - 1, figsensor.linepnt[lineid] + 2 * dim)
  }
}

// show sensor figure
func sensorshow(rect: MjrRect, context: MjrContext) {
  // constant width with and without profiler
  let width = settings.profiler ? rect.width / 3 : rect.width / 4

  // render figure on the right
  let viewport = MjrRect(
    left: rect.left + rect.width - width,
    bottom: rect.bottom,
    width: width,
    height: rect.height / 3
  )
  context.figure(viewport: viewport, figure: &figsensor)
}

// align and scale view
func alignscale() {
  guard let m = m else { return }
  // autoscale
  camera.lookat.0 = m.stat.center.0
  camera.lookat.1 = m.stat.center.1
  camera.lookat.2 = m.stat.center.2
  camera.distance = 1.5 * m.stat.extent

  // set to free camera
  camera.type = .free
}

// copy qpos to clipboard as key
func copykey() {
  guard let m = m, let d = d else { return }
  var clipboard = "<key qpos='"

  // prepare string
  for i in 0..<Int(m.nq) {
    clipboard += String(format: i == Int(m.nq) - 1 ? "%g" : "%g ", d.qpos[i])
  }
  clipboard += "'/>"

  // copy to clipboard
  glContext.clipboard = clipboard
}

func copycamera(_ camera: (MjvGLCamera, MjvGLCamera)) {
  // get camera spec from the GLCamera
  let cam_right: (Double, Double, Double) = (
    Double(camera.0.forward.1) * Double(camera.0.up.2) - Double(camera.0.forward.2)
      * Double(camera.0.up.1),
    Double(camera.0.forward.2) * Double(camera.0.up.0) - Double(camera.0.forward.0)
      * Double(camera.0.up.2),
    Double(camera.0.forward.0) * Double(camera.0.up.1) - Double(camera.0.forward.1)
      * Double(camera.0.up.0)
  )

  glContext.clipboard = String(
    format:
      "<camera pos=\"%.3f %.3f %.3f\" xyaxes=\"%.3f %.3f %.3f %.3f %.3f %.3f\"/>\n",
    (camera.0.pos.0 + camera.1.pos.0) / 2,
    (camera.0.pos.1 + camera.1.pos.1) / 2,
    (camera.0.pos.2 + camera.1.pos.2) / 2,
    cam_right.0, cam_right.1, cam_right.2,
    camera.0.up.0, camera.0.up.1, camera.0.up.2)
}

func cleartimers() {
  guard var d = d else { return }
  for i in 0..<MjtTimer.allCases.count {
    d.timer[i].duration = 0
    d.timer[i].number = 0
  }
}

glContext.makeCurrent {
  profilerinit()
  sensorinit()
  var scene = MjvScene(model: nil, maxgeom: maxgeom)
  let sceneMapper = MjuiDefObjectMapper(to: &scene)
  // The context need to be initialized after having a GL context.
  var context = MjrContext(model: nil, fontScale: ._100)
  Task.detached(operation: simulate)
  var ui0 = MjUI()
  ui0.spacing = MjuiThemeSpacing(settings.spacing)
  ui0.color = MjuiThemeColor(settings.color)
  ui0.rectid = 1
  ui0.auxid = 0
  var ui1 = MjUI()
  ui1.spacing = MjuiThemeSpacing(settings.spacing)
  ui1.color = MjuiThemeColor(settings.color)
  ui1.rectid = 2
  ui1.auxid = 1
  var uiState = MjuiState()
  ui0.add(defs: [
    MjuiDef(.section, name: "File", state: 1, pdata: nil, other: "AF"),
    MjuiDef(.button, name: "Save xml", state: 2, pdata: nil, other: ""),
    MjuiDef(.button, name: "Save mjb", state: 2, pdata: nil, other: ""),
    MjuiDef(.button, name: "Print model", state: 2, pdata: nil, other: "CM"),
    MjuiDef(.button, name: "Print data", state: 2, pdata: nil, other: "CD"),
    MjuiDef(.button, name: "Quit", state: 1, pdata: nil, other: "CQ"),
  ])
  ui0.add(defs: [
    MjuiDef(.section, name: "Option", state: 1, pdata: nil, other: "AO"),
    settings.$spacing,
    settings.$color,
    settings.$font,
    settings.$ui0,
    settings.$ui1,
    settings.$help,
    settings.$info,
    settings.$profiler,
    settings.$sensor,
    settings.$fullscreen,
    settings.$vsync,
    settings.$busywait,
  ])
  ui0.add(defs: [
    MjuiDef(.section, name: "Simulation", state: 1, pdata: nil, other: "AS"),
    settings.$run,
    MjuiDef(.button, name: "Reset", state: 2, pdata: nil, other: " #259"),
    MjuiDef(.button, name: "Reload", state: 2, pdata: nil, other: "CL"),
    MjuiDef(.button, name: "Align", state: 2, pdata: nil, other: "CA"),
    MjuiDef(.button, name: "Copy pose", state: 2, pdata: nil, other: "CC"),
    settings.$key,
    MjuiDef(.button, name: "Load key", state: 3, pdata: nil, other: ""),
    MjuiDef(.button, name: "Save key", state: 3, pdata: nil, other: ""),
    settings.$ctrlnoisestd,
    settings.$ctrlnoiserate,
  ])
  ui0.add(defs: [
    MjuiDef(.section, name: "Watch", state: 0, pdata: nil, other: "AW"),
    settings.$field,
    settings.$index,
    MjuiDef(.static, name: "Value", state: 2, pdata: nil, other: " "),
  ])
  ui0.predicate = { category in
    switch category {
    case 2:  // require model
      return m != nil
    case 3:  // require model and nkey
      return (m?.nkey ?? 0) != 0
    case 4:  // require model and paused
      return m != nil && !settings.run
    default:
      return true
    }
  }
  ui1.predicate = ui0.predicate
  settings.font = glContext.fontScale / 50 - 1

  // update watch
  func watch() {
    guard let d = d else { return }
    // clear
    ui0.sect[Int(UI0Section.watch.rawValue)].item[2].multi.nelem = 1
    ui0.sect[Int(UI0Section.watch.rawValue)].item[2].multi.name[0] = "invalid field"
    let mirror = Mirror(reflecting: d)
    let field = settings.field
    for child in mirror.children {
      guard child.label == field else { continue }
      guard let data = child.value as? MjArray<Double> else { return }  // Found, and it is not expected type, no need to continue.
      let index = Int(settings.index)
      guard index >= 0 && index < data.count else {
        ui0.sect[Int(UI0Section.watch.rawValue)].item[2].multi.name[0] = "invalid index"
        return
      }
      ui0.sect[Int(UI0Section.watch.rawValue)].item[2].multi.name[0] = "\(data[index])"
      return
    }
  }

  // update UI 0 when MuJoCo structures change (except for joint sliders)
  func updatesettings() {
    guard let m = m else { return }
    // physics flags
    for (i, flag) in MjtDisableBit.allCases.enumerated() {
      settings.disable[i] = m.opt.disableflags.contains(flag)
    }
    for (i, flag) in MjtEnableBit.allCases.enumerated() {
      settings.enable[i] = m.opt.enableflags.contains(flag)
    }

    // camera
    switch camera.type {
    case .fixed:
      settings.camera = 2 + camera.fixedcamid
    case .tracking:
      settings.camera = 1
    default:
      settings.camera = 0
    }

    // update UI
    uiState.update(section: -1, item: -1, ui: ui0, context: context)
  }

  // make physics section of UI
  func makephysics(_ oldstate: Int32) {
    guard var m = m else { return }
    let mMapper = MjuiDefObjectMapper(to: &m)
    let defPhysics: [MjuiDef] = [
      MjuiDef(.section, name: "Physics", state: oldstate, pdata: nil, other: "AP"),
      mMapper(
        \.opt.integrator, .select, name: "IntegratorPhysics", state: 2,
        other: "Euler\nRK4\nimplicit"),
      mMapper(\.opt.collision, .select, name: "Collision", state: 2, other: "All\nPair\nDynamic"),
      mMapper(\.opt.cone, .select, name: "Cone", state: 2, other: "Pyramidal\nElliptic"),
      mMapper(\.opt.jacobian, .select, name: "Jacobian", state: 2, other: "Dense\nSparse\nAuto"),
      mMapper(\.opt.solver, .select, name: "Solver", state: 2, other: "PGS\nCG\nNewton"),
      MjuiDef(.separator, name: "Algorithmic Parameters", state: 1, pdata: nil, other: ""),
      mMapper(\.opt.timestep, .editnum, name: "Timestep", state: 2, other: "1 0 1"),
      mMapper(\.opt.iterations, .editint, name: "Iterations", state: 2, other: "1 0 1000"),
      mMapper(\.opt.tolerance, .editnum, name: "Tolerance", state: 2, other: "1 0 1"),
      mMapper(\.opt.noslip_iterations, .editint, name: "Noslip Iter", state: 2, other: "1 0 1000"),
      mMapper(\.opt.noslip_tolerance, .editnum, name: "Noslip Tol", state: 2, other: "1 0 1"),
      mMapper(\.opt.mpr_iterations, .editint, name: "MRR Iter", state: 2, other: "1 0 1000"),
      mMapper(\.opt.mpr_tolerance, .editnum, name: "MPR Tol", state: 2, other: "1 0 1"),
      mMapper(\.opt.apirate, .editnum, name: "API Rate", state: 2, other: "1 0 1000"),
      MjuiDef(.separator, name: "Physical Parameters", state: 1, pdata: nil, other: ""),
      mMapper(\.opt.gravity, .editnum, name: "Gravity", state: 2, other: "3"),
      mMapper(\.opt.wind, .editnum, name: "Wind", state: 2, other: "3"),
      mMapper(\.opt.magnetic, .editnum, name: "Magnetic", state: 2, other: "3"),
      mMapper(\.opt.density, .editnum, name: "Density", state: 2, other: "1"),
      mMapper(\.opt.viscosity, .editnum, name: "Viscosity", state: 2, other: "1"),
      mMapper(\.opt.impratio, .editnum, name: "Imp Ratio", state: 2, other: "1"),
      MjuiDef(.separator, name: "Disable Flags", state: 1, pdata: nil, other: ""),
    ]
    // add physics
    ui0.add(defs: defPhysics)

    // add flags programmatically
    ui0.add(defs: settings.$disable)
    ui0.add(defs: [MjuiDef(.separator, name: "Enable Flags", state: 1, pdata: nil, other: "")])
    ui0.add(defs: settings.$enable)

    // add contact override
    let defOverride: [MjuiDef] = [
      MjuiDef(.separator, name: "Contact Override", state: 1, pdata: nil, other: ""),
      mMapper(\.opt.o_margin, .editnum, name: "Margin", state: 2, other: "1"),
      mMapper(\.opt.o_solimp, .editnum, name: "Sol Imp", state: 2, other: "5"),
      mMapper(\.opt.o_solref, .editnum, name: "Sol Ref", state: 2, other: "2"),
    ]
    ui0.add(defs: defOverride)
  }

  // make rendering section of UI
  func makerendering(_ oldstate: Int32) {
    guard let m = m else { return }
    var defRendering: [MjuiDef] = [
      MjuiDef(.section, name: "Rendering", state: oldstate, pdata: nil, other: "AR"),
      settings.$camera,
      voptMapper(
        \.label, .select, name: "Label", state: 2,
        other:
          "None\nBody\nJoint\nGeom\nSite\nCamera\nLight\nTendon\nActuator\nConstraint\nSkin\nSelection\nSel Pnt\nForce"
      ),
      voptMapper(
        \.frame, .select, name: "Frame", state: 2,
        other: "None\nBody\nGeom\nSite\nCamera\nLight\nContact\nWorld"),
      MjuiDef(.button, name: "Copy camera", state: 2, pdata: nil, other: ""),
      MjuiDef(.separator, name: "Model Elements", state: 1, pdata: nil, other: ""),
    ]

    // add model cameras, up to UI limit
    var other = defRendering[1].other
    for i in 0..<min(Int(m.ncam), Int(MjuiItem.maxUIMulti) - 2) {
      // prepare name
      var camname = "\n"
      if let newname = m.camNames[i] {
        camname += newname
      } else {
        camname += "Camera \(i)"
      }
      other += camname
    }
    defRendering[1].other = other
    // add rendering standard
    ui0.add(defs: defRendering)

    // add flags programmatically
    for (i, flag) in MjtVisFlag.allCases.enumerated() {
      ui0.add(defs: [
        voptMapper(\.flags, .checkbyte, name: "\(flag)", state: 2, other: "", offsetBy: i)
      ])
    }
    ui0.add(defs: [MjuiDef(.separator, name: "OpenGL Effects", state: 1, pdata: nil, other: "")])
    for (i, flag) in MjtRndFlag.allCases.enumerated() {
      ui0.add(defs: [
        sceneMapper(\.flags, .checkbyte, name: "\(flag)", state: 2, other: "", offsetBy: i)
      ])
    }
  }

  func makegroup(_ oldstate: Int32) {
    let defGroup: [MjuiDef] = [
      MjuiDef(.section, name: "Group enable", state: oldstate, pdata: nil, other: "AG"),
      MjuiDef(.separator, name: "Geom groups", state: 1, pdata: nil, other: ""),
      voptMapper(\.geomgroup, .checkbyte, name: "Geom 0", state: 2, other: " 0"),
      voptMapper(\.geomgroup, .checkbyte, name: "Geom 1", state: 2, other: " 1", offsetBy: 1),
      voptMapper(\.geomgroup, .checkbyte, name: "Geom 2", state: 2, other: " 2", offsetBy: 2),
      voptMapper(\.geomgroup, .checkbyte, name: "Geom 3", state: 2, other: " 3", offsetBy: 3),
      voptMapper(\.geomgroup, .checkbyte, name: "Geom 4", state: 2, other: " 4", offsetBy: 4),
      voptMapper(\.geomgroup, .checkbyte, name: "Geom 5", state: 2, other: " 5", offsetBy: 5),
      MjuiDef(.separator, name: "Site groups", state: 1, pdata: nil, other: ""),
      voptMapper(\.sitegroup, .checkbyte, name: "Site 0", state: 2, other: "S0"),
      voptMapper(\.sitegroup, .checkbyte, name: "Site 1", state: 2, other: "S1", offsetBy: 1),
      voptMapper(\.sitegroup, .checkbyte, name: "Site 2", state: 2, other: "S2", offsetBy: 2),
      voptMapper(\.sitegroup, .checkbyte, name: "Site 3", state: 2, other: "S3", offsetBy: 3),
      voptMapper(\.sitegroup, .checkbyte, name: "Site 4", state: 2, other: "S4", offsetBy: 4),
      voptMapper(\.sitegroup, .checkbyte, name: "Site 5", state: 2, other: "S5", offsetBy: 5),
      MjuiDef(.separator, name: "Joint groups", state: 1, pdata: nil, other: ""),
      voptMapper(\.jointgroup, .checkbyte, name: "Joint 0", state: 2, other: ""),
      voptMapper(\.jointgroup, .checkbyte, name: "Joint 1", state: 2, other: "", offsetBy: 1),
      voptMapper(\.jointgroup, .checkbyte, name: "Joint 2", state: 2, other: "", offsetBy: 2),
      voptMapper(\.jointgroup, .checkbyte, name: "Joint 3", state: 2, other: "", offsetBy: 3),
      voptMapper(\.jointgroup, .checkbyte, name: "Joint 4", state: 2, other: "", offsetBy: 4),
      voptMapper(\.jointgroup, .checkbyte, name: "Joint 5", state: 2, other: "", offsetBy: 5),
      MjuiDef(.separator, name: "Tendon groups", state: 1, pdata: nil, other: ""),
      voptMapper(\.tendongroup, .checkbyte, name: "Tendon 0", state: 2, other: ""),
      voptMapper(\.tendongroup, .checkbyte, name: "Tendon 1", state: 2, other: "", offsetBy: 1),
      voptMapper(\.tendongroup, .checkbyte, name: "Tendon 2", state: 2, other: "", offsetBy: 2),
      voptMapper(\.tendongroup, .checkbyte, name: "Tendon 3", state: 2, other: "", offsetBy: 3),
      voptMapper(\.tendongroup, .checkbyte, name: "Tendon 4", state: 2, other: "", offsetBy: 4),
      voptMapper(\.tendongroup, .checkbyte, name: "Tendon 5", state: 2, other: "", offsetBy: 5),
      MjuiDef(.separator, name: "Actuator groups", state: 1, pdata: nil, other: ""),
      voptMapper(\.actuatorgroup, .checkbyte, name: "Actuator 0", state: 2, other: ""),
      voptMapper(\.actuatorgroup, .checkbyte, name: "Actuator 1", state: 2, other: "", offsetBy: 1),
      voptMapper(\.actuatorgroup, .checkbyte, name: "Actuator 2", state: 2, other: "", offsetBy: 2),
      voptMapper(\.actuatorgroup, .checkbyte, name: "Actuator 3", state: 2, other: "", offsetBy: 3),
      voptMapper(\.actuatorgroup, .checkbyte, name: "Actuator 4", state: 2, other: "", offsetBy: 4),
      voptMapper(\.actuatorgroup, .checkbyte, name: "Actuator 5", state: 2, other: "", offsetBy: 5),
    ]

    // add section
    ui0.add(defs: defGroup)
  }

  func makejoint(_ oldstate: Int32) {
    guard let m = m, let d = d else { return }

    // add section
    ui1.add(defs: [MjuiDef(.section, name: "Joint", state: oldstate, pdata: nil, other: "AJ")])
    var itemcnt: Int32 = 0
    for i in 0..<Int(m.njnt) {
      guard itemcnt < MjuiSection.maxUIItem else { break }
      guard m.jntType[i] == .hinge || m.jntType[i] == .slide else { continue }
      guard
        (withUnsafePointer(to: &vopt.jointgroup.0) { $0[max(0, min(6 - 1, Int(m.jntGroup[i])))] })
          != 0
      else { continue }
      let jntname: String
      if let newname = m.jntNames[i] {
        jntname = newname
      } else {
        jntname = "Joint \(i)"
      }
      let other: String
      if m.jntLimited[i] != 0 {
        other =
          "\(String(format: "%.4g", m.jntRange[2 * i])) \(String(format: "%.4g", m.jntRange[2 * i + 1]))"
      } else if m.jntType[i] == .slide {
        other = "-1 1"
      } else {
        other = "-3.1416 3.1416"
      }
      ui1.add(defs: [
        MjuiDef(
          .slidernum, name: jntname, state: 4, pdata: d.qpos + Int(m.jntQposadr[i]), other: other)
      ])
      itemcnt += 1
    }
  }

  func makecontrol(_ oldstate: Int32) {
    guard let m = m, let d = d else { return }
    let defControl: [MjuiDef] = [
      MjuiDef(.section, name: "Control", state: oldstate, pdata: nil, other: "AC"),
      MjuiDef(.button, name: "Clear all", state: 2, pdata: nil, other: ""),
    ]

    // add section
    ui1.add(defs: defControl)

    // add controls, exit if UI limit reached (Clear button already added)
    var itemcnt: Int32 = 1
    for i in 0..<Int(m.nu) {
      guard itemcnt < MjuiSection.maxUIItem else { break }
      guard
        (withUnsafePointer(to: &vopt.actuatorgroup.0) {
          $0[max(0, min(6 - 1, Int(m.actuatorGroup[i])))]
        }) != 0
      else { continue }
      let actuatorname: String
      if let newname = m.actuatorNames[i] {
        actuatorname = newname
      } else {
        actuatorname = "control \(i)"
      }
      let other: String
      if m.actuatorCtrllimited[i] != 0 {
        other =
          "\(String(format: "%.4g", m.actuatorCtrlrange[2 * i])) \(String(format: "%.4g", m.actuatorCtrlrange[2 * i + 1]))"
      } else {
        other = "-1 1"
      }
      ui1.add(defs: [
        MjuiDef(.slidernum, name: actuatorname, state: 2, pdata: d.ctrl + i, other: other)
      ])
      itemcnt += 1
    }
  }

  // make model-dependent UI sections
  func makesections() {
    // get section open-close state, UI 0
    var oldstate0: [Int32] = Array(repeating: 0, count: UI0Section.allCases.count)
    for i in 0..<UI0Section.allCases.count {
      if ui0.nsect > i {
        oldstate0[i] = ui0.sect[i].state
      }
    }

    // get section open-close state, UI 1
    var oldstate1: [Int32] = Array(repeating: 0, count: UI1Section.allCases.count)
    for i in 0..<UI1Section.allCases.count {
      if ui1.nsect > i {
        oldstate1[i] = ui1.sect[i].state
      }
    }

    // clear model-dependent sections of UI
    ui0.nsect = UI0Section.physics.rawValue
    ui1.nsect = 0

    // make
    makephysics(oldstate0[Int(UI0Section.physics.rawValue)])
    makerendering(oldstate0[Int(UI0Section.rendering.rawValue)])
    makegroup(oldstate0[Int(UI0Section.group.rawValue)])
    makejoint(oldstate1[Int(UI1Section.joint.rawValue)])
    makecontrol(oldstate1[Int(UI1Section.control.rawValue)])
  }

  func infotext(interval: Double) -> (String, String) {
    guard let m = m, let d = d else { return ("", "") }
    // compute solver error
    var solerr: Double = 0
    if d.solverIter > 0 {
      let ind = Int(min(d.solverIter - 1, 1000 - 1))
      solerr = min(d.solver[ind].improvement, d.solver[ind].gradient)
      if solerr == 0 {
        solerr = max(d.solver[ind].improvement, d.solver[ind].gradient)
      }
    }
    solerr = log10(max(1e-15, solerr))

    // prepare info text
    let realtimeNominator = settings.slowdown == 1 ? "" : "1/"
    var title = "Time\nSize\nCPU\nSolver   \nFPS\nstack\nconbuf\nefcbuf"
    var content = String(
      format: "%-9.3f %s%d x\n%d  (%d con)\n%.3f\n%.1f  (%d it)\n%.0f\n%.3f\n%.3f\n%.3f",
      d.time, realtimeNominator, settings.slowdown,
      d.nefc, d.ncon,
      settings.run
        ? d.timer[Int(MjtTimer.step.rawValue)].duration
          / Double(max(1, d.timer[Int(MjtTimer.step.rawValue)].number))
        : d.timer[Int(MjtTimer.forward.rawValue)].duration
          / Double(max(1, d.timer[Int(MjtTimer.forward.rawValue)].number)),
      solerr, d.solverIter,
      1 / interval,
      Double(d.maxuseStack) / Double(d.nstack),
      Double(d.maxuseCon) / Double(m.nconmax),
      Double(d.maxuseEfc) / Double(m.njmax))

    // add Energy if enabled
    if m.opt.enableflags.contains(.energy) {
      content += String(format: "\n%.3f", d.energy.0 + d.energy.1)
      title += "\nEnergy"
    }

    // add FwdInv if enabled
    if m.opt.enableflags.contains(.fwdinv) {
      content += String(
        format: "\n%.1f %.1f", log10(max(1e-15, d.solverFwdinv.0)),
        log10(max(1e-15, d.solverFwdinv.1)))
      title += "\nFwdInv"
    }
    return (title, content)
  }

  var lastupdatetm: Double = 0

  func prepare() {
    // data for FPS calculation

    // update interval, save update time
    let tmnow = GLContext.time
    var interval = tmnow - lastupdatetm
    interval = min(1, max(0.0001, interval))
    lastupdatetm = tmnow

    guard let m = m, var d = d else { return }
    scene.updateScene(model: m, data: &d, option: vopt, perturb: pert, camera: &camera)
    // update watch
    if settings.ui0 && ui0.nsect > UI0Section.watch.rawValue
      && ui0.sect[Int(UI0Section.watch.rawValue)].state != 0
    {
      watch()
      uiState.update(section: UI0Section.watch.rawValue, item: -1, ui: ui0, context: context)
    }
    // update joint
    if settings.ui1 && ui1.nsect > UI1Section.joint.rawValue
      && ui1.sect[Int(UI1Section.joint.rawValue)].state != 0
    {
      uiState.update(section: UI1Section.joint.rawValue, item: -1, ui: ui1, context: context)
    }
    // update info text
    if settings.info {
      (infoTitle, infoContent) = infotext(interval: interval)
    }
    if settings.ui1 && ui1.nsect > UI1Section.control.rawValue
      && ui1.sect[Int(UI1Section.control.rawValue)].state != 0
    {
      uiState.update(section: UI1Section.control.rawValue, item: -1, ui: ui1, context: context)
    }
    // update profiler
    if settings.profiler && settings.run {
      profilerupdate()
    }
    // update sensor
    if settings.sensor && settings.run {
      sensorupdate()
    }
    // clear timers once profiler info has been copied
    cleartimers()
  }

  glContext.setCallbacks(uiState: &uiState) { uiState in
    if uiState.dragrect == ui0.rectid || (uiState.dragrect == 0 && uiState.mouserect == ui0.rectid)
      || uiState.type == .key
    {
      if let it = ui0.event(state: &uiState, context: context) {
        if it.sectionid == UI0Section.file.rawValue {
          // File, these are safe because it is triggered under pollEvents, which is protected by mtx.
          switch it.itemid {
          case 0:
            try? m?.saveLastXML(filename: "mjmodel.xml")
          case 1:
            m?.write(to: "mjmodel.mjb")
          case 2:
            m?.printModel(filename: "MJMODEL.TXT")
          case 3:
            if let m = m, var d = d {
              m.print(data: &d, filename: "MJDATA.TXT")
            }
          case 4:
            settings.exitrequest = true
          default:
            break
          }
        } else if it.sectionid == UI0Section.option.rawValue {
          // Option
          switch it.itemid {
          case 0:
            ui0.spacing = MjuiThemeSpacing(settings.spacing)
            ui1.spacing = MjuiThemeSpacing(settings.spacing)
          case 1:
            ui0.color = MjuiThemeColor(settings.color)
            ui1.color = MjuiThemeColor(settings.color)
          case 2:
            context.changeFont(fontscale: MjtFontScale(rawValue: 50 * (settings.font + 1))!)
          case 9:  // fullscreen
            glContext.swapInterval = settings.vsync
          case 10:
            glContext.swapInterval = settings.vsync
          default:
            break
          }
          ui0.resize(context: context)
          glContext.modify(ui: ui0, uiState: &uiState, context: &context)
          ui1.resize(context: context)
          glContext.modify(ui: ui1, uiState: &uiState, context: &context)
        } else if it.sectionid == UI0Section.simulation.rawValue {
          // Simulation
          switch it.itemid {
          case 1:  // Reset
            guard let m = m, var d = d else { break }
            m.reset(data: &d)
            m.forward(data: &d)
            profilerupdate()
            sensorupdate()
            updatesettings()
          case 2:  // Reload
            settings.loadrequest = 1
          case 3:  // Align
            alignscale()
            updatesettings()
            break
          case 4:  // Copy pose
            copykey()
            break
          case 5...6:  // Adjust key, Load key
            guard let m = m, var d = d else { break }
            let i = Int(settings.key)
            d.time = m.keyTime[i]
            for j in 0..<Int(m.nq) {
              d.qpos[j] = m.keyQpos[i * Int(m.nq) + j]
            }
            for j in 0..<Int(m.nv) {
              d.qvel[j] = m.keyQvel[i * Int(m.nv) + j]
            }
            for j in 0..<Int(m.na) {
              d.act[j] = m.keyAct[i * Int(m.na) + j]
            }
            for j in 0..<Int(m.nmocap) {
              d.mocapPos[j] = m.keyMpos[i * Int(m.nmocap) + j]
              d.mocapQuat[j] = m.keyMquat[i * Int(m.nmocap) + j]
            }
            m.forward(data: &d)
            profilerupdate()
            sensorupdate()
            updatesettings()
            break
          case 7:  // Save key
            guard var m = m, let d = d else { break }
            let i = Int(settings.key)
            m.keyTime[i] = d.time
            for j in 0..<Int(m.nq) {
              m.keyQpos[i * Int(m.nq) + j] = d.qpos[j]
            }
            for j in 0..<Int(m.nv) {
              m.keyQvel[i * Int(m.nv) + j] = d.qvel[j]
            }
            for j in 0..<Int(m.na) {
              m.keyAct[i * Int(m.na) + j] = d.act[j]
            }
            for j in 0..<Int(m.nmocap) {
              m.keyMpos[i * Int(m.nmocap) + j] = d.mocapPos[j]
              m.keyMquat[i * Int(m.nmocap) + j] = d.mocapQuat[j]
            }
            break
          default:
            break
          }
        } else if it.sectionid == UI0Section.physics.rawValue {
          // Physics
          guard var m = m else { return }
          // update disable flags in mjOption
          m.opt.disableflags = []
          for (i, flag) in MjtDisableBit.allCases.enumerated() {
            if settings.disable[i] {
              m.opt.disableflags.insert(flag)
            }
          }

          // update enable flags in mjOption
          m.opt.enableflags = []
          for (i, flag) in MjtEnableBit.allCases.enumerated() {
            if settings.enable[i] {
              m.opt.enableflags.insert(flag)
            }
          }
        } else if it.sectionid == UI0Section.rendering.rawValue {
          // Rendering
          // set camera in mjvCamera
          if settings.camera == 0 {
            camera.type = .free
          } else if settings.camera == 1 {
            if pert.select > 0 {
              camera.type = .tracking
              camera.trackbodyid = pert.select
              camera.fixedcamid = -1
            } else {
              camera.type = .free
              settings.camera = 0
              uiState.update(
                section: UI0Section.rendering.rawValue, item: -1, ui: ui0, context: context)
            }
          } else {
            camera.type = .fixed
            camera.fixedcamid = settings.camera - 2
          }
          // copy camera spec to clipboard (as MJCF element)
          if it.itemid == 3 {
            copycamera(scene.camera)
          }
        } else if it.sectionid == UI0Section.group.rawValue {
          // Group
          // remake joint section if joint group changed
          if it.name.hasPrefix("Jo") {
            let oldstate = ui1.sect[Int(UI1Section.joint.rawValue)].state
            ui1.nsect = UI1Section.joint.rawValue
            makejoint(oldstate)
            ui1.nsect = Int32(UI1Section.allCases.count)
            ui1.resize(context: context)
            glContext.modify(ui: ui1, uiState: &uiState, context: &context)
          }

          // remake control section if actuator group changed
          if it.name.hasPrefix("Ac") {
            let oldstate = ui1.sect[Int(UI1Section.control.rawValue)].state
            ui1.nsect = UI1Section.control.rawValue
            makecontrol(oldstate)
            ui1.nsect = Int32(UI1Section.allCases.count)
            ui1.resize(context: context)
            glContext.modify(ui: ui1, uiState: &uiState, context: &context)
          }
        }
        return
      }
    }

    if uiState.dragrect == ui1.rectid || (uiState.dragrect == 0 && uiState.mouserect == ui1.rectid)
      || uiState.type == .key
    {
      if let it = ui1.event(state: &uiState, context: context) {
        // control section
        if it.sectionid == UI1Section.control.rawValue {
          // clear controls
          if it.itemid == 0, var d = d {
            d.ctrl.zero()
            uiState.update(
              section: UI1Section.control.rawValue, item: -1, ui: ui1, context: context)
          }
        }
        return
      }
    }
    if uiState.type == .key && uiState.key != 0 {
      switch uiState.key {
      case Int32(Character(" ").asciiValue!):
        guard m != nil else { break }
        settings.run = !settings.run
        pert.active = []
        uiState.update(section: -1, item: -1, ui: ui0, context: context)
      case 262:  // Right
        guard let m = m, var d = d, !settings.run else { break }
        cleartimers()
        m.step(data: &d)
        profilerupdate()
        sensorupdate()
        updatesettings()
      case 266:  // Page up
        guard let m = m, pert.select > 0 else { break }
        pert.select = m.bodyParentid[Int(pert.select)]
        pert.skinselect = -1

        // stop perturbation if world reached
        if pert.select <= 0 {
          pert.active = []
        }
      case Int32(Character("]").asciiValue!):
        guard let m = m, m.ncam > 0 else { break }
        camera.type = .fixed
        // settings.camera = {0 or 1} are reserved for the free and tracking cameras
        if settings.camera < 2 || settings.camera == 2 + m.ncam - 1 {
          settings.camera = 2
        } else {
          settings.camera += 1
        }
        camera.fixedcamid = settings.camera - 2
        uiState.update(section: UI0Section.rendering.rawValue, item: -1, ui: ui0, context: context)
      case Int32(Character("[").asciiValue!):
        guard let m = m, m.ncam > 0 else { break }
        camera.type = .fixed
        // settings.camera = {0 or 1} are reserved for the free and tracking cameras
        if settings.camera <= 2 {
          settings.camera = 2 + m.ncam - 1
        } else {
          settings.camera -= 1
        }
        camera.fixedcamid = settings.camera - 2
        uiState.update(section: UI0Section.rendering.rawValue, item: -1, ui: ui0, context: context)
      case 295:  // F6
        guard m != nil else { break }
        let next = MjtFrame.allCases.index(after: MjtFrame.allCases.firstIndex(of: vopt.frame)!)
        vopt.frame =
          MjtFrame.allCases[
            next == MjtFrame.allCases.endIndex ? MjtFrame.allCases.startIndex : next]
        uiState.update(section: UI0Section.rendering.rawValue, item: -1, ui: ui0, context: context)
        break
      case 296:  // F7
        guard m != nil else { break }
        let next = MjtLabel.allCases.index(after: MjtLabel.allCases.firstIndex(of: vopt.label)!)
        vopt.label =
          MjtLabel.allCases[
            next == MjtLabel.allCases.endIndex ? MjtLabel.allCases.startIndex : next]
        uiState.update(section: UI0Section.rendering.rawValue, item: -1, ui: ui0, context: context)
        break
      case 256:  // Escape
        camera.type = .free
        settings.camera = 0
        uiState.update(section: UI0Section.rendering.rawValue, item: -1, ui: ui0, context: context)
      case Int32(Character("-").asciiValue!):
        if settings.slowdown < maxSlowdown && uiState.shift == 0 {
          settings.slowdown *= 2
          settings.speedchanged = true
        }
      case Int32(Character("=").asciiValue!):
        if settings.slowdown > 1 && uiState.shift == 0 {
          settings.slowdown /= 2
          settings.speedchanged = true
        }
      default:
        break
      }
      return
    }
    // 3D scroll
    if uiState.type == .scroll && uiState.mouserect == 3, let m = m {
      // emulate vertical mouse motion = 2% of window height
      camera.moveCamera(
        model: m, action: .zoom, reldx: 0, reldy: -zoomIncrement * uiState.sy, scene: scene)
      return
    }
    // 3D press
    if uiState.type == .press && uiState.mouserect == 3, let m = m, let d = d {
      // set perturbation
      var newperturb: MjtPertBit = []
      if uiState.control != 0 && pert.select > 0 {
        // right: translate;  left: rotate
        if uiState.right != 0 {
          newperturb = [.translate]
        } else if uiState.left != 0 {
          newperturb = [.rotate]
        }

        // perturbation onset: reset reference
        if !newperturb.isEmpty && pert.active.isEmpty {
          pert.initPerturb(model: m, data: d, scene: scene)
        }
      }
      pert.active = newperturb

      // handle double-click
      if uiState.doubleclick != 0 {
        // determine selection mode
        let selmode: Int32
        if uiState.button == .left {
          selmode = 1
        } else if uiState.control != 0 {
          selmode = 3
        } else {
          selmode = 2
        }

        // find geom and 3D click point, get corresponding body
        let r = uiState.rect.3
        var selpnt: [Double] = [0, 0, 0]
        var selgeom: [Int32] = [-1]
        var selskin: [Int32] = [-1]
        let selbody = scene.select(
          model: m, data: d, vopt: vopt, aspectratio: Double(r.width) / Double(r.height),
          relx: (uiState.x - Double(r.left)) / Double(r.width),
          rely: (uiState.y - Double(r.bottom)) / Double(r.height), selpnt: &selpnt,
          geomid: &selgeom, skinid: &selskin)

        // set lookat point, start tracking is requested
        if selmode == 2 || selmode == 3 {
          // copy selpnt if anything clicked
          if selbody >= 0 {
            camera.lookat.0 = selpnt[0]
            camera.lookat.1 = selpnt[1]
            camera.lookat.2 = selpnt[2]
          }

          // switch to tracking camera if dynamic body clicked
          if selmode == 3 && selbody > 0 {
            // mujoco camera
            camera.type = .tracking
            camera.trackbodyid = selbody
            camera.fixedcamid = -1

            // UI camera
            settings.camera = 1
            uiState.update(
              section: UI0Section.rendering.rawValue, item: -1, ui: ui0, context: context)
          }
        } else {
          // set body selection
          if selbody >= 0 {
            // record selection
            pert.select = selbody
            pert.skinselect = selskin[0]

            // compute localpos
            var tmp: (Double, Double, Double) = (0, 0, 0)
            tmp.0 = selpnt[0] - d.xpos[3 * Int(pert.select)]
            tmp.1 = selpnt[1] - d.xpos[3 * Int(pert.select) + 1]
            tmp.2 = selpnt[2] - d.xpos[3 * Int(pert.select) + 2]
            pert.localpos.0 =
              d.xmat[9 * Int(pert.select)] * tmp.0 + d.xmat[9 * Int(pert.select) + 3] * tmp.1
              + d.xmat[9 * Int(pert.select) + 6] * tmp.2
            pert.localpos.1 =
              d.xmat[9 * Int(pert.select) + 1] * tmp.0 + d.xmat[9 * Int(pert.select) + 4] * tmp.1
              + d.xmat[9 * Int(pert.select) + 7] * tmp.2
            pert.localpos.2 =
              d.xmat[9 * Int(pert.select) + 2] * tmp.0 + d.xmat[9 * Int(pert.select) + 5] * tmp.1
              + d.xmat[9 * Int(pert.select) + 8] * tmp.2
          } else {
            pert.select = 0
            pert.skinselect = -1
          }
        }

        // stop perturbation on select
        pert.active = []
      }
      return
    }

    // 3D release
    if uiState.type == .release && uiState.dragrect == 3 && m != nil {
      // stop perturbation
      pert.active = []
      return
    }

    // 3D move
    if uiState.type == .move && uiState.dragrect == 3, let m = m, let d = d {
      // determine action based on mouse button
      var action: MjtMouse
      if uiState.right != 0 {
        action = uiState.shift != 0 ? .moveH : .moveV
      } else if uiState.left != 0 {
        action = uiState.shift != 0 ? .rotateH : .rotateV
      } else {
        action = .zoom
      }

      // move perturb or camera
      let r = uiState.rect.3
      if !pert.active.isEmpty {
        pert.movePerturb(
          model: m, data: d, action: action, reldx: uiState.dx / Double(r.height),
          reldy: -uiState.dy / Double(r.height), scene: scene)
      } else {
        camera.moveCamera(
          model: m, action: action, reldx: uiState.dx / Double(r.height),
          reldy: -uiState.dy / Double(r.height), scene: scene)
      }
      return
    }
  } uiLayout: { uiState, width, height in
    // set number of rectangles
    uiState.nrect = 4
    // rect 0: entire framebuffer
    uiState.rect.0.left = 0
    uiState.rect.0.bottom = 0
    uiState.rect.0.width = width
    uiState.rect.0.height = height
    // rect 1: UI 0
    uiState.rect.1.left = 0
    uiState.rect.1.bottom = 0
    uiState.rect.1.width = settings.ui0 ? ui0.width : 0
    uiState.rect.1.height = height

    // rect 2: UI 1
    uiState.rect.2.width = settings.ui1 ? ui1.width : 0
    uiState.rect.2.left = max(0, width - uiState.rect.2.width)
    uiState.rect.2.bottom = 0
    uiState.rect.2.height = height

    // rect 3: 3D plot (everything else is an overlay)
    uiState.rect.3.left = uiState.rect.1.width
    uiState.rect.3.width = max(0, width - uiState.rect.1.width - uiState.rect.2.width)
    uiState.rect.3.bottom = 0
    uiState.rect.3.height = height
  }
  ui0.resize(context: context)
  glContext.modify(ui: ui0, uiState: &uiState, context: &context)
  glContext.dragAndDrop = {
    guard $0.count > 0 else { return }
    filename = $0.first
    settings.loadrequest = 1
  }
  func loadmodel(filename: String) {
    let model: MjModel?
    if filename.lowercased().hasSuffix(".mjb") {
      model = MjModel(fromBinaryPath: filename)
    } else {
      model = try? MjModel(fromXMLPath: filename)
    }
    guard let model = model else { return }
    var data = model.makeData()
    m = model
    d = data
    model.forward(data: &data)
    // allocate ctrlnoise
    ctrlnoise = Array(repeating: 0, count: Int(model.nu))
    // re-create scene and context
    scene.makeScene(model: model, maxgeom: maxgeom)
    context.makeContext(model: model, fontscale: ._100)
    // clear perturbation state
    pert.active = []
    pert.select = 0
    pert.skinselect = -1
    // align and scale view unless reloading the same file
    if previousFilename != filename {
      alignscale()
      previousFilename = filename
    }
    // update scene
    scene.updateScene(model: model, data: &data, option: vopt, perturb: pert, camera: &camera)
    // set window title to model name
    if let name = model.name {
      glContext.title = "Simulate : \(name)"
    }
    // set keyframe range and divisions
    ui0.sect[Int(UI0Section.simulation.rawValue)].item[5].slider.range = (
      0, Double(max(0, model.nkey - 1))
    )
    ui0.sect[Int(UI0Section.simulation.rawValue)].item[5].slider.divisions = Double(
      max(1, model.nkey - 1))
    // rebuild UI sections
    makesections()
    // full ui update
    ui0.resize(context: context)
    glContext.modify(ui: ui0, uiState: &uiState, context: &context)
    ui1.resize(context: context)
    glContext.modify(ui: ui1, uiState: &uiState, context: &context)
    updatesettings()
    settings.loadrequest = 0
  }
  glContext.runLoop(swapInterval: 1) { _, _ in
    mtx.sync {
      if settings.loadrequest == 1, let filename = filename {
        loadmodel(filename: filename)
      } else if settings.loadrequest > 1 {
        settings.loadrequest = 1
      }
      glContext.pollEvents()
      prepare()
    }
    let rect = uiState.rect.3
    var smallrect = rect
    if settings.profiler {
      smallrect.width = rect.width - rect.width / 4
    }
    rectangle(viewport: rect, r: 0.2, g: 0.3, b: 0.4, a: 1)
    context.render(viewport: rect, scene: &scene)
    // show pause/loading label
    if !settings.run || settings.loadrequest != 0 {
      context.overlay(
        font: .big, gridpos: .topright, viewport: smallrect,
        overlay: settings.loadrequest != 0 ? "loading" : "pause", overlay2: "")
    }
    // show realtime label
    if settings.run && settings.slowdown != 1 {
      let realtimeLabel = "1/\(settings.slowdown) x"
      context.overlay(
        font: .big, gridpos: .topright, viewport: smallrect, overlay: realtimeLabel, overlay2: "")
    }
    if settings.ui0 {
      ui0.render(state: uiState, context: context)
    }
    if settings.ui1 {
      ui1.render(state: uiState, context: context)
    }
    if settings.help {
      context.overlay(
        font: .normal, gridpos: .topleft, viewport: rect, overlay: helpTitle,
        overlay2: helpContent)
    }
    // show info
    if settings.info {
      context.overlay(
        font: .normal, gridpos: .bottomleft, viewport: rect, overlay: infoTitle,
        overlay2: infoContent)
    }
    // show profiler
    if settings.profiler {
      profilershow(rect: rect, context: context)
    }
    // show sensor
    if settings.sensor {
      sensorshow(rect: smallrect, context: context)
    }
    context.overlay(
      font: .normal, gridpos: .bottomleft, viewport: rect,
      overlay: "Drag-and-drop model file here", overlay2: "")
    return !settings.exitrequest
  }
  glContext.clearCallbacks()
}
