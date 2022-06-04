import C_mujoco

/// per-iteration solver statistics
///
/// This is the data structure holding information about one solver iteration. mjData.solver is a preallocated array of mjSolverStat data structures, one for each iteration of the solver, up to a maximum of mjNSOLVER. The actual number of solver iterations is given by mjData.solver_iter.
public typealias MjSolverStat = mjSolverStat
