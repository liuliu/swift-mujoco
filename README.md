# Mujoco for Swift

This is a Swift binding for [Mujoco](https://mujoco.org) physics simulation library.

[Mujoco](https://mujoco.org) is a very accurate CPU-based physics simulation library. Since its acquisition by [DeepMind](https://github.com/deepmind/mujoco), Mujoco has been more readily available broadly.

Mujoco is at the heart of physics simulation in the realm of [deep reinforcement learning](https://spinningup.openai.com/en/latest/algorithms/ppo.html). In [OpenAI Gym](https://gym.openai.com/envs/#mujoco), there are many diverse environments simulated with Mujoco.

Up until now, I only dipped a bit into DRL with https://github.com/liuliu/s4nnc/tree/main/examples. OpenAI Gym is OK for these simple mechanisms and I don't mind to wait a few minutes more. But most recently, I grown interests in more serious use of DRL / PPO under Sim2Real banner. For these, it is popular to either use [Isaac Gym](https://developer.nvidia.com/isaac-gym) or exploiting multi-core for environment runs. For later, doing it with `multiprocess` package of Python is awkward but the preferred way.

If we can run Mujoco from Swift, we can avoid the trip into Python entirely and simply use `DispatchQueue.concurrentPerform` for environment runs.

## Plan

Current version was able to load `ant.xml` model and render under Linux (see `Examples/ant/main.swift`). It gives me some ideas about how to make this as ergonomic, while maintaining close mapping between Swift and C.

After the bootstrap period, I am going to write a simple parser for Mujoco header such that additional accessors and functions can be generated from the source directly. There are a few rules:

 * Anything that has associated resources to free has to be a `final class` to enable automatic resource management;
 * Anything else will be `struct`;
 * Use `typealias` sparsely but surely to avoid meaningless translation for simple data structures;
 * C functions are associated with the first parameter object;
 * Most of the functions, accessors and setters are marked as `@inlinable` to make the usage as barebone as possible;
 * Enforce boundary checks using Mujoco header comments provided information.

Currently, Mujoco for Swift is built with Bazel. I plan to support Swift Package Manager after more work has done (this is unlike [s4nnc](https://github.com/liuliu/s4nnc), for which I have no plan to support SPM).
