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


Higher order functions
Use Hoogle as man page, search for types, e.g. Integer -> Integer

Function as arguments
foo :: (a -> b) -> c

this would be a function which takes a function which takes a as input, returns b, then returns c

Inlining functions

bar = foo (\x y -> x + y)
calls foo with the inline function which adds x and y


applly :: (a -> b) -> [a] -> [b]
apply fn []     = []
apply fn (x:xs) = fn x : apply fn xs

In the recursive case, we apply (a -> b) on the first element of (x:xs), namely x, which should give us b. The recursion then 
continues with the rest of the xs, and cons them onto each other. 
This function actually already exists in the common library! It is called map

map :: (a -> b) -> [a] -> [b]
map fn []   = []
map fn (x:xs)  = fn x : map fn xs
It MAPS a function onto a list. If we partially apply this, we can create new building blocks. So if we only give map a function, 
we create a new building block which maps the function onto lists

Two more examples: 
zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]

So for example, we can do zipWith (+) xs ys
to create a function which gives which cretes the pair-wise sums

filter :: (a -> bool) -> [a] -> [a]

filter even xs
Returns all even numbers in xs

foldr
works the following way
sum = foldr (+) 0 [1,2,3]

sum [1,2,3] = 1 + (2 + (3 + 0)) = 6
So it processes the elements from the right, or from within
[1,2,3] under the hood is just 1:(2:(3:[]))


In function definitions, [x] would count as a list
with elements the type of x. 
Inside of the function, [x] counts as a list with a 
single element!
Thats because, in the function definition this is a TYPE a. Inside of the
function it is a TERM. 

Function 'take'
This function extracts the first n elements from a 
list. Its signature is 
take :: Int -> [a] -> [a], where the first argument
is the number of elements to take and the second
argument is the list. For example,
take 3 [1,2,3,4,5] would return [1,2,3]

Function 'drop'
This function removes the first n elements from a list
and returns the remainder. Its signature is
drop :: Int -> [a] -> [a]
For example, drop 3 [1,2,3,4,5]
would return [4,5]


Basics: 
Um eine allgemeine Funktion zu schreiben, muss man nichts besonderes tun: der 
Compiler inferiert selbststaendig immer den allgemeinsten Typ, so dass fuer die
Funktion f x y = [x] der Typ a -> b -> [a] inferiert wird


well defined function of type a -> a
f :: x -> x
f x = x

well defined function of type (a -> b) -> a -> b
f :: (a -> b) -> a -> b
f g x = g x

well defined function of type (a -> b) -> (a -> b)
f :: (a -> b) -> (a -> b)
f x = x

well defined function of type a -> b -> a
f :: a -> b -> a
f x y = x

All well defined, semantically different functions of type a -> a -> a
f :: a -> a -> a
f x y = x
g x y = y


Parameters can be declared further in the code as global variables
Haskell uses the closest parameter
let binds stronger than where 
