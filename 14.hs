-- The following iterative sequence is defined for the set of positive integers:

-- n  n/2 (n is even)
-- n  3n + 1 (n is odd)

-- Using the rule above and starting with 13, we generate the following sequence:

-- 13  40  20  10  5  16  8  4  2  1
-- It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. 
-- Although it has not been proved yet (Collatz Problem), it is thought that all starting 
-- numbers finish at 1.

-- Which starting number, under one million, produces the longest chain?

-- NOTE: Once the chain starts the terms are allowed to go above one million.

import Data.List
import qualified Data.Map as Map

collatzStep :: (Integral a, Integral b) => a -> b
collatzStep n
  | odd n     = round((3*fromIntegral(n))+1)
  | otherwise = round(fromIntegral(n)/2)

collatzLength n table
  | n == 1    = 1
  | otherwise = (+) 1 $ (collatzLookup . collatzStep) n table


collatzLookup n table = case Map.lookup n table of
  Just a  -> a
  Nothing -> (collatzLength n table)

collatzTable x =
  let insrt table v = Map.insert v (collatzLookup v table) table
  in foldl insrt Map.empty [1 .. x]

tableValueCompare :: (Num a, Ord a) => (a1, a) -> (a2, a) -> Ordering
tableValueCompare a b = (snd a) `compare` (snd b)

tableSort = sortBy tableValueCompare

longestUoTo n = fst $ last $ tableSort $ Map.toList $ collatzTable n

answer = longestUoTo 1000000