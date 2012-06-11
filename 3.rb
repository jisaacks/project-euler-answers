require "prime"

def highest_prime_facter(n)
  half = (n/2).round
  facters = (1..half).select { |i| n % i == 0 }
  primes = facters.select{ |i| Prime.prime? i }
  primes.last
end

puts highest_prime_facter(600851475143)