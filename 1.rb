# If we list all the natural numbers below 10 that are multiples 
# of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.


def multiple_of_3_or_5(n)
  return true if n % 3 == 0
  return true if n % 5 == 0
  false
end

sum = 0

(1..999).each do |i|
  sum += i if multiple_of_3_or_5 i
end

puts "The sum is: #{sum}"