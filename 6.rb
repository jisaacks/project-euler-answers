# The sum of the squares of the first ten natural numbers is,

# 12 + 22 + ... + 102 = 385
# The square of the sum of the first ten natural numbers is,

# (1 + 2 + ... + 10)2 = 552 = 3025
# Hence the difference between the sum of the squares of the 
# first ten natural numbers and the square of the sum is 3025  385 = 2640.

# Find the difference between the sum of the squares of the first one 
# hundred natural numbers and the square of the sum.


RANGE = 1..100

def sum_of_squares
  RANGE.reduce(0){ |m,n| m += n*n }
end

def square_of_sums
  r = RANGE.reduce(0){ |m,n| m += n }
  r*r
end

puts square_of_sums - sum_of_squares