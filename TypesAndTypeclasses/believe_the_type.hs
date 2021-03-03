ghci> :t 'a'
'a' :: Char

ghci> :t True
True :: Bool

ghci> :t "HELLO!"
"HELLO!" :: [Char]

ghci> :t (True, 'a')
(True, 'a') :: (Bool, Char)

ghci> :t 4 == 5
4 == 5 :: Bool

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A' .. 'Z']]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-- Overview of some commont types

-- Int stands for integer. It's used for whole numbers. 7 can be an Int but 7.2 cannot. Int is bounded, which means that it has a minimum and a maximum value. Usually on 32-bit machines the maximum possible Int is 2147483647 and the minimum is -2147483648.

-- Integer stands for, er … also integer. The main difference is that it's not bounded so it can be used to represent really really big numbers. I mean like really big. Int, however, is more efficient.
factorial :: Integer -> Integer
factorial n = product [1..n]

ghci > factorial 50
30414093201713378043612608166064768844377641568960512000000000000  

-- Float is a real floating point with single precision.
circumference :: Float -> Float  
circumference r = 2 * pi * r  

ghci> circumference 4.0
25.132742

-- Double is a real floating point with double the precision!
circumference' :: Double -> Double
circumference' r = 2 * pi * r

ghci> circumference' 4.0
25.132741228718345  

-- Bool is a boolean type. It can have only two values: True and False.

-- Char represents a character. It's denoted by single quotes. A list of characters is a string.