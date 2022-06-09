import MuJoCo
import XCTest

final class XMLTests: XCTestCase {

  func testLoadEmptyModel() throws {
    let model = try MjModel(fromXML: "<mujoco/>")
    XCTAssertEqual(model.nq, 0)
    XCTAssertEqual(model.nv, 0)
    XCTAssertEqual(model.nu, 0)
    XCTAssertEqual(model.na, 0)
    XCTAssertEqual(model.nbody, 1)  // worldbody exists even in empty model
    var data = model.makeData()
    model.step(data: &data)
  }

  func testInvalidXMLFailsToLoad() throws {
    do {
      let _ = try MjModel(fromXML: "<mujoc")
      XCTFail()
    } catch MjError.xml(let str) {
      XCTAssert((str?.count ?? 0) > 0)
    }
  }

  static let allTests = [
    ("testLoadEmptyModel", testLoadEmptyModel),
    ("testInvalidXMLFailsToLoad", testInvalidXMLFailsToLoad),
  ]
}
