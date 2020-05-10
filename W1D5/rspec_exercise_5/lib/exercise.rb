
def prizz_proc(arr, prc1, prc2)
    new_arr = []

    arr.select { |ele| new_arr << ele if (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele))}

    new_arr
end

def zany_zip(*arrs)
    zip(*arrs)
end

def zip(*arrs)
    final = []
    new_arr = []

    i = 0

    while i < max_length(*arrs)
        arrs.each do |arr|
            new_arr << arr[i]
        end
        i += 1
        final << new_arr
        new_arr = []
    end

    final

end

def max_length(*arrs)
    lengths = []

    arrs.map { |arr| lengths << arr.length }

    lengths.sort.max
end

def maximum(arr, &prc)
    return nil if arr.empty?
    hash = {}

    arr.each_with_index do |ele, i|
        hash[prc.call(ele)] = i
    end

    max_index = hash[hash.keys.max]

    arr[max_index]

end

def my_group_by(arr, &prc)
    hash = Hash.new { |h, k| h[k] = [] }

    arr.each do |ele|
        key = prc.call(ele)
        val = ele
        hash[key] << val
    end

    hash

end

def max_tie_breaker(arr, prc1, &prc2)
    hash = my_group_by(arr, &prc2)

    elements = hash[hash.keys.max]
    return elements.join(" ") if elements.length == 1

    maximum(elements, &prc1)

    elements[0]
end

def silly_syllables(sent)
    new_sent = []
    new_word = ""
    vowels = "aeiou"
    vowel_indices = []

    words = sent.split(" ")
    words.each do |word|
        if vowel_count(word) < 2
            new_sent << word
        else
            word.each_char.with_index do |char, i|
                if vowels.include?(char)
                    vowel_indices << i
                end
            end
            
            new_word += word[vowel_indices[0]..vowel_indices[-1]]
            new_sent << new_word
            new_word = ""
            vowel_indices = []
        end
        
    end

    new_sent.join(" ")

end

def vowel_count(word)
    vowels = "aeiou"
    vowel_count = 0

    word.each_char do |char|
        vowel_count += 1 if vowels.include?(char)
    end

    vowel_count
end










































# def prizz_proc(arr, prc1, prc2)
#     new_arr = []

#     arr.each do |ele|
#         if (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele))
#             new_arr << ele
#         end
#     end

#     new_arr
# end

# def zany_zip(*arrs)
#     zip(*arrs)
# end

# def zip(*arrs)
#     final = []
#     max_length = max_length(arrs)

#     i = 0

#     while i < max_length
#         new_arr = []
#         arrs.each do |arr|
#             if arr[i] == nil
#                 new_arr << nil
#             else
#                 new_arr << arr[i]
#             end
#         end
#         final << new_arr.flatten
#         i += 1
#     end

#     final

# end

# def max_length(arrs)
#     lengths = []

#     arrs.map { |arr| lengths << arr.length }

#     return lengths.max
# end

# def maximum(arr, &prc)
#     return nil if arr.empty?

#     new_arr = []

#     arr.each_with_index do |ele, i|
#         new_arr << [prc.call(ele), i]
#     end

#     sorted = new_arr.flatten.sort

#     sorted
        

# end