-- You are given the following information, but you may prefer to do 
-- some research for yourself.

-- * 1 Jan 1900 was a Monday.
-- * Thirty days has September,
--   April, June and November.
--   All the rest have thirty-one,
--   Saving February alone,
--   Which has twenty-eight, rain or shine.
--   And on leap years, twenty-nine.
-- * A leap year occurs on any year evenly divisible by 4, but not 
-- on a century unless it is divisible by 400.

-- How many Sundays fell on the first of the month during the twentieth 
-- century (1 Jan 1901 to 31 Dec 2000)?

data Day = Sun | Mon | Tue | Wed | Thu | Fri | Sat deriving (Enum,Show,Bounded,Eq)

tomorrow :: Day -> Day
tomorrow d
  | d == (maxBound :: Day) = minBound :: Day
  | otherwise              = succ d

daysFrom :: Int -> Day -> Day
daysFrom n d = (iterate tomorrow d) !! n

leapYear y =
  let a = y `mod`   4 == 0
      b = y `mod` 100 == 0
      c = y `mod` 400 == 0
  in if (a && not b) || c then True else False

daysInMonth m y = 
  let i = [31,0,31,30,31,30,31,31,30,31,30,31] !! m
  in if i == 0 then if leapYear y then 29 else 28 else i

daysInYear y = if leapYear y then 366 else 365

-- For a month and year, how many days came before the first of that month
daysUpTo m y = sum $ map (`daysInMonth` y) [0 .. (m-1)]

-- For a given year and starting day, how many first of months were Sunday
sundaysInYear startDay y =
  let f n = ((n `daysUpTo` y) `daysFrom` startDay)
      l   = map f [0 .. 11]
      m d = if d == Sun then 1 else 0
  in sum $ map m l

-- give the first day of a year and get the first day of the following year
firstDayOfNextYear d y = daysInYear(y) `daysFrom` d

firstDaysOfTwentiethCentury days y
  | y > 2000  = days
  | otherwise = 
    let another ds = [firstDayOfNextYear (last ds) y]
    in firstDaysOfTwentiethCentury (days ++ (another days)) (y+1)

answer =
  let firstDays = firstDaysOfTwentiethCentury [Tue] 1901
      years     = [1901 .. 2000]
      siy i     = sundaysInYear (firstDays !! i) (years !! i)
  in sum $ map siy [0 .. 99]






