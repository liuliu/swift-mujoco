#if os(Linux)
  import XCTest

  XCTMain([
    testCase(ModelTests.allTests),
  ])

#endif
