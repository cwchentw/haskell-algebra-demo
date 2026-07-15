module Algebra where

e :: Double
e = exp 1.0
nan :: Double
nan = 0/0
inf :: Double
inf = 1/0
eps :: Double
eps = encodeFloat 1 (1 - floatDigits (undefined :: Double))
realmax :: Double
realmax = (2 - 1 / 2^52) * 2^1023
realmin :: Double
realmin = 4.9e-324

log10 n = logBase 10 n
log2 n = logBase 2 n
