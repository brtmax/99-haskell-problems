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
