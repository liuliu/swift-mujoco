#if os(Linux)
  import XCTest

  XCTMain([
    testCase(XMLTests.allTests)
  ])

#endif
