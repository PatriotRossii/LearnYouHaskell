-- In the previous section, we defined a BMI calculator function and berator like this:

bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height  
    | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"  
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise                   = "You're a whale, congratulations!"  

-- Notice that we repeat ourselves here three times
-- it would be ideal if we could calculate it once, bind it to a name and then use that name instead of the expression
-- Well, we can modify our function like this:

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
	| bmi <= 18.5 = "You're underweight, you emo, you!"
	| bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
	| bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
	| otherwise = "You're a whale, congratulations!"
	where bmi = weight / height ^ 2

-- We put the keyword where after the guards
-- and then we define several names or functions
-- We could go a bit overboard and present our function like this:

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
	| bmi <= skinny = "You're underweight, you emo, you!"
	| bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
	| bmi <= fat = "You're fat! Lose some weight, fatty!"
	| otherwise = "You're a whale, congratulations!"
	where bmi = weight / height ^ 2
		skinny = 18.5
		normal = 25.0
		fat = 30.0

-- You can also use where bindings to pattern match!
-- We could have rewritten the where section of our previous function as:

...
where bmi = weight / height ^ 2
	(skinny, normal, fat) = (18.5, 25.0, 30.0)

-- Let's make another fairly trivial function where
-- we get a first and a last name and give someone back their initials.

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
	where (f:_) = firstname
		  (l:_) = lastname

-- We could have done this pattern matching directly in the function's parameters
-- but this just goes to show that it's possible to do it in where bindings as well

-- Just like we've defined constants in where blocks, you can also define functions
-- let's make a function that takes a list of weight-height pairs and returns a list of BMIs

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
	where bmi weight height = weight / height ^ 2

-- where bindings can also be nested. It's a common idiom to make a function and define some helper function in its where clause
-- and then to give those functions helper functions as well, each with its own where clause
