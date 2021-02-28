[1..20] -- [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
['a' .. 'z'] - "abcdefghijklmnopqrstuvwxyz"
['K' .. 'Z'] -- "KLMNOPQRSTUVWXYZ"

[2, 4..20] -- [2,4,6,8,10,12,14,16,18,20]
[3,6..20] -- [3,6,9,12,15,18]

-- You can't do something like this:
[20..1] -- Error
-- You have to do
[20, 19..1] -- [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]

[0.1, 0.3 .. 1] -- [0.1, 0.3, 0.5, 0.7, 0.8999999999999999,1.0999999999999999]

[13, 26..24*13] -- is equivalent to
take 24 [13, 26]

-- cycle takes a list and cycles it into an infinite list
take 10 (cycle [1,2,3]) -- [1,2,3,1,2,3,1,2,3,1]
take 12 (cycle "LOL ") -- "LOL LOL LOL "

-- repeat takes an element and produces an infinite list of just that element. It's like cycling a list with only one element.
take 10 (repeat 5) -- [5,5,5,5,5,5,5,5,5,5]
-- is equivalent to
replicate 10 5 -- [5,5,5,5,5,5,5,5,5,5]