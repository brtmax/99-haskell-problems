module merge
(
  merge, 
  primepowers,
) where

merge :: [Integer] -> [Integer] -> [Integer]
merge [] ys = ys
merge xs [] = xs
merge (x : xs) (y : ys)
	| x < y		= x : merge xs (y : ys)
	| otherwise	= y : merge (x : xs) ys

primepowers :: Integer -> [Integer]
primepowers n = foldr merge [] [map (^i) primes | i <- [1..n]]
