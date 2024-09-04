{- How to use ghc: 
 -  ghc -o hello hello.hs
 -
 - Functions: 
 -  func :: X -> Y -> Z
 -  function func takes in X, takes in Y, and returns Z
 -
 - Example
 - square :: Integer -> Integer
 - square x = x * x
 -
 - Type variables
 - head :: [a] -> a
 -
 - Uses with any type which supports the used operations, if 
 - operation is not defined for every type, we get an error: 
 -
 - square :: a -> a
 - square x = x * x
 -
 - Will give us an error since multiplication is not defined for every type
 -
 - We can fix it by specifying its Typeclass: 
 -
 - square :: Num a => a -> a
 - square x = x * x
 -
 -
 - Currying
 - Works like this: 
 -
 - Say we have a function 
 - magnitude :: Integer -> Integer -> Integer
 - magnitude x y = sqrt (square x + square y)
 -
 - This takes in two Integer values. 
 -
 - If we call it like this: 
 -
 - foo = magnitude 5 
 -
 - we won't get an error! This is because Currying essentially
 - allows us to leave out values. foo is now a new function, 
 - which works like magnitude but has the first value 
 - fixed as 5.
 -
 - Leave out functions = partially applying functions! Thus in 
 - Haskell, functions are curried by default. 
 -
 -
 - Pattern matching
 -
 - In Haskell you can define a function in multiple ways, the 
 - compiler will chose the first one which fits. So the order 
 - in which functions are defined is important!
 -
 - Example
 - zeroToOne 0 = 1
 - zeroToOne x = x
 -
 - Guards
 -
 - sign x | x > 0	= 1 --if
 -	  | x > 0	= -1 --else if
 -	  | otherwise = 0 --Equal sign must be there then
 -
 -
 Guard clauses can also be used in a single pattern case? of course!

 pow :: Integer -> Integer -> Integer
 pow _ n | n < 0 = error "Negative exponent not allowed"
 pow b 1 = b 
 pow b n = b * pow b (n - 1)


 - Using modules
 -module MyMath
  ( max,       -- Exporting max function
    max3       -- Exporting max3 function
  ) where

-- Function definitions
max :: Integer -> Integer -> Integer
max x y
  | x < y     = y
  | otherwise = x

max3 :: Integer -> Integer -> Integer -> Integer
max3 x y z = max (max x y) z


Lists
someList :: [Integer]
someList = 1 : (2 : (3 : []))

same as someList = [1, 2, 3]
: is called the cons operator. It links a node to the remaining list
(x:xs) is the convention for defining a list. This allows us to do pattern matching
with cons. x is our current element, xs is the remaining list.
[] is called nill, it marks the end of the list.

take :: Integer -> [a] -> [a]
take 0 _ = []
take _ [] = []
take n (x:xs) = x : take (n - 1) xs

_ is a placeholder for any possible value

Infinite lists

naturals = [1..]
That way we can actually represent infinite lists, which makes certain mathematical operations way 
easier. Due to lazy evaluation, we make sure to only use what we actually need. 

List comprehension
Applies a function or expression to ALL elements in a list
[<expresion> | x <- xs]

For example: 
squareAll :: Num a => [a] -> [a]
squareAll xs = [x * x | x <- xs]


Lazy evaluation
Haskell does not evaluate an expression, until strictly necessary!

For example
firstSquares :: Num a => a -> [a] -> [a]
firstSquares n xs = take n (squareAll xs)

squareAll only gets evaluated, when its strictly necessary. So this is just as fast as the reverse
order!

Bindings
Haskell is a purely functionaly language, but it can use bindings. They are like variables, but theycannot be reassigned. Like upto in the following exammple:

prime n 
  | n < 2     = error "Number too small" 
  | otherwise = nHasNoDivisorGreaterThan 2
    where 
      upto = root 2 n 
      nHasNoDivisorGreaterThan k 
        | k > upto  = True
        | n 'mod' k == 0  = False
        | otherwise   = nHasNoDivisorGreaterThan (k + 1)
Recursion

GM approach to recursion
1. Write down name and type
2. Write down cases
3. Define base cases
4. Define recursion cases
5. Generalize and simplify

Haskell only has recursion, so no iterative approaches. 
For example, factorial: 

fac :: Integer -> Integer
fac 0 = 1
fac n = n * fac (n-1)

Pattern matching allows us to make this a lot more straight forward

Infix notations
functions can be used as infix when surrounded by ' like this
a 'div' b
