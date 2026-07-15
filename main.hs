import Data.Complex
import Algebra

assert :: Bool -> IO ()
assert cond =
  if cond
    then return ()
    else error "Assertion failed"

doubleEqual :: Double -> Double -> Bool
doubleEqual a b = a ~= b

main :: IO ()
main = do
  let c1 = 3.0 :+ 4.0
  let c2 = 3.0 :+ (-4.0)

  assert (doubleEqual 2.0 (log2 4))
  assert (doubleEqual 3.0 (log10 1000))

  assert (doubleEqual 3.0 (real c1))
  assert (doubleEqual 4.0 (imag c1))
  assert (c2 == (conj c1))

  return ()
