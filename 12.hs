-- this technically should work but would
-- take a every long time without memoizing

triangle :: (Integral a) => a -> a
triangle n = foldl1 (+) [1..n]

triangles = map triangle [1..]

divisors :: (Integral a) => a -> a
divisors n = sum [z + 1 | z <- (map (n `mod`) [1..n]), z == 0]

divisorlist = map divisors triangles

under = takeWhile (<501) divisorlist

answer = triangle $ 1 + (length under)