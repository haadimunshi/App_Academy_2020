def anti_prime?(num)
    count1 = 0

    (1..num).each do |fac|
        count1 += 1 if num % fac == 0
    end

    (1...num).each do |fac|
        count2 = 0
        (1..fac).each do |div|
            if fac % div == 0
                count2 += 1
                return false if count2 > count1
            end
        end
    end

    true

end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false