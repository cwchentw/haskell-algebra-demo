import VectorAlgebra

assert :: Bool -> IO ()
assert cond =
  if cond
    then return ()
    else error "Assertion failed"

main = do
  let v1 = fromList0 [1, 2, 3, 4, 5]
  let v2 = fromList0 [1, 2, 3, 4, 5]
  let v3 = fromList0 [3, 4, 5, 6, 7]

  let (Just r1) = vectorAdd v3 v1
  let (Just r2) = vectorSub v3 v1
  let (Just r3) = vectorMul v1 v1
  let r4 = vectorScalarMul 3.0 v1

  assert (vectorEq v1 v2)
  assert (not (vectorEq v1 v3))

  assert (vectorEq r1 (fromList0 [4, 6, 8, 10, 12]))
  assert (vectorEq r2 (fromList0 [2, 2, 2, 2, 2]))
  assert (vectorEq r3 (fromList0 [1, 4, 9, 16, 25]))
  assert (vectorEq r4 (fromList0 [3, 6, 9, 12, 15]))

  return ()
