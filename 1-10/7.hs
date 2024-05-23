data NestedList a = Elem a | List [NestedList a]

myFlatten :: NestedList a -> [a] 
myFlatten (Elem a) = [a]
myFlatten (List (x:xs)) = myFlatten x ++ myFlatten (List xs)
myFlatten (List []) = []

main :: IO ()
main = do
  print (myFlatten (Elem 5))
  print (myFlatten (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]]))
