import Data.Complex
import Algebra

assert :: Bool -> IO ()
assert cond =
  if cond
    then return ()
    else error "Assertion failed"

main :: IO ()
main = do
  let c1 = 3.0 :+ 4.0
  let c2 = 3.0 :+ (-4.0)

  assert (2.0 ~= (log2 4.0))
  assert (3.0 ~= (log10 1000.0))

  assert (3.0 ~= (real c1))
  assert (4.0 ~= (imag c1))
  assert (c2 == (conj c1))

  return ()
