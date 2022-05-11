import C_mujoco

public final class MjVFS {
  private let _vfs: OpaquePointer
  init(vfs: OpaquePointer) {
    _vfs = vfs
  }
}
