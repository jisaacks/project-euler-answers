
$cache = {}

$max = 4000000

$sum = 0

def fib (n)
  return $cache[n.to_s] if $cache.keys.include? n.to_s
  return n if n < 2
  $cache[n.to_s] = fib(n - 1) + fib(n - 2)
end

def get_sum
  i = 2
  while true
    term = fib(i)
    if term <= $max
      $sum += term if term % 2 == 0
    else
      return $sum
    end
    i += 1
  end
end

puts "The sum is #{get_sum}"