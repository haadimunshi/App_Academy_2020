# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(num)
prime_factors = []

    (1..num).each do |factor|
        prime_factors << factor if num % factor == 0 && prime?(factor)
    end

    prime_factors.last
end

def prime?(num)
    return false if num < 2

    (2...num).each do |fac|
        return false if num % fac == 0
    end

    true
end

def unique_chars?(str)
    counter = Hash.new(0)

    str.each_char do |char|
        counter[char] += 1
    end

    counter.values.each do |count|
        return false if count > 1
    end

    true
end

def dupe_indices(arr)
    counter = Hash.new(0)
    repeats = Hash.new

    arr.each do |ele|
        counter[ele] += 1
    end

    counter.each do |k, v|
        if v > 1
            indices = []
            arr.each_with_index do |char, i|
                indices << i if char == k
            end
            repeats[k] = indices
        end
    end

    repeats

end

def ana_array(arr1, arr2)
    return false if arr1.length != arr2.length

    arr2.each do |ele|
        return false if !arr1.include?(ele)
    end

    true

end