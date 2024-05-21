myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

main :: IO ()
main = do 
  print (myReverse [1, 2, 3, 4, 5])
  print (myReverse "hello")
