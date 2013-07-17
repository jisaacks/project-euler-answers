# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, 
# and 719, are themselves prime.

# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

# How many circular primes are there below one million?


class Primes
  def initialize n
    @primes = []
    build_primes_up_to n
  end

  def circular
    @primes.select{ |p| circular? p }
  end

  private
  
  def add_if_prime n
    return if n < 2
    return if @primes.last && @primes.last >= n
    @primes.each do |p|
      return if n % p == 0
    end
    @primes << n
  end

  def build_primes_up_to n
    (1..n).to_a.each{ |i| add_if_prime i }
  end

  def circular? n
    circle(n).reject{ |i| @primes.include? i }.empty?
  end

  def circle n
    a = n.to_s.split('')
    c = []
    a.each do
      a << a.shift
      c << a.join('').to_i
    end
    c
  end
end

puts Primes.new(1_000_000).circular.size


