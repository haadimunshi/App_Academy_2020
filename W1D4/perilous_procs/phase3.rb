def selected_map!(arr, prc1, prc2)
    arr.map! { |ele| prc1.call(ele) ? prc2.call(ele) : ele }
    return nil
end

# is_even = Proc.new { |n| n.even? }
# is_positive = Proc.new { |n| n > 0 }
# square = Proc.new { |n| n * n }
# flip_sign = Proc.new { |n| -n }

# arr_1 = [8, 5, 10, 4]
# p selected_map!(arr_1, is_even, square)     # nil
# p arr_1                                     # [64, 5, 100, 16]

# arr_2 = [-10, 4, 7, 6, -2, -9]
# p selected_map!(arr_2, is_even, flip_sign)  # nil
# p arr_2                                     # [10, -4, 7, -6, 2, -9]

# arr_3 = [-10, 4, 7, 6, -2, -9]
# p selected_map!(arr_3, is_positive, square) # nil
# p arr_3                                     # [-10, 16, 49, 36, -2, -9]

def chain_map(value, procs_arr)
    new_values = []

    procs_arr.map do |prc|
        if new_values.empty?
            new_values << prc.call(value)
        else
            new_values << prc.call(new_values[-1])
        end
    end

    new_values[-1]
end

# add_5 = Proc.new { |n| n + 5 }
# half = Proc.new { |n| n / 2.0 }
# square = Proc.new { |n| n * n }

# p chain_map(25, [add_5, half])          # 15.0
# p chain_map(25, [half, add_5])          # 17.5
# p chain_map(25, [add_5, half, square])  # 225
# p chain_map(4, [square, half])          # 8
# p chain_map(4, [half, square])          # 4

def proc_suffix(sent, hash)
    new_sent = []
    new_word = ""

    sent.split.each do |word|
        hash.keys.each do |prc|
            if new_word == "" && prc.call(word)
                new_word += word + hash[prc]
            elsif new_word != "" && prc.call(word)
                new_word += hash[prc]
            elsif !prc.call(word)
                next
            end
        end
        new_sent << new_word if new_word != ""
        new_sent << word if new_word == ""
        new_word = ""
    end

    new_sent.join(" ")

end
# This one took some time and tinkering.

# contains_a = Proc.new { |w| w.include?('a') }
# three_letters = Proc.new { |w| w.length == 3 }
# four_letters = Proc.new { |w| w.length == 4 }

# p proc_suffix('dog cat',
#     contains_a => 'ly',
#     three_letters => 'o'
# )   # "dogo catlyo"

# p proc_suffix('dog cat',
#     three_letters => 'o',
#     contains_a => 'ly'
# )   # "dogo catoly"

# p proc_suffix('wrong glad cat',
#     contains_a => 'ly',
#     three_letters => 'o',
#     four_letters => 'ing'
# )   # "wrong gladlying catlyo"

# p proc_suffix('food glad rant dog cat',
#     four_letters => 'ing',
#     contains_a => 'ly',
#     three_letters => 'o'
# )   # "fooding gladingly rantingly dogo catlyo"

def proctition_platinum(arr, *procs)
    hash = {}

    i = 1
    while i <= procs.length
        hash[i] = true

        i += 1
    end

    i = 1
    while i < hash.keys.length + 1
        hash.each do |k, v|
            if i == k
                hash[k] = []
                arr.map do |ele|
                    if procs[i-1].call(ele)
                        hash[k] << ele if !hash.values.flatten.include?(ele)
                    end
                end
            end
        end
        i += 1
    end

    hash
end
# This one took a fair amount of time and tinkering.

# is_yelled = Proc.new { |s| s[-1] == '!' }
# is_upcase = Proc.new { |s| s.upcase == s }
# contains_a = Proc.new { |s| s.downcase.include?('a') }
# begins_w = Proc.new { |s| s.downcase[0] == 'w' }

# p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, contains_a)
# # {1=>["when!", "WHERE!"], 2=>["what"]}

# p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, is_upcase, contains_a)
# # {1=>["when!", "WHERE!"], 2=>["WHO", "WHY"], 3=>["what"]}

# p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_upcase, is_yelled, contains_a)
# # {1=>["WHO", "WHERE!", "WHY"], 2=>["when!"], 3=>["what"]}

# p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], begins_w, is_upcase, is_yelled, contains_a)
# # {1=>["WHO", "what", "when!", "WHERE!", "WHY"], 2=>[], 3=>[], 4=>[]}

def procipher(sent, hash)
    
end