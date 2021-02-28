[x*2 | x <- [1..10]] -- [2,4,6,8,10,12,14,16,18,20]

[x*2 | x <- [1..10], x*2 >= 12] -- [12,14,16,18,20]

[x | x <- [50..100], x `mod` 7 == 3] -- [52,59,66,73,80,87,94]

boomBangs xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
boomBangs [7..13] -- ["BOOM!", "BOOM!", "BANG!", "BANG!"]

[x | x <- [10..20], x /= 13, x /= 15, x /= 19] -- [10, 11, 12, 14, 16, 17, 18, 20]

[x*y | x <- [2, 5, 10], y <- [8, 10, 11]] -- [16,20,22,40,50,55,80,100,110]

[x*y | x <- [2, 5, 10], y <- [8, 10, 11], x * y > 50] -- [55, 80, 100, 110]

nouns = ["hobo", "frog", "pope"]
adjectives = ["lazy", "grouchy", "scheming"]
[adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]

length` xs = sum [1 | _ <- xs]

removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]
removeNonUppercase "Hahaha! Ahahaha!" -- "HA"
removeNonUppercase "IdontLIKEFROGS" -- "ILIKEFROGS"

xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]] 
[[ x | x <- xs, even x] | xs <- xxs]