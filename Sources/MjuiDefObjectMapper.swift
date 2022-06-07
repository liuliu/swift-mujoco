/// A mapper structure to facilitate MjObject's property mapping into MjuiDef.
///
/// This is not memory-safe. You are on your own to guarantee whatever the underlying MjObject outlives
/// this mapper. The mapper doesn't retain anything. A good architecture would co-locate the mapper
/// and the underlying object into one storage class. For simulate.swift, we worked around this by
/// having most to be global variables.
///
/// Usage:
/// ```swift
/// let mapper = MjuiDefObjectMapper(to: &theObject)
/// ui.add(defs: [mapper(\.key, .type, name:, state:, other:)
/// ```
public struct MjuiDefObjectMapper<T: MjObject> {
  private var _addr: UnsafeMutablePointer<T.CType>
  public init(to value: inout T) {
    _addr = T.withCTypeUnsafeMutablePointer(to: &value) { $0 }
  }
  public func callAsFunction(
    _ keyPath: PartialKeyPath<T.CType>, _ type: MjtItem, name: String, state: Int32, other: String,
    offsetBy distance: Int = 0
  ) -> MjuiDef {
    let offset = MemoryLayout<T.CType>.offset(of: keyPath)!
    let pdata = UnsafeMutableRawPointer(_addr) + offset + distance
    return MjuiDef(type, name: name, state: state, pdata: pdata, other: other)
  }
}
