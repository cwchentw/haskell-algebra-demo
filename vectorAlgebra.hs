module VectorAlgebra where
import Data.Array

type Vector = Array Int Double

replicateArray :: Int -> Double -> Vector
replicateArray n val = listArray (0, n-1) (replicate n val)

fromList0 :: [Double] -> Vector
fromList0 xs = listArray (0, length xs - 1) xs

zipWithArray :: (Double -> Double -> Double) -> Vector -> Vector -> Vector
zipWithArray f a b =
  let (l,u) = bounds a
  in array (l,u) [ (i, f (a ! i) (b ! i)) | i <- range (bounds a) ]

vectorLength :: Vector -> Int
vectorLength v = let (l,u) = bounds v in u - l + 1

vectorAdd :: Vector -> Vector -> Maybe Vector
vectorAdd a b =
  if bounds a == bounds b
    then Just (zipWithArray (+) a b)
    else Nothing
