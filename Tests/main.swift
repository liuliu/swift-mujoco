#if os(Linux)
  import XCTest

  XCTMain([
    testCase(XMLTests.allTests),
    testCase(TupleTests.allTests),
  ])

#endif
