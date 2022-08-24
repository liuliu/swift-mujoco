import MuJoCo
import XCTest

final class TupleTests: XCTestCase {

  func testMjuiState() throws {
    var uiState = MjuiState()
    uiState.rect.0 = MjrRect(left: 0, bottom: 0, width: 100, height: 100)
    uiState.rect.1 = MjrRect(left: 10, bottom: 100, width: 10, height: 10)
    uiState.rect.2 = MjrRect(left: 1, bottom: 10, width: 10, height: 10)
    let rect2 = withUnsafePointer(to: uiState.rect) {
      UnsafeRawPointer($0).assumingMemoryBound(to: MjrRect.self)[2]
    }
    XCTAssertEqual(rect2.left, 1)
    XCTAssertEqual(rect2.bottom, 10)
    XCTAssertEqual(rect2.width, 10)
    XCTAssertEqual(rect2.height, 10)
  }

  func testVFS() throws {
    var vfs = MjVFS()
    vfs.makeEmptyFile(filename: "file1", filesize: 123)
    vfs.makeEmptyFile(filename: "file2", filesize: 234)
    XCTAssertEqual(vfs.filesize[0], 123)
    XCTAssertEqual(vfs.filesize[1], 234)
    XCTAssertEqual(vfs.filename[0], "file1")
    XCTAssertEqual(vfs.filename[1], "file2")
  }

  func testVopt() throws {
    var vopt = MjvOption()
    vopt.jointgroup.0 = 10
    vopt.jointgroup.1 = 4
    vopt.jointgroup.2 = 5
    vopt.jointgroup.3 = 22
    vopt.jointgroup.4 = 32
    let jointgroup4 = withUnsafePointer(to: vopt.jointgroup) {
      UnsafeRawPointer($0).assumingMemoryBound(to: type(of: vopt.jointgroup.0))[4]
    }
    XCTAssertEqual(jointgroup4, 32)
  }

  func testFigure() throws {
    var figure = MjvFigure()
    figure.xformat = "string %d"
    XCTAssertEqual(figure.xformat, "string %d")
    figure.linedata[1, 1] = (10, 12)
    XCTAssertEqual(figure.linedata[1, 1].0, 10)
    XCTAssertEqual(figure.linedata[1, 1].1, 12)
  }

  static let allTests = [
    ("testMjuiState", testMjuiState),
    ("testVFS", testVFS),
    ("testVopt", testVopt),
    ("testFigure", testFigure),
  ]
}
