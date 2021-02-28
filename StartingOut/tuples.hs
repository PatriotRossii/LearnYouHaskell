-- fst takes a pair and returns its first component.
fst (8, 11) -- 8
fst ("Wow", False) -- "Wow"

-- snd takes a pair and returns its second component.
snd (8, 11) -- 11
snd ("Wow", False) -- False

-- Note: these functions operate only on pairs

-- zip takes two lists and then zips them together into one list by joining the matching elements into pairs
zip [1, 2, 3, 4, 5] [5, 5, 5, 5, 5] -- [(1,5), (2,5), (3,5), (4,5), (5,5)]
zip [1..5] ["one", "two", "three", "four", "five] -- [(1,"one"),(2,"two"),(3,"three"),(4,"four"),(5,"five")]
zip [5,3,2,6,2,7,2,5,4,6,6] ["im", "a", "turtle"] -- [(5,"im"), (3,"a"), (2, "turtle")]
zip [1..] ["apple", "orange", "cherry", "mango"] -- [(1,"apple"),(2,"orange"),(3,"cherry"),(4,"mango")]

-- let's try generating all triangles with sides equal to or smaller than 10
triangles = [ (a, b, c) | c <- [1..10], b <- [1..10], a <- [1..10]]

-- Next, we'll add a condition that they all have to be right triangles. We'll also modify this function by taking into consideration that side b isn't larger than the hypothenuse and that side a isn't larger than side b.
rightTriangles = [(a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]

-- Now, we just modify the function by saying that we want the ones where the perimeter is 24
rightTriangles` = [ (a, b,  c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]
rightTriangles` -- [(6, 8, 10)]