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