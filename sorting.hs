module sorting 
(
 insert, 
 insertSort,
 merge,
 mergeSort
) where

insert :: [x] -> x -> [x]
insert [] x = [x]
insert (x:xs) y
	| y <= x	= y : x : xs
	| otherwise	= x : insert y xs

insertSort []	= []
insertSort (x:xs)	= insert x (insertSort xs)


merge :: Ord x => [x] -> [x] -> [x]
merge [] [x] -> [x]
merge [x] [] -> [x]
merge (x:xs) (y:ys) 
	| x <= y	= x : merge xs y:ys
	| otherwise	= y :merge x:xs ys

mergeSort :: Ord x => [x] -> [x]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = merge
	(mergeSort (take (length xs 'div' 2) xs)) 
	(mergeSort (drop (length xs 'div' 2) xs))

-- take takes the first half of the list
-- drop takes the last half of the list

	


