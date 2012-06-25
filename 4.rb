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