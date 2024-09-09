
-- List comparison, compares list which hold type t
fun1 :: (Eq t) => [t] -> Bool 
fun1 xs = (xs == [])

-- foldr takes in operator, initial value, and input list
-- so fun2 is underproviding it, so the third value has
-- to be the type list [s]. foldr returns list of initial value
-- in this case initial value is of type char, so the return 
-- is of type [char]
fun2 :: (s -> [char] -> [char]) -> t -> [s] -> [char]
fun2 f a = foldr f "a"

-- Of course, this would be just as correct
-- It is worth noting that "a" is not being taken literally
-- as input, but as placeholder for any initial string value
fun2 :: (s -> String -> String) -> t -> [s] -> String
fun2 f a = foldr f "a"

-- foldl takes in an operator, initial value and input list
-- foldl :: (b -> a -> b) -> b -> [a] -> b
-- Since we call foldl with 4 values, we apply the last value (c)
-- to the output of foldl f a xs. So the output needs to be a 
-- function which as input has the the same type as c!
-- So (t -> s), and t
fun3 :: ((t -> s) -> b -> (t -> s)) -> (t -> s) -> [b] -> t -> s 
fun3 f a xs c = foldl f a xs c


-- map :: (a -> b) -> [a] -> [b]
-- This function is untypable, since map expects a function and a 
-- list, and returns a list. So (map f xs) has to have a list type. 
-- But on the other hand, (map f xs) gets applied to xs, which 
-- means it must also have a function type. -> Error!
fun4 :: ([a] -> )
fun4 f xs = map f xs xs

-- maximum :: Ord a => [a] -> a
-- [a..b] expects a and b to be of same type
-- maximum expects input the be of sorteable type
-- fun5 returns a tuple, we only need to ensure that multiplication
-- is possible for the type of t
fun5 :: (Enum s, Ord s, Num t) => s -> s -> t -> (s, t)
fun5 a b c = (maximum [a..b], 3 * c)

-- succ :: Enum a => a -> a
-- Returns successor of a value, for numeric types, succ just adds 1
-- toEnum :: Enum a => Int -> a | Converts Int to any Enum
-- fromEnum :: Enum a => a -> Int | Converts Enum to any Int
-- toEnum 65 :: Char  -- ergibt 'A'
-- fromEnum 'A'       -- ergibt 65
-- last :: HasCallStack => [a] -> a
-- So toEnum and fromEnum converts between values of enumerable 
-- types and their index in the enumeration. 

-- So takes last index between x and y in their enumeration, 
-- then takes the next one
-- The actual enumeration depends on the type context during the
-- call
fun6 :: (Enum s, Enum t, Enum u) => s -> t -> u
fun6 x y = succ (toEnum (last [fromEnum x..fromEnum y]))

-- show :: Show a => a -> String
-- For example, show (5, 6) will print "(5, 6)"
-- error :: [Char] -> a
fun7 :: (Show ([Char] -> a)) => ([Char] -> a) -> ([Char] -> a)
fun7 x = if show x /= [] then x else error
