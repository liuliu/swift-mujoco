/// A protocol all Mj* struct conforms to to faciliate some reflection. The conformance is generated in MjObject+Extensions.swift
public protocol MjObject {
  associatedtype CType
  static func withCTypeUnsafeMutablePointer<R>(
    to: inout Self, _: (UnsafeMutablePointer<CType>) throws -> R
  ) rethrows -> R
}
