pow1 b e
 | e < 0    = error "Negative Exponent"
 | e == 0   = 1
 | otherwise = b * pow b (e - 1)

pow2 b e
 | e < 0	= error "Negative Exponent" 
 | e == 0	= 1
 | e 'mod' 2 == 0 = pow2 (b * b) (e 'div' 2)
 | otherwise	= b * pow2 (b * b) (e 'div' 2)

 pow3 b e
 | e < 0 = error "Negativer Exponent" 
 | otherwise = pow3Acc 1 b e
   where 
    pow3Acc acc b e
	| e == 0	= acc
	| e 'mod' 2 == 0 = pow3Acc acc (b * b) (e 'div' 2)
	| e 'mod' 2 == 1 = pow3Acc (b * acc) (b * b) (e 'div' 2)

root e r
 | e < 1	= error "Nicht-positiver Wurzelexponent"
 | r < 0	= error "Negativer Radikant" 
 | otherwise = searchRoot 0 (r + 1)
 where searchRoot low high
	| low + 1 == high	= low
	| pow3 half e <= r 	= searchRoot half high
	| otherwise		= searchRoot low half
	where half = (low + high) 'div' 2

isPrime n 
	| n < 2		= error "Zu kleine Zahl" 
	| otherwise	= nHasNoDivisorGreaterThan 2
	where
		upto = root 2 n
		nHasNoDivisorGreaterThan k 
			| k > upto	= True
			| n 'mod' k == 0= False
			| otherwise	= nHasNoDivisorGreaterThan (k + 1)

