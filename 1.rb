
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