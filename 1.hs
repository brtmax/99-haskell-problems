max2 :: Integer -> Integer -> Integer
max2 x y | x < y     = y
	| otherwise = x

max3 :: Integer -> Integer -> Integer -> Integer
max3 x y z = max2 (max2 x y) z

main :: IO ()
main = do
	print(max3 10 28 3)


