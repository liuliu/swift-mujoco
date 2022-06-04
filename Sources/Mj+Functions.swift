import C_mujoco

///  Print matrix to screen.
@inlinable
public func print(mat: MjDoubleBufferPointer, nr: Int32, nc: Int32) {
  mat.withUnsafeBufferPointer { mat__p in
    mju_printMat(mat__p.baseAddress, nr, nc)
  }
}
///  Print sparse matrix to screen.
@inlinable
public func printMatSparse(
  mat: MjDoubleBufferPointer, nr: Int32, rownnz: MjInt32BufferPointer, rowadr: MjInt32BufferPointer,
  colind: MjInt32BufferPointer
) {
  mat.withUnsafeBufferPointer { mat__p in
    rownnz.withUnsafeBufferPointer { rownnz__p in
      rowadr.withUnsafeBufferPointer { rowadr__p in
        colind.withUnsafeBufferPointer { colind__p in
          mju_printMatSparse(
            mat__p.baseAddress, nr, rownnz__p.baseAddress, rowadr__p.baseAddress,
            colind__p.baseAddress)
        }
      }
    }
  }
}
///  Interect ray with pure geom, return nearest distance or -1 if no intersection.
@inlinable
public func rayGeom(
  pos: MjDoubleBufferPointer, mat: MjDoubleBufferPointer, size: MjDoubleBufferPointer,
  pnt: MjDoubleBufferPointer, vec: MjDoubleBufferPointer, geomtype: Int32
) -> Double {
  precondition(pos.count == 3)
  return pos.withUnsafeBufferPointer { pos__p in
    precondition(mat.count == 9)
    return mat.withUnsafeBufferPointer { mat__p in
      precondition(size.count == 3)
      return size.withUnsafeBufferPointer { size__p in
        precondition(pnt.count == 3)
        return pnt.withUnsafeBufferPointer { pnt__p in
          precondition(vec.count == 3)
          return vec.withUnsafeBufferPointer { vec__p in
            return mju_rayGeom(
              pos__p.baseAddress, mat__p.baseAddress, size__p.baseAddress, pnt__p.baseAddress,
              vec__p.baseAddress, geomtype)
          }
        }
      }
    }
  }
}
/// Interect ray with skin, return nearest distance or -1 if no intersection, and also output nearest vertex id.
@inlinable
public func raySkin<T0: MjInt32MutableBufferPointer>(
  nface: Int32, nvert: Int32, face: MjInt32BufferPointer, vert: MjFloatBufferPointer,
  pnt: MjDoubleBufferPointer, vec: MjDoubleBufferPointer, vertid: inout T0
) -> Double {
  return face.withUnsafeBufferPointer { face__p in
    return vert.withUnsafeBufferPointer { vert__p in
      precondition(pnt.count == 3)
      return pnt.withUnsafeBufferPointer { pnt__p in
        precondition(vec.count == 3)
        return vec.withUnsafeBufferPointer { vec__p in
          precondition(vertid.count == 1)
          return vertid.withUnsafeMutableBufferPointer { vertid__p in
            return mju_raySkin(
              nface, nvert, face__p.baseAddress, vert__p.baseAddress, pnt__p.baseAddress,
              vec__p.baseAddress, vertid__p.baseAddress)
          }
        }
      }
    }
  }
}
///  Rotate 3D vec in horizontal plane by angle between (0,1) and (forward_x,forward_y).
@inlinable
public func alignToCamera<T0: MjDoubleMutableBufferPointer>(
  res: inout T0, vec: MjDoubleBufferPointer, forward: MjDoubleBufferPointer
) {
  precondition(res.count == 3)
  res.withUnsafeMutableBufferPointer { res__p in
    precondition(vec.count == 3)
    vec.withUnsafeBufferPointer { vec__p in
      precondition(forward.count == 3)
      forward.withUnsafeBufferPointer { forward__p in
        mjv_alignToCamera(res__p.baseAddress, vec__p.baseAddress, forward__p.baseAddress)
      }
    }
  }
}
///  Draw rectangle.
@inlinable
public func rectangle(viewport: MjrRect, r: Float, g: Float, b: Float, a: Float) {
  mjr_rectangle(viewport, r, g, b, a)
}
///  Main error function; does not return to caller.
@inlinable
public func error(msg: String) {
  mju_error(msg)
}
///  Error function with int argument; msg is a printf format string.
@inlinable
public func error_i(msg: String, i: Int32) {
  mju_error_i(msg, i)
}
///  Error function with string argument.
@inlinable
public func error_s(msg: String, text: String) {
  mju_error_s(msg, text)
}
///  Main warning function; returns to caller.
@inlinable
public func warning(msg: String) {
  mju_warning(msg)
}
///  Warning function with int argument.
@inlinable
public func warning_i(msg: String, i: Int32) {
  mju_warning_i(msg, i)
}
///  Warning function with string argument.
@inlinable
public func warning_s(msg: String, text: String) {
  mju_warning_s(msg, text)
}
///  Write [datetime, type: message] to MUJOCO_LOG.TXT.
@inlinable
public func writeLog(type: String, msg: String) {
  mju_writeLog(type, msg)
}
///  Convert type id (mjtObj) to type name.
@inlinable
public func type2Str(type: Int32) -> String? {
  return String(cString: mju_type2Str(type), encoding: .utf8)
}
///  Construct a warning message given the warning type and info.
@inlinable
public func warningText(warning: Int32, info: Int32) -> String? {
  return String(cString: mju_warningText(warning, info), encoding: .utf8)
}
