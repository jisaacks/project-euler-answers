# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?


require "prime"

def highest_prime_facter(n)
  half = (n/2).round
  facters = (1..half).select { |i| n % i == 0 }
  primes = facters.select{ |i| Prime.prime? i }
  primes.last
end

puts highest_prime_facter(600851475143)