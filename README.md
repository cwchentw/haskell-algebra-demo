# haskell-algebra-demo

An **Octave-style internal DSL** demonstration built with Haskell.

## Rationale

Haskell provides a runtime well-suited for mathematical thinking rather than purely computational tasks. For example:

- `0/0` evaluates to `NaN`
- `1/0` evaluates to `Infinity`
- Native support for arbitrary-precision integers
- Lazy evaluation enables representation of infinite sequences

Leveraging these runtime features, this project develops an Octave-style internal DSL to enhance mathematical modeling.

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
