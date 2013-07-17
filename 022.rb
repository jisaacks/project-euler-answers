# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file 
# containing over five-thousand first names, begin by sorting it into alphabetical 
# order. Then working out the alphabetical value for each name, multiply this value 
# by its alphabetical position in the list to obtain a name score.

# For example, when the list is sorted into alphabetical order, COLIN, which is worth 
# 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a 
# score of 938 * 53 = 49714.

# What is the total of all the name scores in the file?

def worth(str)
  str.downcase.split('').map do |letter| 
    ("a".."z").find_index(letter)+1 
  end.reduce(&:+)
end

names = File.open('names.txt').read.gsub(/"/,'').split(',').sort

scores = {}

names.each_with_index do |name,index|
  scores[name] = worth(name) * (index + 1)
end

puts scores.values.reduce(&:+)