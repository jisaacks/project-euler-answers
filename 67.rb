# By starting at the top of the triangle below and moving to 
# adjacent numbers on the row below, the maximum total from 
# top to bottom is 23.

# 3
# 7 4
# 2 4 6
# 8 5 9 3

# That is, 3 + 7 + 4 + 9 = 23.

# Find the maximum total from top to bottom in triangle.txt 
# (right click and 'Save Link/Target As...'), a 15K text file 
# containing a triangle with one-hundred rows.

# NOTE: This is a much more difficult version of Problem 18. 
# It is not possible to try every route to solve this problem, 
# as there are 2 to the power of 99 altogether! If you could 
# check one trillion (10 to the power of 12) routes every 
# second it would take over twenty billion years to check them 
# all. There is an efficient algorithm to solve it. ;o)

def bottom_up(tri)
  last_row = nil
  tri.reverse.each do |row|
    if last_row
      last_row = row.each_with_index.map do |n,i|
        a = last_row[i].to_i
        b = last_row[i+1].to_i
        higher = a > b ? a : b
        n.to_i + higher
      end
    else
      last_row = row
    end
  end
  last_row
end

tri = File.open('triangle.txt').read.lines.map{ |line| line.split ' ' }

puts bottom_up tri