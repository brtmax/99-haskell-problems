elementAt :: [a] -> Int -> a
elementAt [] _ = error "Empty list"
elementAt (x:_) 0 = x
elementAt (_:xs) n
    | n < 0 = error "Negative index"
    | otherwise = do
      elementAt xs (n - 1)

main :: IO ()
main = do
  let list1 = [1, 2, 3, 4, 5]
  let list2 = "haskell"

  let index1 = 2
  let index2 = 5
  
  let element1 = elementAt list1 index1
  let element2 = elementAt list2 index2

  putStrLn $ "Element at index " ++ show index1 ++ " is " ++ show element1
  putStrLn $ "Element at index " ++ show index2 ++ " is " ++ show element2
