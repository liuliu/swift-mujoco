import C_mujoco

extension MjuiThemeSpacing: MjObject {
  public typealias CType = mjuiThemeSpacing_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try withUnsafeMutablePointer(to: &value._themespacing, body)
  }
}
extension MjuiDef: MjObject {
  public typealias CType = mjuiDef_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try withUnsafeMutablePointer(to: &value._def, body)
  }
}
extension MjvFigure: MjObject {
  public typealias CType = mjvFigure_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try body(value._figure)
  }
}
extension MjvScene: MjObject {
  public typealias CType = mjvScene_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try body(value._scene)
  }
}
extension MjStatistic: MjObject {
  public typealias CType = mjStatistic_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try withUnsafeMutablePointer(to: &value, body)
  }
}
extension MjWarningStat: MjObject {
  public typealias CType = mjWarningStat_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try withUnsafeMutablePointer(to: &value, body)
  }
}
extension MjuiThemeColor: MjObject {
  public typealias CType = mjuiThemeColor_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try withUnsafeMutablePointer(to: &value._themecolor, body)
  }
}
extension MjData: MjObject {
  public typealias CType = mjData_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try body(value._data)
  }
}
extension MjOption: MjObject {
  public typealias CType = mjOption_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try withUnsafeMutablePointer(to: &value._option, body)
  }
}
extension MjuiItem: MjObject {
  public typealias CType = mjuiItem_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try body(value._item)
  }
}
extension MjvLight: MjObject {
  public typealias CType = mjvLight_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try withUnsafeMutablePointer(to: &value, body)
  }
}
extension MjvGeom: MjObject {
  public typealias CType = mjvGeom_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try withUnsafeMutablePointer(to: &value._geom, body)
  }
}
extension MjuiSection: MjObject {
  public typealias CType = mjuiSection_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try body(value._section)
  }
}
extension MjContact: MjObject {
  public typealias CType = mjContact_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try withUnsafeMutablePointer(to: &value._contact, body)
  }
}
extension MjSolverStat: MjObject {
  public typealias CType = mjSolverStat_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try withUnsafeMutablePointer(to: &value, body)
  }
}
extension MjTimerStat: MjObject {
  public typealias CType = mjTimerStat_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try withUnsafeMutablePointer(to: &value, body)
  }
}
extension MjUI: MjObject {
  public typealias CType = mjUI_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try body(value._ui)
  }
}
extension MjModel: MjObject {
  public typealias CType = mjModel_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try body(value._model)
  }
}
extension MjuiItemSlider: MjObject {
  public typealias CType = mjuiItemSlider_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try body(value._itemslider)
  }
}
extension MjvGLCamera: MjObject {
  public typealias CType = mjvGLCamera_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try withUnsafeMutablePointer(to: &value._glcamera, body)
  }
}
extension MjuiItemMulti: MjObject {
  public typealias CType = mjuiItemMulti_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try body(value._itemmulti)
  }
}
extension MjuiState: MjObject {
  public typealias CType = mjuiState_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try withUnsafeMutablePointer(to: &value._state, body)
  }
}
extension MjVisual: MjObject {
  public typealias CType = mjVisual_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try withUnsafeMutablePointer(to: &value._visual, body)
  }
}
extension MjvOption: MjObject {
  public typealias CType = mjvOption_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try withUnsafeMutablePointer(to: &value._option, body)
  }
}
extension MjLROpt: MjObject {
  public typealias CType = mjLROpt_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try withUnsafeMutablePointer(to: &value._lropt, body)
  }
}
extension MjrContext: MjObject {
  public typealias CType = mjrContext_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try body(value._context)
  }
}
extension MjvCamera: MjObject {
  public typealias CType = mjvCamera_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try withUnsafeMutablePointer(to: &value._camera, body)
  }
}
extension MjVFS: MjObject {
  public typealias CType = mjVFS_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try body(value._vfs)
  }
}
extension MjrRect: MjObject {
  public typealias CType = mjrRect_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try withUnsafeMutablePointer(to: &value, body)
  }
}
extension MjuiItemSingle: MjObject {
  public typealias CType = mjuiItemSingle_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try body(value._itemsingle)
  }
}
extension MjuiItemEdit: MjObject {
  public typealias CType = mjuiItemEdit_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try body(value._itemedit)
  }
}
extension MjvPerturb: MjObject {
  public typealias CType = mjvPerturb_
  public static func withCTypeUnsafeMutablePointer<R>(
    to value: inout Self, _ body: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R {
    try withUnsafeMutablePointer(to: &value._perturb, body)
  }
}
