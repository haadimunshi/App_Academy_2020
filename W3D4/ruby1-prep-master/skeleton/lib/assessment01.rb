class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    if accumulator
      self.each do |num|
        accumulator = prc.call(accumulator, num)
      end
    else
      accumulator = self.first
      self[1..-1].each do |num|
        accumulator = prc.call(accumulator, num)
      end
    end
  accumulator
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  (2...num).each do |fac|
    return false if num % fac == 0
  end

  true
end

def primes(num)
  primes = []

  while primes.length < num
    (2..1000).each do |n|
      if is_prime?(n)
        primes << n
        break if primes.length == num
      end
    end
  end

  primes
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  return [1, 1] if num == 2

  factorials_rec(num-1)
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    duplicates = Hash.new { |h, k| h[k] = [] }

    repeats = []

    i = 0
    while i < self.length
      j = 1
      while j < self.length
        if self[i] == self[j] && !repeats.include?(self[i]) && i != j
          repeats << self[i]
        end

        j += 1
      end

      i += 1
    end

    self.each_with_index do |ele, i|
      if repeats.include?(ele)
        duplicates[ele] << i
      end
    end

    duplicates


  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    substrings = []

    # if self == self.reverse
    #   substrings << self
    # end

    i = 0
    while i < self.length
      j = 1
      while j < self.length
        if self[i..j] == self[i..j].reverse && self[i..j].length > 1
          substrings << self[i..j]
        end
        j += 1
      end
    i += 1
    end

    substrings 
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    return [] if self.empty?
    return self if self.length == 1

    pivot = self[1]
    left = self[0...1]
    right = self[2..-1]

    self.merge(left, right, &prc)

  end

  # private
  def self.merge(left, right, &prc)
    duped = []

    pivot = self[1]
    left.each do |num|
      duped << prc.call(pivot, num)
    end

    right.each do |num|
      duped << prc.call(pivot, num)
    end

    duped

  end
end
