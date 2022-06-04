/// warning types
public enum MjtWarning: Int32 {
  case inertia = 0
  case contactfull
  case cnstrfull
  case vgeomfull
  case badqpos
  case badqvel
  case badqacc
  case badctrl
}
public enum MjtTimer: Int32 {
  case step = 0
  case forward
  case inverse
  case position
  case velocity
  case actuation
  case acceleration
  case constraint
  case posKinematics
  case posInertia
  case posCollision
  case posMake
  case posProject
}
/// disable default feature bitflags
public enum MjtDisableBit: Int32 {
  case constraint = 1
  case equality = 2
  case frictionloss = 4
  case limit = 8
  case contact = 16
  case passive = 32
  case gravity = 64
  case clampctrl = 128
  case warmstart = 256
  case filterparent = 512
  case actuation = 1024
  case refsafe = 2048
}
/// enable optional feature bitflags
public enum MjtEnableBit: Int32 {
  case override = 1
  case energy = 2
  case fwdinv = 4
  case sensornoise = 8
  case multiccd = 16
}
/// type of degree of freedom
public enum MjtJoint: Int32 {
  case free = 0
  case ball
  case slide
  case hinge
}
/// type of geometric shape
public enum MjtGeom: Int32 {
  case plane = 0
  case hfield
  case sphere
  case capsule
  case ellipsoid
  case cylinder
  case box
  case mesh
  case arrow = 100
  case arrow1
  case arrow2
  case line
  case skin
  case label
  case none = 1001
}
/// tracking mode for camera and light
public enum MjtCamLight: Int32 {
  case fixed = 0
  case track
  case trackcom
  case targetbody
  case targetbodycom
}
/// type of texture
public enum MjtTexture: Int32 {
  case _2d = 0
  case cube
  case skybox
}
/// integrator mode
public enum MjtIntegrator: Int32 {
  case euler = 0
  case rk4
  case implicit
}
/// collision mode for selecting geom pairs
public enum MjtCollision: Int32 {
  case all = 0
  case pair
  case `dynamic`
}
/// type of friction cone
public enum MjtCone: Int32 {
  case pyramidal = 0
  case elliptic
}
/// type of constraint Jacobian
public enum MjtJacobian: Int32 {
  case dense = 0
  case sparse
  case auto
}
/// constraint solver algorithm
public enum MjtSolver: Int32 {
  case pgs = 0
  case cg
  case newton
}
/// type of equality constraint
public enum MjtEq: Int32 {
  case connect = 0
  case weld
  case joint
  case tendon
  case distance
}
/// type of tendon wrap object
public enum MjtWrap: Int32 {
  case none = 0
  case joint
  case pulley
  case site
  case sphere
  case cylinder
}
/// type of actuator transmission
public enum MjtTrn: Int32 {
  case joint = 0
  case jointinparent
  case slidercrank
  case tendon
  case site
  case undefined = 1000
}
/// type of actuator dynamics
public enum MjtDyn: Int32 {
  case none = 0
  case integrator
  case filter
  case muscle
  case user
}
/// type of actuator gain
public enum MjtGain: Int32 {
  case fixed = 0
  case muscle
  case user
}
/// type of actuator bias
public enum MjtBias: Int32 {
  case none = 0
  case affine
  case muscle
  case user
}
/// type of MujoCo object
public enum MjtObj: Int32 {
  case unknown = 0
  case body
  case xbody
  case joint
  case dof
  case geom
  case site
  case camera
  case light
  case mesh
  case skin
  case hfield
  case texture
  case material
  case pair
  case exclude
  case equality
  case tendon
  case actuator
  case sensor
  case numeric
  case text
  case tuple
  case key
}
/// type of constraint
public enum MjtConstraint: Int32 {
  case equality = 0
  case frictionDof
  case frictionTendon
  case limitJoint
  case limitTendon
  case contactFrictionless
  case contactPyramidal
  case contactElliptic
}
/// constraint state
public enum MjtConstraintState: Int32 {
  case satisfied = 0
  case quadratic
  case linearneg
  case linearpos
  case cone
}
/// type of sensor
public enum MjtSensor: Int32 {
  case touch = 0
  case accelerometer
  case velocimeter
  case gyro
  case force
  case torque
  case magnetometer
  case rangefinder
  case jointpos
  case jointvel
  case tendonpos
  case tendonvel
  case actuatorpos
  case actuatorvel
  case actuatorfrc
  case ballquat
  case ballangvel
  case jointlimitpos
  case jointlimitvel
  case jointlimitfrc
  case tendonlimitpos
  case tendonlimitvel
  case tendonlimitfrc
  case framepos
  case framequat
  case framexaxis
  case frameyaxis
  case framezaxis
  case framelinvel
  case frameangvel
  case framelinacc
  case frameangacc
  case subtreecom
  case subtreelinvel
  case subtreeangmom
  case user
}
/// computation stage
public enum MjtStage: Int32 {
  case none = 0
  case pos
  case vel
  case acc
}
/// data type for sensors
public enum MjtDataType: Int32 {
  case real = 0
  case positive
  case axis
  case quaternion
}
/// mode for actuator length range computation
public enum MjtLRMode: Int32 {
  case none = 0
  case muscle
  case muscleuser
  case all
}
/// grid position for overlay
public enum MjtGridPos: Int32 {
  case topleft = 0
  case topright
  case bottomleft
  case bottomright
}
/// OpenGL framebuffer option
public enum MjtFramebuffer: Int32 {
  case window = 0
  case offscreen
}
/// font scale, used at context creation
public enum MjtFontScale: Int32 {
  case _50 = 50
  case _100 = 100
  case _150 = 150
  case _200 = 200
  case _250 = 250
  case _300 = 300
}
/// font type, used at each text operation
public enum MjtFont: Int32 {
  case normal = 0
  case shadow
  case big
}
/// mouse button
public enum MjtButton: Int32 {
  case none = 0
  case left
  case right
  case middle
}
/// mouse and keyboard event type
public enum MjtEvent: Int32 {
  case none = 0
  case move
  case press
  case release
  case scroll
  case key
  case resize
}
/// UI item type
public enum MjtItem: Int32 {
  case end = -2
  case section = -1
  case separator = 0
  case `static`
  case button
  case checkint
  case checkbyte
  case radio
  case radioline
  case select
  case sliderint
  case slidernum
  case editint
  case editnum
  case edittxt
}
/// bitflags for mjvGeom category
public enum MjtCatBit: Int32 {
  case `static` = 1
  case `dynamic` = 2
  case decor = 4
  case all = 7
}
/// mouse interaction mode
public enum MjtMouse: Int32 {
  case none = 0
  case rotateV
  case rotateH
  case moveV
  case moveH
  case zoom
  case select
}
/// mouse perturbations
public enum MjtPertBit: Int32 {
  case translate = 1
  case rotate = 2
}
/// abstract camera type
public enum MjtCamera: Int32 {
  case free = 0
  case tracking
  case fixed
  case user
}
/// object labeling
public enum MjtLabel: Int32 {
  case none = 0
  case body
  case joint
  case geom
  case site
  case camera
  case light
  case tendon
  case actuator
  case constraint
  case skin
  case selection
  case selpnt
  case contactforce
}
/// frame visualization
public enum MjtFrame: Int32 {
  case none = 0
  case body
  case geom
  case site
  case camera
  case light
  case contact
  case world
}
/// flags enabling model element visualization
public enum MjtVisFlag: Int32 {
  case convexhull = 0
  case texture
  case joint
  case actuator
  case camera
  case light
  case tendon
  case rangefinder
  case constraint
  case inertia
  case sclinertia
  case pertforce
  case pertobj
  case contactpoint
  case contactforce
  case contactsplit
  case transparent
  case autoconnect
  case com
  case select
  case `static`
  case skin
}
/// flags enabling rendering effects
public enum MjtRndFlag: Int32 {
  case shadow = 0
  case wireframe
  case reflection
  case additive
  case skybox
  case fog
  case haze
  case segment
  case idcolor
}
/// type of stereo rendering
public enum MjtStereo: Int32 {
  case none = 0
  case quadbuffered
  case sidebyside
}
