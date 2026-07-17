import VectorAlgebra

assert :: Bool -> IO ()
assert cond =
  if cond
    then return ()
    else error "Assertion failed"

main = do
  let v1 = fromList0 [1, 2, 3, 4, 5]
  let v2 = fromList0 [1, 2, 3, 4, 5]
  let v3 = fromList0 [3, 4, 5, 6, 6]

  assert (vectorEq v1 v2)
  assert (not (vectorEq v1 v3))

  return ()
