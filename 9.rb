# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,

# a2 + b2 = c2

# For example, 32 + 42 = 9 + 16 = 25 = 52.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.


def solve
  squares = (1..500).to_a.map{ |i| i*i }
  squares.each do |a2|
    squares.each do |b2|
      c2 = a2 + b2
      if squares.include? c2
        a = Math.sqrt(a2).to_i
        b = Math.sqrt(b2).to_i
        c = Math.sqrt(c2).to_i
        if ( a + b + c ) == 1000
          return a * b * c
        end
      end
    end
  end
end

puts solve