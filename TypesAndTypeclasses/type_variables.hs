ghci> :t head
head :: [a] -> a

-- A it's not a type, 'cause types are written in capital case
-- It's actually a type variable. That means that a can be of any type
-- Functions that have type variables are called polymorphic functions

ghci> :t fst
fst :: (a, b) -> a