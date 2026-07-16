# haskell-algebra-demo

An **Octave-style internal DSL** demonstration built with Haskell.

## Rationale

### Mathematics-Friendly Runtime

Haskell provides a runtime well-suited for mathematical thinking rather than purely computational tasks. For example:

- `0/0` evaluates to `NaN`
- `1/0` evaluates to `Infinity`
- Native support for arbitrary-precision integers
- Lazy evaluation enables representation of infinite sequences

Leveraging these runtime features, this project develops an Octave-style internal DSL to enhance mathematical modeling.

### Re-exposing Built-in API

Re-exposing built-in APIs is not feasible due to the design philosophy of Haskell. The language does not allow overriding or shadowing of Prelude functions in a clean way, which leads to unavoidable ambiguity. Possible alternatives include:

- **`NoImplicitPrelude`**: technically possible, but heavy-handed and impractical for small libraries.
- **Userland `hiding`**: introduces language leaks and forces users to manage imports manually.
- **`qualified` import**: explicit and verbose, often reducing ergonomics.
- **Explicit calls**: effectively the same as `qualified` imports, with no real benefit.

Appending a suffix to API names (e.g., `logA`, `sinA`, `asinA`) is the least-effort and most pragmatic alternative to re-exposing built-in APIs. This avoids collisions with Prelude while keeping usage simple and consistent.

### VectorAlgebra

This module demonstrates how to build a simple vector API in Haskell using `Data.Array`.  
It is intended for **educational and illustrative purposes only**.

#### Note

- Performance is poor for numerical workloads, since `Data.Array` is immutable and operations rebuild arrays.
- Do not use this for heavy numerical computing.

#### Alternatives

For practical use, prefer:

- `vector` — efficient one‑dimensional sequences (boxed/unboxed).
- `hmatrix` — BLAS/LAPACK bindings for linear algebra.
- `repa` — parallel array computations.

## Project Status

**WIP** — More Octave-style DSL features are in progress.  
Future plans include packaging this DSL into a standalone Haskell library.

## System Requirements

- GHC `9.10+` (recommended)

## Usage

Switch to the project’s root directory, then start `ghci` and load the module:

```shell
$ ghci
ghci> :load algebra.hs
[1 of 1] Compiling Algebra          ( algebra.hs, interpreted )
Ok, one module loaded.
ghci> import Algebra
ghci>
```

You can now use `ghci` as an Octave-style math workbench.

## License

MIT License © 2026 ByteBard
