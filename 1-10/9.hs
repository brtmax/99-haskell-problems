pack :: Eq a => [a] -> [[a]]

pack (x:xs) = let (first, rest) = span (==x) xs
              in (x:first) : pack rest

pack[] = []

main :: IO ()
main = do
  print(pack "aaaaaabbbcccdddeeffff")
