-- The nth term of the sequence of triangle numbers is given by, 
-- tn = ½n(n+1); so the first ten triangle numbers are:

-- 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

-- By converting each letter in a word to a number corresponding 
-- to its alphabetical position and adding these values we form 
-- a word value. For example, the word value for SKY is 
-- 19 + 11 + 25 = 55 = t10. If the word value is a triangle number 
-- then we shall call the word a triangle word.

-- Using words.txt (right click and 'Save Link/Target As...'), 
-- a 16K text file containing nearly two-thousand common English words, 
-- how many are triangle words?

import System.IO
import Data.List
import Data.List.Split

main = do
  handle   <- openFile "words.txt" ReadMode
  contents <- hGetContents handle
  let wordValues   = map wordValue (ioWords contents)
  let maxWordValue = maximum wordValues
  let triangles'   = takeWhile (<= maxWordValue) triangles
  let isTringle n  = n `inList` triangles'
  let answer       = sum $ map isTringle wordValues
  putStrLn $ show answer
  hClose handle

noQuotes = filter (/='"')

ioWords text = map noQuotes (splitOn "\",\"" text)

charValue c = (1 +) $ head $ c `elemIndices` ['A' .. 'Z']

wordValue w = sum $ map charValue w

triangle n = foldl1 (+) [1..n]

triangles = map triangle [1..]

inList e l = case e `elemIndex` l of
  Just a  -> 1
  Nothing -> 0