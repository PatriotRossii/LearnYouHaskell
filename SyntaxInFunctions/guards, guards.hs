bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
	| bmi <= 18.5 = "You're underweight, you emo, you!"
	| bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
	| bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
	| otherwise = "You're a whale, congratulations!"
	
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
	| weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"
	| weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
	| weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"
	| otherwise = "You're a whale, congratulations!"

-- Let's see if I'm fat...

ghci> bmiTell 85 1.90
"You're supposedly normal. Pffft, I bet you're ugly!"

-- Another very simple example: let's implement our own max function
max' :: (Ord a) => a -> a -> a
max' a b
	| a > b = a
	| otherwise = b

-- Guards can also be written inline

max' :: (Ord a) => a -> a -> a
max' a b | a > b = a | otherwise = b

-- Not very readable at all!
-- Moving on: let's implement our own compare by using guards

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
	| a > b = GT
	| a == b = EQ
	| otherwise = LT

ghci> 3 `myCompare` 2
GT

--Note: Not only can we call functions as infix with backticks,
-- we can also define them using backticks. Sometimes it's easier to read that way.