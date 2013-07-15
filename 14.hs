import Data.List

doEven :: (Fractional a, Integral a1) => a1 -> a
doEven n = fromIntegral(n)/2

doOdd :: (Fractional a, Integral a1) => a1 -> a
doOdd n = (3*fromIntegral(n))+1

collatzStep :: (Fractional a, Integral a1) => a1 -> a
collatzStep n = if odd n then doOdd(n) else doEven(n)

doCollatz :: (Integral a) => [a] -> [a]
doCollatz l@(x:xs)
  | x == 1    = reverse l
  | otherwise = doCollatz $ (round $ collatzStep x) : l

collatz :: Integral a => a -> [a]
collatz n = doCollatz [n]

allCollatzUnder :: Integral a => a -> [[a]]
allCollatzUnder n = map collatz [1..n]

lengthCompare :: [a] -> [a1] -> Ordering
lengthCompare a b = length(a) `compare` length(b)

sortByLength :: [[a]] -> [[a]]
sortByLength = sortBy lengthCompare

longestCollatzUnder :: Integral a => a -> [a]
longestCollatzUnder n = last $ sortByLength $ allCollatzUnder n

startForLongestCollatzUnder :: Integral a => a -> a
startForLongestCollatzUnder n = longestCollatzUnder(n) !! 0

answer = startForLongestCollatzUnder 1000000