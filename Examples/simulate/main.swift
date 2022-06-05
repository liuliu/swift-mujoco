import Foundation
import MuJoCo
import Numerics

struct Settings {
  var exitrequest = false
  var slowdown: Int32 = 1
  var speedchanged = false
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
  @MjuiDefState(.editint, name: "Index", state: 2, other: "1")
  var index: Int32 = 0
  var loadrequest: Int32 = 0
}

enum UI0Section: Int32 {
  // left ui
  case file = 0
  case option
  case simulation
  case watch
  case physics
  case rendering
  case group
}

enum UI1Section: Int32 {
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
  glContext.setCallbacks(uiState: &uiState) { uiState in
    if uiState.dragrect == ui0.rectid || (uiState.dragrect == 0 && uiState.mouserect == ui0.rectid)
      || uiState.type == .key
    {
      let it = ui0.event(state: &uiState, context: context)
      if let it = it {
        if it.sectionid == UI0Section.file.rawValue {
          // File
        } else if it.sectionid == UI0Section.option.rawValue {
          // Option
        } else if it.sectionid == UI0Section.simulation.rawValue {
          // Simulation
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
      // updatesettings()
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
  glContext.runLoop(swapInterval: 1) { _, _ in
    mtx.sync {
      if settings.loadrequest == 1, let filename = filename {
        let model = try! MjModel(fromXMLPath: filename)
        var data = model.makeData()
        ctrlnoise = Array(repeating: 0, count: Int(model.nu))
        m = model
        d = data
        model.forward(data: &data)
        scene.makeScene(model: model, maxgeom: maxgeom)
        context.makeContext(model: model, fontscale: ._100)
        ui0.resize(context: context)
        glContext.modify(ui: ui0, uiState: &uiState, context: &context)
        settings.loadrequest = 0
      } else if settings.loadrequest > 1 {
        settings.loadrequest = 1
      }
      glContext.pollEvents()
      if let m = m, var d = d {
        scene.updateScene(model: m, data: &d, option: vopt, perturb: pert, camera: &camera)
      }
      if settings.profiler && settings.run {
        profilerupdate()
      }
      if settings.sensor && settings.run {
        sensorupdate()
      }
      cleartimers()
    }
    let rect = uiState.rect.3
    var smallrect = rect
    if settings.profiler {
      smallrect.width = rect.width - rect.width / 4
    }
    rectangle(viewport: rect, r: 0.2, g: 0.3, b: 0.4, a: 1)
    context.render(viewport: rect, scene: &scene)
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
  }
  glContext.clearCallbacks()
}
