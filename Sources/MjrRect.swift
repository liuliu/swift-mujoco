import C_mujoco

public typealias MjrRect = mjrRect

extension Array where Element == MjrRect {
  @inlinable
  public func findRect(x: Int32, y: Int32) -> Int32 {
    return withUnsafeBufferPointer {
      return mjr_findRect(x, y, Int32($0.count), $0.baseAddress)
    }
  }
}
