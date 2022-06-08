import C_mujoco
import Foundation

/// virtual file system for loading from memory
///
/// This is the data structure with the virtual file system. It can only be constructed programmatically, and does not have an analog in MJCF.
public struct MjVFS {
  @usableFromInline
  let _storage = Storage()
  @inlinable
  var _vfs: UnsafeMutablePointer<mjVFS> { _storage._vfs }

  @usableFromInline
  final class Storage {
    @usableFromInline
    let _vfs: UnsafeMutablePointer<mjVFS>

    deinit {
      mj_deleteVFS(_vfs)
      _vfs.deallocate()
    }

    init() {
      _vfs = UnsafeMutablePointer.allocate(capacity: 1)
      mj_defaultVFS(_vfs)
    }
  }

  public init() {}

  public init(assets: [String: Data]) {
    for (key, value) in assets {
      makeEmptyFile(filename: key, filesize: Int32(value.count))
      value.withUnsafeBytes {
        filedata[Int(nfile - 1)]?.copyMemory(from: $0.baseAddress!, byteCount: $0.count)
      }
    }
  }
}

extension MjVFS {
  /// Add file to VFS, return 0: success, 1: full, 2: repeated name, -1: failed to load.
  @inlinable
  @discardableResult
  public mutating func addFile(directory: String, filename: String) -> Int32 {
    return mj_addFileVFS(_vfs, directory, filename)
  }

  /// Make empty file in VFS, return 0: success, 1: full, 2: repeated name.
  @inlinable
  @discardableResult
  public mutating func makeEmptyFile(filename: String, filesize: Int32) -> Int32 {
    return mj_makeEmptyFileVFS(_vfs, filename, filesize)
  }

  /// Return file index in VFS, or -1 if not found in VFS.
  @inlinable
  public func findFile(filename: String) -> Int32 {
    return mj_findFileVFS(_vfs, filename)
  }

  /// Delete file from VFS, return 0: success, -1: not found in VFS.
  @inlinable
  @discardableResult
  public mutating func deleteFile(filename: String) -> Int32 {
    return mj_deleteFileVFS(_vfs, filename)
  }

  /// file size in bytes
  @inlinable
  public var filesize: MjArray<Int32> {
    withUnsafeMutablePointer(to: &_vfs.pointee.filesize.0) {
      MjArray<Int32>(array: $0, object: _storage, len: mjMAXVFS)
    }
  }

  /// buffer with file data
  @inlinable
  public var filedata: MjArray<UnsafeMutableRawPointer?> {
    withUnsafeMutablePointer(to: &_vfs.pointee.filedata.0) {
      MjArray<UnsafeMutableRawPointer?>(array: $0, object: _storage, len: mjMAXVFS)
    }
  }

  /// file name without path
  @inlinable
  public var filename: MjStaticStringArray {
    withUnsafeMutablePointer(to: &_vfs.pointee.filename.0.0) {
      MjStaticStringArray(array: $0, object: _storage, len: mjMAXVFS, strlen: mjMAXVFSNAME)
    }
  }

  /// number of files present
  @inlinable
  public var nfile: Int32 {
    _vfs.pointee.nfile
  }
}

extension MjVFS: CustomReflectable {
  public var customMirror: Mirror {
    Mirror(
      self,
      children: ["filesize": filesize, "filedata": filedata, "filename": filename, "nfile": nfile])
  }
}
