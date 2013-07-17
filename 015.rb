# Starting in the top left corner of a 2x2 grid, 
# there are 6 routes (without backtracking) to 
# the bottom right corner.

# How many routes are there through a 20x20 grid?


require 'matrix'
def paths size
  m = *Matrix.zero(size+1).map{1}
  m.each_with_index do |a,r|
    a.each_with_index do |e,c|
      unless r.zero? || c.zero?
        m[r][c] = m[r-1][c] + m[r][c-1]
      end
    end
  end
  m[size][size]
end

puts paths(20)