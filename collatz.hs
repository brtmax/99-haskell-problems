module collatz 
(
 collatz, 
 num, 
 maxNum 
) where

next :: Int -> Int
next an
   | an 'mod' 2 == 0 = an 'div' 2
   | otherwise	     = 3 * an + 1

collatz :: Int -> [Int]
collatz m = iterate next m 

num :: Int -> Int 
num m = length (takeWhile (/= 1) (collatz m))

maxNum a b = foldl maxPair (0,0) (map (\m -> (m, num m )) [a..b]
   where maxPair (m, n) (m', n') = if n > n' then (m, n) else (m', n')

answer = maxNum 1 1000
