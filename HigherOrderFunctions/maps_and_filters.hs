-- map takes a function and a list and applies that function to every
-- element in the list, producing a new list
 
map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x:xs) = f x : map f xs

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f x = [f e | e <- x]

ghci> map (+3) [1,5,3,1,6]
[4,8,6,4,9]
ghci> map (++ "!") ["BIFF", "BANG", "POW"]
["BIFF!", "BANG!", "POW!"]
ghci> map (replicate 3) [3..6]
[[3,3,3],[4,4,4],[5,5,5],[6,6,6]]
ghci> map (map (^2)) [[1,2],[3,4,5,6],[7,8]]
[[1,4],[9,16,25,36],[49,64]]
ghci> map fst [(1,2),(3,5),(6,3),(2,6),(2,5)]
[1,3,6,2,2]

-- filter takes a predicate and a list and then return the list
-- of elements that satisfy the predicate

filter :: (a -> Bool) -> [a] -> [a]
filter _ [] = []
filter p (x:xs)
	| p x = x : filter p xs
	| otherwise = filter p xs


filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p l = [e | e <- l, p e]

-- Some usage examples:

ghci> filter (>3) [1,5,3,2,1,6,4,3,2,1]
[5,6,4]
ghci> filter (==3) [1,2,3,4,5]
[3]
ghci> filter even [1..10]
[2,4,6,8,10]
ghci> let notNull x = not (null x) in filter notNull [[1,2,3],[],[3,4,5],[2,2],[],[],[]]
[[1,2,3],[3,4,5],[2,2]]
ghci> filter (`elem` ['a'..'z']) "u LaUgH aT mE BeCaUsE I aM diFfeRent"
"uagameasadifeent"
ghci> filter (`elem` ['A'..'Z']) "i lauGh At You BecAuse u r aLL the Same"  
"GAYBALLS"  

-- All of this could also be achived with list comprehensions by the use of
-- predicates

-- Remember out quicksort function from the previous chapter?
-- We used list comprehensions to filter out the list some elements
-- We can achieve the same functionality in a more readable way by using filter:

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
	let smallerSorted = quicksort (filter (<=x) xs)
		biggerSorted = quicksort (filter (>x) xs)
	in	smallerSorted ++ [x] ++ biggerSorted
	
-- Let's find the largest number under 100000 that's divisible by 3829

largestDivisible :: (Integral a) => a
largestDivisible = head (filer p [100000, 99999..])
	where p x = x `mod` 3829 == 0

-- Next up, we're going to find the sum of all odd squares that are smaller than 10000

-- takeWhile function takes a predicate and a list and then goes from the
-- beginning of the list and returns its elements while the predicate holds true
-- Once an element is found for which the predicate doesn't hold, it stops

ghci> takeWhile (/=' ') "elephants know how to party"
"elephants"

ghci> sum (takeWhile(<10000) (filter odd (map (^2) [1..])))
166650

-- We could have also written this using list comprehensions

ghci> sum (takeWhile(<10000) [x ^ 2 | x <- [1..], odd x])
166650

-- For our next problem, we'll be dealing with Collatz sequences
-- We take a nat. num. If that num is even, we divide it by two
-- If it's odd, we multiply id by 3 and then add 1 to that

-- Now we want to know is this: for all starting numbers between 1 and 100,
-- how many chains have a length greater than 15?

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
	| even n = n : chain(n `div` 2)
	| odd n = n : chain(n*3 + 1)


ghci> chain 10
[10,5,16,8,4,2,1]
ghci> chain 1
[1]
ghci> chain 30
[30,15,46,23,70,35,106,53,160,80,40,20,10,5,16,8,4,2,1]

-- And now, the function that tells us the answer to our question:

numLongChains :: Int
numLongChains = length (filter isLong (map chain [1..100]))
	where isLong xs = length xs > 15

-- We can also do something like

ghci> let listOfFuns = map (*) [0..]
ghci> (listOfFuns !! 4) 5
20