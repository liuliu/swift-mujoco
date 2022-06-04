#!/usr/bin/env bash

set -euo pipefail

GIT_ROOT=$(git rev-parse --show-toplevel)

cd $GIT_ROOT

# Generate symbol graph
bazel build :swift-mujoco --features=swift.emit_symbol_graph
# Copy it into a valid bundle
mkdir -p MuJoCo.docc
cp bazel-bin/swift-mujoco.symbolgraph/*.json MuJoCo.docc/
# Remove all docs
rm -rf docs
# Convert into static hosting document
docc convert MuJoCo.docc --fallback-display-name="MuJoCo" --fallback-bundle-identifier org.liuliu.swift-mujoco --fallback-bundle-version 0.0.1 --output-path docs --hosting-base-path /swift-mujoco --index --transform-for-static-hosting
# Adding auto-redirect index.html
echo '<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"><meta http-equiv="refresh" content="0;url=https://liuliu.github.io/swift-mujoco/documentation/mujoco">' > docs/index.html
rm -rf MuJoCo.docc
