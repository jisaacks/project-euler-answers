# A palindromic number reads the same both ways. The largest palindrome made 
# from the product of two 2-digit numbers is 9009 = 91 99.

# Find the largest palindrome made from the product of two 3-digit numbers.


range = 100..999

palindrome = 0

range.each do |a|
  range.each do |b|
    product = a*b
    s = product.to_s
    if s == s.reverse && product > palindrome
      palindrome = product
    end
  end
end

puts palindrome