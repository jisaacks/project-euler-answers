# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?


require "prime"

def highest_prime_facter(n)
  half = (n/2).round
  highest_prime = 1
  Prime.each do |prime|
    highest_prime = prime if n % prime == 0
    break if prime * prime > half
  end
  highest_prime
end

puts highest_prime_facter(600851475143)