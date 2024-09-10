module ropes
(
 ropeLength, 
 ropeConcat, 
 ropeSplitAt
)
where

data Rope a
	= Leaf [a]
	| Inner (Rope a) Int (Rope a)

ropeLength :: Rope a -> Int
ropeLength (Leaf s) = length s
ropeLength (Inner _ w r) = w + ropeLength r

ropeConcat :: Rope a -> Rope a -> Rope a
ropeConcat l r = Inner l (ropeLength l) r

-- drop :: Int -> [a] -> [a]
-- drop n [a] returns suffix of a after n elements
-- take :: Int -> [a] -> [a]
-- take n [a] retrieves first n elements of sequence 

ropeSplitAt :: Int -> Rope a -> (Rope a, Rope a)
ropeSplitAt i (Leaf s) = (Leaf (take i s), Leaf (drop i s))
ropeSplitAt i (Inner l w r)
	| i < w
	= let (ll, lr) = ropeSplitAt i l 
	  in (ll, ropeConcat lr r)
	| i > w
	= let (rl, rr) = ropeSplitAt (i-w) r
	  in (ropeConcat l rl, rr)
	| otherwise
	= (l, r)

ropeInsert :: Int -> Rope a -> Rope a -> Rope a
ropeInsert i s rope = l 'ropeConcat' s 'ropeConcat' r
	where
		(l, r) = ropeSplitAt i rope

