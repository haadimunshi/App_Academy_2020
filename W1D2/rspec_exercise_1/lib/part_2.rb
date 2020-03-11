def hipsterfy(word)
    new_str = ""

    vowels = "aeiou"

    # return word if !vowels.include?(word)

    count = 0
    i = word.length - 1
    while i >= 0
        if !vowels.include?(word[i])
            new_str += word[i]
        else
            new_str += word[0..(i-1)].reverse
            break
        end

        i -= 1
    end

    new_str.reverse

end

def vowel_counts(str)
    vowels = "aeiou"

    vowel_count = Hash.new(0)

    str.downcase!
    str.each_char do |char|
        vowel_count[char] += 1 if vowels.include?(char)
    end

    vowel_count
end

def caesar_cipher(msg, n)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    new_str = ""

    msg.each_char do |char|
        if alpha.include?(char)
            current_idx = msg.index(char)
            next_idx = (alpha.index(char) + n) % 26
            new_char = alpha[next_idx]
            new_str += new_char
        else
            new_str += char
        end
    end

    new_str

end