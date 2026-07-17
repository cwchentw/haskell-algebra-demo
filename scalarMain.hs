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

  assert (true == (true && true))
  assert (false == (true && false))

  assert (3.0 ~= (absA (-3.0)))

  assert (e ~= (expA 1.0))

  assert (1.0 ~= (logA e))
  assert (2.0 ~= (log2 4))
  assert (3.0 ~= (log10 1000))

  assert (3.0 ~= (real c1))
  assert (4.0 ~= (imag c1))
  assert (c2 == (conj c1))

  assert (1.0 ~= (sinA (pi / 2)))
  assert (1.0 ~= (cosA 0.0))
  assert (0.0 ~= (tanA 0.0))

  return ()
