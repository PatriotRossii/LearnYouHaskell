-- A typeclass is a sort of interface that defines some behavior. If a type is a part of a typeclass, that means that it supports and implements the behavior the typeclass describes.

ghci> :t (==)
(==) :: (Eq a) => a -> a -> Bool

-- Some basic typeclasses:

-- Eq is used for types that support equality testing. The functions its members implement are == and /=.

ghci> 5 == 5
True

ghci> 5 /= 5
False

ghci> 'a' == 'a'
True

ghci> "Ho Ho" == "Ho Ho"
True

ghci> 3.432 == 3.432
True

-- Ord is for types that have ordering

ghci> :t (>)
(>) :: (Ord a) => a -> a -> Bool

-- Ord covers all the standard comparing functions such as >, <, >= and <=
-- The compare function takes two Ord members of the same type and returns an ordering
-- Ordering is a type that can be GT, LT or EQ, meaning greater than, lesser than and equal, respectively.

-- To be a member of Ord, a type must first have membership in the prestigious and exclusive Eq club.

ghci> "Abrakadabra" < "Zebra"
True
ghci> "Abrakadabra" `compare` "Zebra"
LT
ghci> 5 >= 2
True
ghci> 5 `compare` 3
GT

-- Members of Show can be presented as strings

ghci> show 3
"3"
ghci> show 5.334
"5.334"
ghci> show True
"True"

-- Read is sort of the opposite typeclass of Show. The read function takes a string and returns a type which is a member of Read.

ghci> read "True" || False
True
ghci> read "8.2" + 3.8
12.0
ghci> read "5" - 2
3
ghci> read "[1,2,3,4]" ++ [3]
[1,2,3,4,3]

-- Following code cause error

ghci> read "4"  
<interactive>:1:0:  
    Ambiguous type variable `a' in the constraint:  
      `Read a' arising from a use of `read' at <interactive>:1:0-7  
    Probable fix: add a type signature that fixes these type variable(s)  

-- Cause GHCi doesn't know what we want in return.
-- Let's take a look at the type signature of read

ghci> :t read
read :: (Read a) => String -> a

-- See? It returns a type that's part of Read but if we don't try to use it in some way later, it has no way of knowing which type. That's why we can use explicit type annotations
-- Type annotations are a way of explicitly saying what the type of an expression should be
-- We do that by adding :: at the end of the expression and then specifying a type

ghci> read "5" :: Int
5
ghci> read "5" :: Float
5.0
ghci> (read "5" :: Float) * 4
20.0
ghci> read "[1,2,3,4]" :: [Int]
[1,2,3,4]
ghci> read "(3, 'a')" :: (Int, Char)
(3, 'a')

-- Enum members are sequentially ordered types — they can be enumerated
-- main advantage of the Enum typeclass is that we can use its types in list ranges
-- They also have defined successors and predecesors, which you can get with the succ and pred functions

ghci> ['a'..'e']
"abcde"
ghci> [LT .. GT]
[LT,EQ,GT]
ghci> [3 .. 5]
[3,4,5]
ghci> succ 'B'
'C'

-- Bounded members have an upper and a lower bound.

ghci> minBound :: Int
-2147483648  
ghci> maxBound :: Char  
'\1114111'  
ghci> maxBound :: Bool  
True  
ghci> minBound :: Bool  
False  

-- minBound and maxBound are interesting because they have a type of (Bounded a) => a
-- In a sense they are polymorphic constants.

-- All tuples are also part of Bounded if the components are also in it.

ghci> maxBound :: (Bool, Int, Char)
(True,2147483647,'\1114111')  

-- Num is a numeric typeclass. Its members have the property of being able to act like numbers

ghci> :t 20
20 :: (Num t) => t

-- It appears that whole numbers are also polymorphic constants

ghci> 20 :: Int
20
ghci> 20 :: Integer
20
ghci> 20 :: Float
20.0
ghci> 20 :: Double
20.0

-- Those are types that are in the Num typeclass. If we examine the type of *, we'll see that it accepts all numbers

ghci> :t (*)
(*) :: (Num a) => a -> a -> a

-- To join Num, a type must already be friends with Show and Eq

-- Integral is also a numeric typeclass
-- Num includes all numbers, including real numbers and integral numbers
-- Integral includes only integral (whole) numbers. In this typeclass are Int and Integer

-- Floating includes only floating point numbers, so Float and Double.

-- A very useful function for dealing with numbers is fromIntegral
-- It has a type declaration of

fromIntegeral :: (Num b, Integeral a) => a -> b

-- It takes an integral number and turns it into a more general number