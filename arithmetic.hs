module arithmetic
(
  factorial, 
  sum,
  pow, 
  pow2
) where

factorial :: Integer -> Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

sum :: Num a => [a] -> a
sum [] = 0
sum (x:xs) = x + sum xs

pow :: Integer -> Integer -> Integer
pow _ n | n < 0 = error "Negative exponent not allowed"
pow b 1 = b 
pow b n = b * pow b (n - 1)

pow2 :: Integer -> Integer -> Integer
pow _ n | n < 0 = error "Negative exponent not allowed"
pow b 1 = b
pow b e = b * pow (b * b) (e - 1)

pow 3 b e 
  | e < 0 = error "Negative exponent not allowed" 
  | otherwise = pow3Acc 1 b e
    where
      pow3Acc acc b e
        | e == 0            = acc
        | e 'mod' 2 == 0    = pow3Acc acc (b * b) (e 'div' 2)
        | e 'mod' 2 == 1    = pow3Acc (b * acc) (b * b) (e 'div' 2)

print (root 2 9) 

root :: Integer -> Integer -> Integer
root e r
  | r < 0 = error "Can't take root of negative number"
  | e < 0 = error "Can't take negative radicant" 
  |  otherwise = find 0 r 
    where 
      find low high
        | low + 1 == high = low 
        | pow3 half e <= r = searchRoot half high 
        | otherwise        = searchRoot low half
        where half = low (low + high) 'div' 2


isPrime :: Integer -> Integer
isPrime 0 = 1
isPrime 1 = 1
isPrime n =
      | n 'mod' (root 2 r) == 0   = root 2 r
      | otherwise isPrime (n - 1)

prime n 
  | n < 2     = error "Number too small" 
  | otherwise = nHasNoDivisorGreaterThan 2
    where 
      upto = root 2 n 
      nHasNoDivisorGreaterThan k 
        | k > upto  = True
        | n 'mod' k == 0  = False
        | otherwise   = nHasNoDivisorGreaterThan (k + 1)


-- Halbiere das Intervall
-- Ist das erste Element im rechten Intervall * e = r, gebe es aus
-- Ist das erste Element im rechten Intervall * e > r, wiederhole auf linker seite
-- Ist das erste Element im rechten Intervall * e < r, wiederhole auf linker Seite
--

find :: Integer -> Integer -> Integer -> Integer

find a b c | a - b == 1       = a
