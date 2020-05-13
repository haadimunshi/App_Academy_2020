def conjunct_select(arr, *prcs)
    new_arr = []

    arr.each do |ele|
        prcs.each_with_index do |prc, i|
            break if !prc.call(ele)
            next if prc.call(ele) && i < prcs.length - 1
            new_arr << ele if prc.call(ele) && i == prcs.length - 1
        end
    end

    new_arr

end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]