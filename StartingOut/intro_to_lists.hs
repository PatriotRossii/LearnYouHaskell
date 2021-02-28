lostNumbers = [4, 8, 15, 16, 23, 42]
[1, 2, 3, 4] ++ [9, 10, 11, 12] -- [1,2,3,4,9,10,11,12]
"hello" ++ " " ++ "world" -- "hello world"
['w', 'o'] ++ ['o', 't'] -- "woot"

'A':" SMALL CAT" -- "A SMALL CAT"
5:[1,2,3,4,5] -- [5,1,2,3,4,5]

-- If you want to get an element out of a list by index, use !!. The indices start at 0.
"Steve Buscemi" !! 6 -- 'B'
[9.4, 33.2, 96.2, 11.2, 23.25] !! 1 -- 33.2

b = [[1,2,3,4], [5,3,3,3], [1,2,2,3,4], [1,2,3]]
b ++ [[1, 1, 1, 1]] -- [[1,2,3,4], [5,3,3,3], [1,2,2,3,4], [1,2,3], [1,1,1,1]]
[6,6,6]:b -- [[6,6,6], [1,2,3,4], [5,3,3,3], [1,2,2,3,4], [1,2,3]]
b !! 2 -- [1,2,2,3,4]

[3, 2, 1] > [2, 1, 0] -- True
[3, 2, 1] > [2, 10, 100] -- True
[3, 4, 2] > [3, 4] -- True
[3, 4, 2] > [2, 4] -- True
[3, 4, 2] == [3, 4, 2] -- True

-- head takes a list and returns its head. The head of a list is basically its first element. 
head [5, 4, 3, 2, 1] -- 5

-- tail takes a list and returns its tail. In other words, it chops off a list's head.
tail [5, 4, 3, 2, 1] -- [4, 3, 2, 1]

-- last takes a list and returns its last element.
last [5, 4, 3, 2, 1] -- 1

-- init takes a list and returns everything except its last element.
init [5, 4, 3, 2, 1] -- [5, 4, 3, 2]

-- length takes a list and returns its length, obviously.
length [5,4,3,2,1] -- 5

-- null checks if a list is empty. If it is, it returns True, otherwise it returns False.
null [1, 2, 3] -- False
null [] -- True

-- reverse reverses a list.
reverse [5, 4, 3, 2, 1] -- [1, 2, 3, 4, 5]

-- take takes number and a list. It extracts that many elements from the beginning of the list.
take 3 [5, 4, 3, 2, 1] -- [5, 4, 3]
take 1 [3, 9, 3] -- [3]
take 5 [1, 2] -- [1, 2]
take 0 [6, 6, 6] -- []

-- drop works in a similar way, only it drops the number of elements from the beginning of a list.
drop 3 [8, 4, 2, 1, 5, 6] -- [1, 5, 6]
drop 0 [1, 2, 3, 4] -- [1, 2, 3, 4]
drop 100 [1, 2, 3, 4] -- []

-- maximum takes a list of stuff that can be put in some kind of order and returns the biggest element.
-- minimum returns the smallest.
minimum [8, 4, 2, 1, 5, 6] -- 1
maximum [1, 9, 2, 3, 4] -- 9

-- sum takes a list of numbers and returns their sum.
-- product takes a list of numbers and returns their product.
sum [5, 2, 1, 6, 3, 2, 5, 7] -- 31
product [6, 2, 1, 2] -- 24
product [1, 2, 5, 6, 7, 9, 2, 0] -- 0

-- elem takes a thing and a list of things and tells us if that thing is an element of the list
4 `elem` [3, 4, 5, 6] -- True
10 `elem` [3, 4, 5, 6] -- False