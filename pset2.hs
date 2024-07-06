type Polynom = [Double]

cmult :: Polynom -> Double -> Polynom
cmult p c = map (*c) p
