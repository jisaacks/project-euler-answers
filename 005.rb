# 2520 is the smallest number that can be divided by each of 
# the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly 
# divisible by all of the numbers from 1 to 20?

NUMBER = 20

def divisible n
  (1..NUMBER).each do |i|
    divided = n.to_f / i.to_f
    return false if divided.round != divided
  end
  true
end

m = NUMBER
until divisible m
  m += NUMBER
end

puts m
