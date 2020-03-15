def partition(arr, n)
    lesser = []
    greater = []

    arr.each do |ele|
        if ele < n
            lesser << ele
        else
            greater << ele
        end
    end

    [lesser, greater]

end

def merge(hash1, hash2)
    new_hash = Hash.new

    hash1.each do |k, v|
        new_hash[k] = v
    end

    hash2.each do |k, v|
        new_hash[k] = v if hash2.keys.include?(k)
    end

    new_hash
end

def censor(sent, curse_arr)
    vowels = "aeiou"

    sent_arr = sent.split

    sent_arr.each do |word|
        if curse_arr.include?(word.downcase)
            word.each_char.with_index do |char, i|
                word[i] = "*" if vowels.include?(char.downcase)
            end
        end
    end

    sent_arr.join(" ")

end

def power_of_two?(num)
    return true if num == 1

    (1..num).each do |ele|
        return true if num == (2 ** ele)
    end

    false
end