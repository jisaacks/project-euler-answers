data Ones =  One | Two   | Three | Four | Five | 
             Six | Seven | Eight | Nine deriving (Enum,Show)

data Teens = Ten     | Eleven    | Twelve   | Thirteen | Fourteen | Fifteen |
             Sixteen | Seventeen | Eighteen | Nineteen deriving (Enum,Show)

data Tens = Twenty | Thirty  | Forty  | Fifty | 
            Sixty  | Seventy | Eighty | Ninety deriving (Enum,Show)

noSpaces :: String -> String
noSpaces = filter (/=' ')

microNum :: Int -> String
microNum n 
  | n == 0    = []
  | otherwise = show $ [One .. Nine] !!  (n-1)

tinyNum :: Int -> String
tinyNum n = show $ [Ten .. Nineteen] !! (n `mod` 10)

smallNum :: Int -> String
smallNum n
  | n == 0    = []
  | otherwise = let prefix = show $ [Twenty .. Ninety] !! (floor $ fromIntegral(n)/10-2)
                    suffix = numString $ n `mod` 10
                in if length suffix > 0
                   then prefix ++ " " ++ suffix
                   else prefix

mediumNum :: Int -> String
mediumNum n = 
  let prefix = (microNum (floor $ fromIntegral(n)/100)) ++ " Hundred"
      suffix = numString $ n `mod` 100
  in if length suffix > 0
     then prefix ++ " And " ++ suffix
     else prefix

largeNum :: Int -> String
largeNum 1000 = "One Thousand"

numString :: Int -> String
numString n
  | n < 10    = microNum n
  | n < 20    = tinyNum n
  | n < 100   = smallNum n
  | n < 1000  = mediumNum n
  | otherwise = largeNum n

answer = sum $ map (length . noSpaces . numString) [1 .. 1000]