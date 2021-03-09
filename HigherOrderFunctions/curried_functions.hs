-- Every function in Haskell officially only takes one parameter
-- All the functions that accepted several parameters so far have been curried functions

ghci> max 4 5
5
ghci> (max 4) 5
5

-- Putting a space between two things is simply function application
-- The type of max is

max :: (Ord a) => a -> a -> a

-- That can also be written as

max :: (Ord a) => a -> (a -> a)

-- If we call a function with too few parameters, we get back a partially applied function
-- Take a look at this function:

multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

-- This function's type could also be written as

multThree :: (Num a) => a -> (a -> (a -> a))

-- Take a look at this:

ghci> let multTwoWithNine = multThree 9
ghci> multTwoWIthNine 2 3
54
ghci> let multWithEighteen = multTwoWithNine 2
ghci> multWithEighteen 10
180

-- Waht if we wanted to create a function that takes a number and compares it to 100?
-- We could do something like this

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred x = compare 100 x

-- Now let's think about what compare 100 returns
-- It returns a function that takes a number and compares it with 100
-- We can rewrite this as:

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100

-- The type declaration stays the same, because compare 100 returns function

-- Infix functions can also be partially applied by using sections
-- To section an infix function, simply surround it with parentheses and
-- only supply a parameter on the side

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

-- Calling, say, divideByTen 200 is equivalent to doing 200 / 10, as is doing
-- (/10) 200
-- Another function:

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

-- The only special thing about sections is using -
-- From the definition of sections, (-4) would result in a function that
-- takes a number and subtract 4 from it. However, for convenience, (-4)
-- means minus four
-- So, if you want to make a function that sub 4 from the number it gets as a parameter
-- partially apply the subtract function like so: (subtract 4)