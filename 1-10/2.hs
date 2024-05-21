myButLast :: [a] -> a
myButLast [] = error "Empty list"
myButLast(x:xs)
    | length xs == 1 = x
    | otherwise = myButLast xs


main :: IO ()
main = do
    print (myButLast [1, 2, 3, 4])
    print (myButLast ['a'..'z'])
