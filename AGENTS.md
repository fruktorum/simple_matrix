# AGENTS.md

## Project

Crystal shard (library) providing lightweight, zero-malloc matrix operations for neural network layer computations.

## Commands

```
crystal spec          # run all specs
crystal spec spec/dot_spec.cr  # run single spec file
shards install        # install dependencies (none currently)
```

No task runner, Makefile, CI, linter, or formatter configured.

## Architecture

- `src/simple_matrix.cr` — entry point, requires `./simple_matrix/*` and `./version`
- `src/simple_matrix/` — one file per operation: `dot`, `mul`, `sum`, `transpose`, `convolve`, `apply`, `compare`, `each_map`, `base`
- `spec/spec_helper.cr` — shared test fixtures (matrix constructors)
- Specs are one file per operation, matching `src/simple_matrix/`, plus identity_spec.cr and json_spec.cr for base methods

## Key Conventions

- **3-argument functional style**: `m1.op m2, result` — source, operand, result buffer. No dimension checking; caller is responsible.
- **Buffer access**: `matrix.buffer` returns `Array(Array(T))`. Operations work on matrices or raw buffers interchangeably.
- **Generic over type**: `SimpleMatrix(UInt8).new h, w` — type parameter required, types must match across operands.
- **Style**: 2-space indent, LF, trailing newline (`.editorconfig`).

## Docker Dev

```
docker compose build   # builds crystallang/crystal:1.20.2-alpine image
docker compose run dev # interactive shell with ./ mounted at /app
```

## Project Map

See `project-map.md` for full directory structure, file roles, and operation signatures.
