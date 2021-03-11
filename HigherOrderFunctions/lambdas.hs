-- Lambdas are basically anonymous functions that are used because we need some
-- functions only one
-- Normally, we make a lambda with the sole purpose of passing it to a
-- higher-order function

-- To make a lambda, we write a \ and then we write the parameters, separated
-- by spaces. After that comes a -> and then the function body

-- We can replace isLong function with lambda in our previous example:

numLongChains :: Int
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))

-- Lambdas are expressions. The expression (\xs -> length xs > 15) returns
-- a function that tells us whether the length of the list passed to it is
-- greater than 15

-- Lambdas can take any number of parameters:

ghci> zipWith (\a b -> (a * 30 + 3) / b) [5,4,3,2,1] [1,2,3,4,5]
[153.0, 61.5, 31.0, 15.75, 6.6]

-- And like normal functions, you can pattern match in lambdas
-- The only difference you can't define several patterns for one parameter

ghci> map (\(a,b) -> a + b) [(1,2),(3,5),(6,3),(2,6),(2,5)]
[3,8,9,8,7]

-- These two functions are equivalent:

addThree :: (Num a) => a -> a -> a -> a
addThree x y z = x + y + z

addThree :: (Num a) => a -> a -> a -> a
addThree = \x -> \y -> \z -> x + y + z

-- The same as writing flip' f x y = f y x is

flip' :: (a -> b -> c) -> b -> a -> c
flip' f = \x y -> f y x