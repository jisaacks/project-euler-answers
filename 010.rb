# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.


require 'prime'

def solve
  s = 0
  Prime.each do |p|
    if p >= 2_000_000
      return s
    end
    s += p
  end
end

puts solve