module VectorAlgebra where
import Data.Array
import Algebra

type Vector = Array Int Double

replicateArray :: Int -> Double -> Vector
replicateArray n val = array (0, n-1) [ (i, val) | i <- [0..n-1] ]

fromList0 :: [Double] -> Vector
fromList0 xs = listArray (0, length xs - 1) xs

zipWithArray :: (Double -> Double -> Double) -> Vector -> Vector -> Vector
zipWithArray f a b =
  let (l,u) = bounds a
  in array (l,u) [ (i, f (a ! i) (b ! i)) | i <- range (bounds a) ]

vectorLength :: Vector -> Int
vectorLength v = let (l,u) = bounds v in u - l + 1

vectorEq :: Vector -> Vector -> Bool
vectorEq a b =
  bounds a == bounds b &&
  all (\i -> (a ! i) ~= (b ! i)) (range (bounds a))

vectorAdd :: Vector -> Vector -> Maybe Vector
vectorAdd a b =
  if bounds a == bounds b
    then Just (zipWithArray (+) a b)
    else Nothing

vectorSub :: Vector -> Vector -> Maybe Vector
vectorSub a b =
  if bounds a == bounds b
    then Just (zipWithArray (-) a b)
    else Nothing

vectorMul :: Vector -> Vector -> Maybe Vector
vectorMul a b =
  if bounds a == bounds b
    then Just (zipWithArray (*) a b)
    else Nothing

vectorScalarMul :: Double -> Vector -> Vector
vectorScalarMul s v = zipWithArray (*) v (replicateArray (vectorLength v) s)
