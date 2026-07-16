module Algebra where
import Data.Complex

e :: Double
e = exp 1.0
i :: Complex Double
i = 0.0 :+ 1.0
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

logA :: Double -> Double
logA n = Prelude.log n
log10 :: Double -> Double
log10 n = logBase 10 n
log2 :: Double -> Double
log2 n = logBase 2 n

arg :: Complex Double -> Double
arg c = phase c
angle :: Complex Double -> Double
angle c = arg c
real :: Complex Double -> Double
real c = realPart c
imag :: Complex Double -> Double
imag c = imagPart c
conj :: Complex Double -> Complex Double
conj c = conjugate c

sinA :: Double -> Double
sinA n = Prelude.sin n
cosA :: Double -> Double
cosA n = Prelude.cos n
tanA :: Double -> Double
tanA n = Prelude.tan n

class ApproxEq a where
    (~=) :: a -> a -> Bool

instance ApproxEq Double where
    a ~= b =
        let diff = abs (a - b)
            rel  = eps * max (abs a) (abs b)
        in diff < rel || diff < eps
