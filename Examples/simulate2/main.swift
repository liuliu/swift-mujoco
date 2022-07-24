import Foundation
import MuJoCo
import Numerics

let simulate = Simulate(width: 1280, height: 720)
if CommandLine.arguments.count > 1 {
  simulate.filename = CommandLine.arguments[1]
  simulate.loadrequest = 2
}
simulate.makeContext()
simulate.run()
