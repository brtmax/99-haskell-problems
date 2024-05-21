isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome xs = xs == (reverse xs)

main :: IO ()
main = do
  print (isPalindrome [1, 2, 3])
  print (isPalindrome "maoam")
