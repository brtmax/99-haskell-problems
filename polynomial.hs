module polynomial
(
 cmult,
 eval,
 deriv
) where

-- list of coefficients
type Polynomial = [Double]

cmult :: Polynomial -> Double -> Polynomial
cmult p c = map (*c) p 

eval :: Polynomial -> Double -> Double
eval p x = foldr (\a v -> a + v * x) 0 p

deriv :: Polynomial -> Polynomial
deriv [] = []
deriv p = zipWith (*) [1..] (tail p)

