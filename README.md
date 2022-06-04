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

Which out of the three implemented was tracked in `Sources/codegen/functionExtension.swift`.

MuJoCo's C headers are parsed and used to generate `enum`, properties on structs and functions on structs. These are `Mjt.swift`, `XX+Extensions.swift` and `XX+Functions.swift` files.

They can be reproduced with:

```
bazel run Sources:codegen -- ~/workspace/swift-mujoco/Sources/ ~/workspace/mujoco/include/mujoco/*.h
```

Extra care was taken to make sure comments are properly parsed and added to these extensions. <https://liuliu.github.io/swift-mujoco/documentation/mujoco> is the documentation generated based on these comments.

`MjArray<T>` is the array type that exposes static or dynamic arrays within a C struct. It retains the underlying storage to make sure the access is safe. All accessors are generated for public C structs from MuJoCo.

### Enum

`enum` are parsed and generated. Because there is no type annotation, we do our best to infer which int type are enums from comment. `MjtEnableBit` and `MjtDisableBit` are special handled to be `OptionSet`.

### Functions

C functions are not scoped to a particular object. We have to infer these. First, we try to infer which group of APIs it belongs to with the prefix: `mj_` matches `mjXX` structs, `mjv_` matches `mjvXX` structs. We prefer the first parameter, otherwise the last parameter (as it is often used as write to). If no suitable object to be found, it is a free function.

The interface generation process also treats `const` annotation seriously. Without `const`, these methods are annotated with `mutating`. If the parameter is a pointer without `const`, it is annotated with `inout`.

Not all functions are automatically generated, some of these are manually implemented because:

 * The C API can be better reflected with corresponding Swift API, for example, `mj_loadXML` can be better translated with `throws` for errors;
 * Some parameters can be nil, but during automatic interface generation, we assumed all parameters to be non-nil.

### MjUI

Whenever possible, we lean towards automatic interface generation. That's why certain APIs even looks weird, we keep it that way. `MjUI` has many quirks that at odds with this philosophy. In particular, `MjuiDef` automatically associated the UI control with the underlying storage `pdata`. Because `pdata` is a pointer, it has no regards to the underlying storage lifetime. A property wrapper `MjuiDefState` is introduced to solve this issue. Although users are still responsible to make sure the underlying storage lifetime longer than `MjUI` itself, you don't need to deal with raw `pdata`.

### String

MuJoCo leans heavily on static allocated strings. To make interaction easier, these are exposed as ordinary Swift strings. The back-and-forth copying can be expensive.

### GLContext

A `GLContext` object is introduced to delegate GLFW interactions. Functionalities from `uitools.cc` in `./sample/` of MuJoCo were added to make interactions with `MjUI` easier.

## Road to 0.1

Although most APIs and struct properties now translated, there are some minor issues we need to solve before v0.1:

 * The lifetime management of associated storage for both `MjuiState` and `MjuiDef.pdata` is unsatisfactory. It may as well be the best solution I have so far, but could be something I spend time to think more about;
 * `MjvFigure` hasn't tested;
 * Not all functionalities from `simulate.cc` ported over to `Examples/simulate/main.swift`.

## Examples

Both `Examples/simulate` and `Examples/ant` should provide good starting point to learn about this port. To run:

```
bazel run Examples:ant
bazel run Examples:simulate -- ~/workspace/swift-mujoco/Examples/assets/ant.xml
```

Visit documentation at: <https://liuliu.github.io/swift-mujoco/documentation/mujoco>. These should be regularly updated.
