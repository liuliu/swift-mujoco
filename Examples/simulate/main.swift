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

func profilerinit() {
}

glContext.makeCurrent {
  var scene = MjvScene(model: nil, maxgeom: maxgeom)
  // The context need to be initialized after having a GL context.
  var context = MjrContext(model: nil, fontScale: ._100)
  Task.detached(operation: simulate)
  var ui0 = MjUI()
  ui0.spacing = MjuiThemeSpacing(settings.spacing)
  ui0.color = MjuiThemeColor(settings.color)
  ui0.rectid = 1
  ui0.auxid = 0
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
  ui0.predicate = { _ in
    return true
  }
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
        // cleartimers()
        m.step(data: &d)
      // profilerupdate()
      // sensorupdate()
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
        scene.select(
          model: m, data: d, vopt: vopt, aspectratio: Double(r.width) / Double(r.height),
          relx: (uiState.x - Double(r.left)) / Double(r.width),
          rely: (uiState.y - Double(r.bottom)) / Double(r.height), selpnt: &selpnt,
          geomid: &selgeom, skinid: &selskin)

        /*
        // set lookat point, start tracking is requested
        if (selmode==2 || selmode==3) {
          // copy selpnt if anything clicked
          if (selbody>=0) {
            mju_copy3(cam.lookat, selpnt);
          }

          // switch to tracking camera if dynamic body clicked
          if (selmode==3 && selbody>0) {
            // mujoco camera
            cam.type = mjCAMERA_TRACKING;
            cam.trackbodyid = selbody;
            cam.fixedcamid = -1;

            // UI camera
            settings.camera = 1;
            mjui_update(SECT_RENDERING, -1, &ui0, &uistate, &con);
          }
        }

        // set body selection
        else {
          if (selbody>=0) {
            // record selection
            pert.select = selbody;
            pert.skinselect = selskin;

            // compute localpos
            mjtNum tmp[3];
            mju_sub3(tmp, selpnt, d->xpos+3*pert.select);
            mju_mulMatTVec(pert.localpos, d->xmat+9*pert.select, tmp, 3, 3);
          } else {
            pert.select = 0;
            pert.skinselect = -1;
          }
        }

        // stop perturbation on select
        pert.active = 0;
        */
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
    uiState.rect.1.width = ui0.width
    uiState.rect.1.height = height

    // rect 2: UI 1
    uiState.rect.2.width = 0  // settings.ui1 ? ui1.width : 0
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
  glContext.runLoop(swapInterval: 1) { width, height in
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
    }
    let viewport = MjrRect(left: 0, bottom: 0, width: width, height: height)
    rectangle(viewport: viewport, r: 0.2, g: 0.3, b: 0.4, a: 1)
    context.render(viewport: viewport, scene: &scene)
    if settings.ui0 {
      ui0.render(state: uiState, context: context)
    }
    if settings.help {
      context.overlay(
        font: .normal, gridpos: .topleft, viewport: viewport, overlay: helpTitle,
        overlay2: helpContent)
    }
    context.overlay(
      font: .normal, gridpos: .bottomleft, viewport: viewport,
      overlay: "Drag-and-drop model file here", overlay2: "")
  }
  glContext.clearCallbacks()
}
