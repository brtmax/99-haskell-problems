type Polynom = [Double]

cmult :: Polynom -> Double -> Polynom
cmult p c = map (*c) p


eval :: Polynom -> Double -> Double
eval p x = foldr (\a v -> a + v * x) 0 p

deriv :: Polynom -> Polynom
deriv []	= []


