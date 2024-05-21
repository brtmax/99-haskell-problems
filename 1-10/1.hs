lastElem :: [a] -> a
lastElem [] = error "Empty list"
lastElem [a] = last[a]
lastElem (_:xs) = lastElem xs


main :: IO ()
main = do
    print (lastElem [1, 2, 3])
    print (lastElem ['x', 'y', 'z'])
