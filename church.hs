module church
(
) where

type Church t = (t -> t) -> t -> t

int2church :: Integer -> Church t
int2church 0 = \s z -> z
int2church n = \s z -> int2church (n - 1) s (s z)
-- Ergibt dann quasi fuer jedes int2church ein s, also Output
-- waere zB s ( s ( ... ( s ( s z)
-- Klammern sind bei Church Zahlen rechtsassoziativ, sind also implizit
-- und damit ist der Ausdruck auch korrekt
--

church2int :: Church Integer -> Integer
church2int n = n (+1) 0 
