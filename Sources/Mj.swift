import C_mujoco

/// Print internal XML schema as plain text or HTML, with style-padding or &nbsp;.
@inlinable
public func printSchema(filename: String, flgHtml: Int32, flgPad: Int32) -> Int32 {
  return mj_printSchema(filename, nil, 0, flgHtml, flgPad)
}
/// Print internal XML schema as plain text or HTML, with style-padding or &nbsp;.
@inlinable
public func printSchema(flgHtml: Int32, flgPad: Int32) -> String {
  var schemaStr = UnsafeMutablePointer<CChar>.allocate(capacity: 1024)
  // If the str is bigger, try to expand.
  let strSz = mj_printSchema(nil, schemaStr, 1024, flgHtml, flgPad)
  if strSz >= 1024 {
    schemaStr.deallocate()
    schemaStr = UnsafeMutablePointer<CChar>.allocate(capacity: Int(strSz) + 1)
    mj_printSchema(nil, schemaStr, strSz + 1, flgHtml, flgPad)
  }
  let ret = String(cString: schemaStr, encoding: .utf8) ?? ""
  schemaStr.deallocate()
  return ret
}
/// Free last XML model if loaded. Called internally at each load.
@inlinable
public func freeLastXML() {
  mj_freeLastXML()
}
