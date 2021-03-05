-- Pattern matching on parameters in function definitions
-- is actually just syntactic sugar for case expressions

head' :: [a] -> a
head' [] = error "No head for empty lists!"
head' (x:_) = x

head' :: [a] -> a
head' xs = case xs of [] -> error "No head for empty lists!'
					  (x:_) -> x

-- As you can see, the syntax for case expressions is pretty simple:

case expression of pattern -> result
				   pattern -> result
				   pattern -> result
				   ...

-- expression is matched against the patterns
-- the first pattern that matches the expression is used
-- If it falls through the whole case expression and no suitable pattern is found, a runtime error occurs.

-- Whereas pattern matching on function parameters can only be done when defining functions
--  expressions can be used pretty much anywhere

describeList :: [a] -> String
describeList xs = "The list is " ++ case xs of [] -> "empty."
											   [x] -> "a singleton list."
											   xs -> "a longer list."

--They are useful for pattern matching against something in the middle of an expression
-- We could have also defined this like so:

describeList :: [a] -> String
describeList xs = "The list is " ++ what xs
	where what [] = "empty."
		  what [x] = "a singleton list."
		  what xs = "a longer list."