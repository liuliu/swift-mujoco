import C_mujoco
import Foundation

public final class MjVFS {
  @usableFromInline
  var _vfs: UnsafeMutablePointer<mjVFS>

  deinit {
    mj_deleteVFS(_vfs)
    _vfs.deallocate()
  }

  public init() {
    _vfs = UnsafeMutablePointer.allocate(capacity: 1)
    mj_defaultVFS(_vfs)
  }

  public convenience init(assets: [String: Data]) {
    self.init()
    for (key, value) in assets {
      makeEmptyFile(filename: key, filesize: Int32(value.count))
      value.withUnsafeBytes {
        filedata[Int(nfile - 1)]?.copyMemory(from: $0.baseAddress!, byteCount: $0.count)
      }
    }
  }
}

extension MjVFS {
  @inlinable
  @discardableResult
  public func addFile(directory: String, filename: String) -> Int32 {
    return mj_addFileVFS(_vfs, directory, filename)
  }

  @inlinable
  @discardableResult
  public func makeEmptyFile(filename: String, filesize: Int32) -> Int32 {
    return mj_makeEmptyFileVFS(_vfs, filename, filesize)
  }

  @inlinable
  public func findFile(filename: String) -> Int32 {
    return mj_findFileVFS(_vfs, filename)
  }

  @inlinable
  @discardableResult
  public func deleteFile(filename: String) -> Int32 {
    return mj_deleteFileVFS(_vfs, filename)
  }

  @inlinable
  public var filesize: MjArray<Int32> {
    withUnsafeMutablePointer(to: &_vfs.pointee.filesize.0) {
      MjArray<Int32>(array: $0, object: self, len: mjMAXVFS)
    }
  }

  @inlinable
  public var filedata: MjArray<UnsafeMutableRawPointer?> {
    withUnsafeMutablePointer(to: &_vfs.pointee.filedata.0) {
      MjArray<UnsafeMutableRawPointer?>(array: $0, object: self, len: mjMAXVFS)
    }
  }

  @inlinable
  public var filename: MjStaticStringArray {
    withUnsafeMutablePointer(to: &_vfs.pointee.filename.0.0) {
      MjStaticStringArray(array: $0, object: self, len: mjMAXVFS, strlen: mjMAXVFSNAME)
    }
  }

  @inlinable
  public var nfile: Int32 {
    _vfs.pointee.nfile
  }
}
