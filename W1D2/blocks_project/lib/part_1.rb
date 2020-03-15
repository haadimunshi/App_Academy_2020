def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(dogs)
    dogs.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count { |sub| sub.sum > 0 }
end

def aba_array(words)
    words.map { |word| aba_translate(word) }
end

def aba_translate(word)
    vowels = "aeiou"

    i = 0

    while i < word.length
        char = word[i]
        if vowels.include?(char)
            word[i] = (char + "b" + char)
            i += 3
        else
            i += 1
        end
    end
    word

end