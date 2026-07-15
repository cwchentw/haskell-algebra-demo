import Data.Complex
import Algebra

assert :: Bool -> IO ()
assert cond =
  if cond
    then return ()
    else error "Assertion failed"

floatEqual :: Double -> Double -> Bool
floatEqual a b = abs(a - b) < 0.00001

main :: IO ()
main = do
  let c1 = 3.0 :+ 4.0
  let c2 = 3.0 :+ (-4.0)

  assert (floatEqual 2.0 (log2 4))
  assert (floatEqual 3.0 (log10 1000))

  assert (floatEqual 3.0 (real c1))
  assert (floatEqual 4.0 (imag c1))
  assert (c2 == (conj c1))

  return ()
