# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
# we can see that the 6th prime is 13.

# What is the 10 001st prime number?


require 'prime'

def solve
  i = 0
  Prime.each do |p|
    i += 1
    if i == 10_001
      return p
    end
  end
end

puts solve