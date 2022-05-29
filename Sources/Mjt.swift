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
public enum MjtEnableBit: Int32 {
  case override = 1
  case energy = 2
  case fwdinv = 4
  case sensornoise = 8
  case multiccd = 16
}
public enum MjtJoint: Int32 {
  case free = 0
  case ball
  case slide
  case hingeRotationAngleRadAroundBodyFixedAxis_1
}
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
public enum MjtCamLight: Int32 {
  case fixed = 0
  case track
  case trackcom
  case targetbody
  case targetbodycomPosFixedInBody
}
public enum MjtTexture: Int32 {
  case _2d = 0
  case cube
  case skyboxCubeTextureUsedAsSkybox
}
public enum MjtIntegrator: Int32 {
  case euler = 0
  case rk4
  case implicitImplicitInVelocity
}
public enum MjtCollision: Int32 {
  case all = 0
  case pair
  case dynamicTestDynamicPairsOnly
}
public enum MjtCone: Int32 {
  case pyramidal = 0
  case ellipticElliptic
}
public enum MjtJacobian: Int32 {
  case dense = 0
  case sparse
  case autoDenseIfNv_60
}
public enum MjtSolver: Int32 {
  case pgs = 0
  case cg
  case newtonNewtonPrimal
}
public enum MjtEq: Int32 {
  case connect = 0
  case weld
  case joint
  case tendon
  case distanceFixTheContactDistanceBetweentTwoGeoms
}
public enum MjtWrap: Int32 {
  case none = 0
  case joint
  case pulley
  case site
  case sphere
  case cylinderWrapAroundInfiniteCylinder
}
public enum MjtTrn: Int32 {
  case joint = 0
  case jointinparent
  case slidercrank
  case tendon
  case site
  case undefined = 1000
}
public enum MjtDyn: Int32 {
  case none = 0
  case integrator
  case filter
  case muscle
  case userUserDefinedDynamicsType
}
public enum MjtGain: Int32 {
  case fixed = 0
  case muscle
  case userUserDefinedGainType
}
public enum MjtBias: Int32 {
  case none = 0
  case affine
  case muscle
  case userUserDefinedBiasType
}
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
  case keyKeyframe
}
public enum MjtConstraint: Int32 {
  case equality = 0
  case frictionDof
  case frictionTendon
  case limitJoint
  case limitTendon
  case contactFrictionless
  case contactPyramidal
  case contactEllipticFrictionalContact
}
public enum MjtConstraintState: Int32 {
  case satisfied = 0
  case quadratic
  case linearneg
  case linearpos
  case coneSquaredDistanceToConeCostEllipticContact
}
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
  case userSensorDataProvidedByMjcbSensorCallback
}
public enum MjtStage: Int32 {
  case none = 0
  case pos
  case vel
  case accAccelerationForceDependentComputations
}
public enum MjtDataType: Int32 {
  case real = 0
  case positive
  case axis
  case quaternionUnitQuaternion
}
public enum MjtLRMode: Int32 {
  case none = 0
  case muscle
  case muscleuser
  case allProcessAllActuators
}
public enum MjtGridPos: Int32 {
  case topleft = 0
  case topright
  case bottomleft
  case bottomrightBottomRight
}
public enum MjtFramebuffer: Int32 {
  case window = 0
  case offscreenOffscreenBuffer
}
public enum MjtFontScale: Int32 {
  case _50 = 50
  case _100 = 100
  case _150 = 150
  case _200 = 200
  case _250 = 250
  case _300 = 300
}
public enum MjtFont: Int32 {
  case normal = 0
  case shadow
  case bigBigFontForUserAlerts
}
public enum MjtButton: Int32 {
  case none = 0
  case left
  case right
  case middleMiddleButton
}
public enum MjtEvent: Int32 {
  case none = 0
  case move
  case press
  case release
  case scroll
  case key
  case resizeResize
}
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
public enum MjtCatBit: Int32 {
  case `static` = 1
  case `dynamic` = 2
  case decor = 4
  case all = 7
}
public enum MjtMouse: Int32 {
  case none = 0
  case rotateV
  case rotateH
  case moveV
  case moveH
  case zoom
  case selectSelection
}
public enum MjtPertBit: Int32 {
  case translate = 1
  case rotate = 2
}
public enum MjtCamera: Int32 {
  case free = 0
  case tracking
  case fixed
  case userUserIsResponsibleForSettingOpenglCamera
}
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
public enum MjtStereo: Int32 {
  case none = 0
  case quadbuffered
  case sidebysideSideBySide
}
