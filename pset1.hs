pow1 b e
 | e < 0    = error "Negative Exponent"
 | e == 0   = 1
 | otherwise = b * pow b (e - 1)

pow2 b e

