def solution
  def prime? n
    if n < 2
      return false
    elsif n == 2
      return true
    elsif n.even?
      return false
    end

    (3..Math.sqrt(n).ceil).step(2).each do |x|
      return false if n % x == 0
    end

    return true
  end

  primes = (1...1_000_000).select { |x| prime? x }

  hash = Hash.new(0)

  for i in (0...primes.count - 1)
    for j in (i + 1...primes.count)
      sum, count = primes[i..j].reduce(:+), j - i + 1
      break if sum > 1_000_000
      hash[sum] = count if count > hash[sum] and prime? sum
    end
  end

  puts hash.max_by { |k, v| v }.first
end