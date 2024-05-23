import Data.List (group)

pack :: Eq a => [a] -> [[a]]

pack (x:xs) = let (first, rest) = span (==x) xs
              in (x:first) : pack rest

pack[] = []

encode :: Eq a => [a] -> [(Int, a)]
encode xs = map(\x -> (length x, head x)) (group xs)



main :: IO ()
main = do
  print (encode "aaaabbbcccdddeeefff")
