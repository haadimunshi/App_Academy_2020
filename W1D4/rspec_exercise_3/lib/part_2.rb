def element_count(arr)
    count = Hash.new(0)

    arr.map { |ele| count[ele] += 1 }

    count
end

def char_replace!(str, hash)
    str.each_char.with_index do |char, i|
        if hash.keys.include?(char)
            str[i] = hash[char]
        else
            str[i] = char
        end
    end
    str
end

def product_inject(arr)
    arr.inject { |acc, el| acc * el }
end