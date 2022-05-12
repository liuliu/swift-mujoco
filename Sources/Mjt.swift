import C_mujoco

public enum MjFontScale: Int32 {
  case _50 = 50
  case _100 = 100
  case _150 = 150
  case _200 = 200
  case _250 = 250
  case _300 = 300
}

public enum MjCatBit: Int32 {
  case `static` = 1
  case dynamic = 2
  case decor = 4
  case all = 7
}
