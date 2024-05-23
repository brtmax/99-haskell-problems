import Data.List (group)

compress :: Eq a => [a] -> [a]
compress = map head . group

myCompress :: Eq a => [a] -> [a]
myCompress (x:ys@(y:_))
  | x == y = myCompress ys
  | otherwise = x : myCompress ys
myCompress ys = ys

main :: IO ()
main = do
  print (compress [1,1,1,2,2,3,3,3,4,5])
  print (compress "aabbbbbbbbbcdddddddeeff")
  print (compress "aabbbbbbbbbcdddddddeeff")
