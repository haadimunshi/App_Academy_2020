def ideal_numbers(n)
    perfect_nums = []

    i = 1
    while perfect_nums.length < n
        perfect_nums << i if perfect_number?(i)
    
        i += 1
    end

    perfect_nums

end

def perfect_number?(num)
    return true if num == aliquot_sum(num)
    false
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def proper_factors(num)
    divisors = []

    (1...num).each do |div|
        divisors << div if num % div == 0
    end

    divisors
end