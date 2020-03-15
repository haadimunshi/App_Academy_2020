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

def matrix_addition(matrix1, matrix2)
    final_matrix = []
    new_arr = []
    sub = []

    flattened1 = matrix1.flatten
    flattened2 = matrix2.flatten

    flattened1.each_with_index do |ele1, idx1|
        flattened2.each_with_index do |ele2, idx2|
            if idx2 == idx1
                sum = ele1 + ele2
                new_arr << sum
            end
        end
    end

    new_arr.each do |ele|
        sub << ele if sub.length < 2

        if sub.length == 2
            final_matrix << sub
            sub = []
        end
    end

    final_matrix

end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]
# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*nums)
    factor_count = Hash.new(0)
    common_factors = []

    nums.each do |ele|
        (1..ele).each do |fac|
            if ele % fac == 0
                factor_count[fac] += 1
            end
        end
    end

    factor_count.each do |k, v|
        common_factors << k if v == nums.length
    end

    common_factors

end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(n)
    trib_arr = [1, 1, 2, 4, 7, 13]

    if n <= 6
        return trib_arr[n - 1]
    end

    while trib_arr.length < n
        new_num = trib_arr[-1] + trib_arr[-2] + trib_arr[-3]
        trib_arr << new_num
    end

    trib_arr[n-1]

end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274