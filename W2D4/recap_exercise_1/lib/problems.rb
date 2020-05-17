# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    pairs = []
    i = 0
    while i < words.length - 1
        j = i + 1
        while j < words.length
            first_word_vowels = vowel_counter(words[i]).keys 
            second_word_vowels = vowel_counter(words[j]).keys
            all_vowels = first_word_vowels << second_word_vowels
            all_vowels.flatten!
            if all_vowels.uniq.length == 5
                pairs << words[i] + " " + words[j] if !pairs.include?(words[i]) && !pairs.include?(words[j])
            end
        j += 1
        end
    i += 1
    end

    pairs
end

def vowel_counter(word)
    vowels = "aeiou"
    count = Hash.new(0)

    word.each_char do |char|
        if vowels.include?(char)
            count[char] += 1
        end
    end

    count
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    return true if !prime?(num)
    false
end

def prime?(num)
    (2...num).each do |fac|
        return false if num % fac == 0
    end
    true
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    found_bigrams = []
    i = 0
    while i < str.length - 1
        pair_of_chars = str[i] + str[i+1]
        found_bigrams << pair_of_chars if bigrams.include?(pair_of_chars)

        i += 1
    end
    
    sorted_bigrams = []
    bigrams.map { |bigram| sorted_bigrams << bigram if found_bigrams.include?(bigram) }

    sorted_bigrams
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        new_hash = {}

        self.each do |k, v|
            prc ||= Proc.new { |k, v| new_hash[k] = v if k == v }
            new_hash[k] = v if prc.call(k, v)
        end
        new_hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        subs = []
        
        i = 0
        while i < self.length
            j = 0
                while j < self.length
                    if length == nil
                        sub = self[i..j]
                        subs << sub if !sub.empty?
                    else
                        sub = self[i..j]
                        subs << sub if sub.length == length
                    end
                j += 1
                end
        i += 1
        end

        subs

    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        new_str = ""
        alpha = "abcdefghijklmnopqrstuvwxyz"

        self.each_char do |char|
            index_in_alpha = alpha.index(char)
            new_index_in_alpha = (alpha.index(char) + num) % 26
            new_char = alpha[new_index_in_alpha]
            new_str += new_char
        end

        new_str

    end
end
