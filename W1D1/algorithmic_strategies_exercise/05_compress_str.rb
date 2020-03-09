# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    new_str = ""
    
    count = 1

    i = 0
    while i < str.length 
        current_char = str[i]
        next_char = str[i+1]

        if current_char == next_char
            count += 1
        elsif count > 1 && current_char != next_char
            new_str += (count).to_s
            new_str += current_char
            count = 1
        elsif count == 1 && current_char != next_char
            new_str += current_char
        elsif count > 1 && next_char == nil
            new_str += (count).to_s
            new_str += current_char
        elsif count == 1 && next_char == nil
            new_str += current_char
        end

        i += 1
    end

    new_str

end


p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
