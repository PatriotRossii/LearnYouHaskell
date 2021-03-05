-- Very similar to where bindings are let bindings
-- Let bindings let you bind to variables anywhere and are expressions themselves
-- but are very local, so they don't span across guards
-- Just like any construct in Haskell that is used to bind values to names, let bindings can be used for pattern matching
-- Let's see them in action!

cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
	let sideArea = 2 * pi * r * h
		topArea = pi * r ^ 2
	in sideArea + 2 * topArea

-- The form is let <bindings> in <expression>.
-- The names that you define in the let part are accessible to the expression after the in part

-- The difference is that let bindings are expressions themselves
-- where bindings are just syntactic constructs

ghci> [if 5 > 3 then "Woo" else "Boo", if 'a' > 'b' then "Foo" else "Bar"]
["Woo", "Bar"]
ghci> 4 * (if 10 > 5 then 10 else 0) + 2
42

-- You can also do that with let bindings.

ghci> 4 * (let a = 9 in a + 1) + 2
42

-- They can also be used to introduce functions in a local scope:

ghci> [let square = x * x in (square 5, square 3, square 2)]
[(25, 9, 4)]

-- If we want to bind to several variables inline, we obviously can't align them at columns
-- That's why we can separate them with semicolons.

ghci> (let a = 100; b = 200; c = 300 in a * b * c, let foo="Hey "; bar = "there!" in foo ++ bar)
(6000000,"Hey there!")  

-- You don't have to put a semicolon after the last binding but you can if you want

ghci> (let (a, b, c) = (1,2,3) in a+b+c) * 100
600

-- You can also put let bindings inside list comprehensions

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]

-- we could make our function return only the BMIs of fat people:

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0]

-- We can't use the bmi name in the (w, h) <- xs part
-- because it's defined prior to the let binding

ghci> let zoot x y z = x * y + z
ghci> zoot 3 9 2
29
ghci> let boot x y z = x * y + z in boot 3 4 2
14
ghci> boot
<interactive>:1:0: Not in scope: `boot'  

-- let bindings are expressions and are fairly local in their scope,
-- they can't be used across guards
