# MuJoCo for Swift

This is a Swift binding for [MuJoCo](https://mujoco.org) physics simulation library.

[MuJoCo](https://mujoco.org) is a very accurate CPU-based physics simulation library. Since its acquisition by [DeepMind](https://github.com/deepmind/mujoco), MuJoCo has been more readily available broadly.

MuJoCo is at the heart of physics simulation in the realm of [deep reinforcement learning](https://spinningup.openai.com/en/latest/algorithms/ppo.html). In [OpenAI Gym](https://gym.openai.com/envs/#mujoco), there are many diverse environments simulated with MuJoCo.

Up until now, I only dipped a bit into DRL with https://github.com/liuliu/s4nnc/tree/main/examples. OpenAI Gym is OK for these simple mechanisms and I don't mind to wait a few minutes more. But most recently, I grown interests in more serious use of DRL / PPO under Sim2Real banner. For these, it is popular to either use [Isaac Gym](https://developer.nvidia.com/isaac-gym) or exploiting multi-core for environment runs. For later, doing it with `multiprocess` package of Python is awkward but the preferred way.

If we can run MuJoCo from Swift, we can avoid the trip into Python entirely and simply use `DispatchQueue.concurrentPerform` for environment runs.

## Automatic Interface Generation

### Struct

A mixed strategy was used for MuJoCo interface generation. MuJoCo's API heavily leans towards exposed public C structs. MuJoCo for Swift has to expose these C structs. Wrappers for these C structs are manually created with following principles:

 * If possible, simply `typealias` to its C struct;
 * If not, refer a `public struct` with C struct interior, keeping the memory layout exactly the same (can better expose certain properties, more on that later);
 * If there are associated heap data, typically, with `mj_deleteXXX` methods. These are `public struct` with a `final class Storage` interior to track lifetime.

Which out of the three implemented was tracked in `Sources/codegen/functionExtension.swift`. We later generated `Sources/MjObject+Extensions.swift` to encode above strategies into Swift protocol. All `MjStruct` conforms to this protocol which provides associated type of the underlying C struct, as well as the memory access method `withCTypeUnsafeMutablePointer(to:)`.

MuJoCo's C headers are parsed and used to generate properties on structs and functions on structs. These are `XX+Extensions.swift` and `XX+Functions.swift` files. All accessors are generated for public C structs from MuJoCo.

They can be reproduced with:

```
bazel run Sources:codegen -- ~/workspace/swift-mujoco/Sources/ ~/workspace/mujoco/include/mujoco/*.h
```

Extra care was taken to make sure comments are properly parsed and added to these extensions. <https://liuliu.github.io/swift-mujoco> is the documentation generated based on these comments.

`MjArray<T>` is the array type that exposes static or dynamic arrays within a C struct. It retains the underlying storage to make sure the access is safe. It also conforms to set of protocols such that for `inout` parameters and other array parameters, you can either pass vanilla array or `MjArray<T>` (or `MjTuple`, through .tuple()) and expect it just works.

### Enum

`enum` are parsed and generated in `Mjt.swift` file. Because there is no type annotation, we do our best to infer which int type are enums from comment. `MjtEnableBit`, `MjtDisableBit`, `MjtCatBit` and `MjtPertBit` are special handled to be `OptionSet`.

### Functions

C functions are not scoped to a particular object. We have to infer these. First, we try to infer which group of APIs it belongs to with the prefix: `mj_` matches `mjXX` structs, `mjv_` matches `mjvXX` structs. We prefer the first parameter, otherwise the last parameter (as it is often used as write to). If no suitable object to be found, it is a free function.

The interface generation process also treats `const` annotation seriously. Without `const`, these methods are annotated with `mutating`. If the parameter is a pointer without `const`, it is annotated with `inout`.

Not all functions are automatically generated, some of these are manually implemented because:

 * The C API can be better refactored to Swift API. For example, `mj_loadXML` can be better translated with `throws` for errors;
 * Some parameters can be nil, but during automatic interface generation, we assumed all parameters to be non-nil.

### MjUI

Whenever possible, we lean towards automatic interface generation. That's why we kept certain APIs in a way that look weird. `MjUI` has many quirks that at odds with this philosophy. In particular, `MjuiDef` automatically associated the UI control with the underlying storage `pdata`. Because `pdata` is a pointer, it has no regards to the underlying storage lifetime. A set of property wrappers: `MjuiDefState`, `MjuiDefStateMap` are introduced to solve this issue. Although users are still responsible to make sure the underlying storage lifetime longer than `MjUI` itself, you don't need to deal with raw `pdata`. A `MjuiDefObjectMapper` is introduced to facilitate direct mapping between an `MjStruct` and a `MjuiDef`. You need to pay extra attention because there is no guarantee on underlying `MjStruct` lifetime with `MjuiDefObjectMapper`. A recommended way is to group them both under a `final class` to make sure their lifetime is in sync.

### Constants

Only constants related to `MjUI` are ported over so far.

### Callbacks

Callbacks can be found under `Mjcb`. These are manually ported callbacks but does support Swift closures (i.e. captures).

### Reflection

`CustomReflectable` protocol conformance is implemented for MjStruct. These should contain all the fields in C structs with very few exceptions (`buffer` and `stack` in `MjData, `buffer` in `MjModel` and `userdata` in `MjUI`).

### String

MuJoCo leans heavily on static allocated strings. To make interaction easier, these are exposed as ordinary Swift strings. The back-and-forth copying can be expensive. Because static allocated strings have hard limit, there is a silent truncation if such limit reached.

### GLContext

A `GLContext` object is introduced to delegate GLFW interactions. Functionalities from `uitools.cc` in `./sample/` of MuJoCo were added to make interactions with `MjUI` easier. This object is a bit overreaching as it provides access to clipboard, timing and drag & drop functions.

## Examples

Both `Examples/simulate` and `Examples/ant` should provide good starting points to learn about the APIs. To run:

```
bazel run Examples:ant
bazel run --compilation_mode=opt Examples:simulate -- ~/workspace/swift-mujoco/Examples/assets/ant.xml
```

Visit documentation at: <https://liuliu.github.io/swift-mujoco>. These should be kept up-to-date with `main` branch.

## Appendix

### List of Supported MuJoCo C APIs
