def no_dupes?(arr)
    # arr.uniq isn't working for some reason
    uniques = []
    count = Hash.new(0)

    arr.map { |ele| count[ele] += 1 }

    count.select { |k, v| uniques << k if v == 1 }

    uniques
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []


def no_consecutive_repeats?(arr)
    i = 0
    while i < arr.length - 1
        return false if arr[i] == arr[i+1]

    i += 1
    end

    true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true


def char_indices(str)
    indices = Hash.new { |h, k| h[k] = [] }

    str.each_char.with_index do |char, i|
        indices[char] << i
    end

    indices
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


def longest_streak(str)
    current = ""
    longest = ""

    (0..str.length - 1).each do |i|
        if str[i] == str[i-1]
            current += str[i]
        else
            current = str[i]
        end

        if longest.length <= current.length
            longest = current
        end
    end

    longest

end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'


def bi_prime?(num)
    primes_below_num = []

    (2...num).each do |fac|
        if prime?(fac)
            primes_below_num << fac
        end
    end

    i = 0
    while i < primes_below_num.length
        j = i + 1
        while j < primes_below_num.length
            return true if primes_below_num[i] * primes_below_num[j] == num
            return true if primes_below_num[i] * primes_below_num[i] == num
            j += 1
        end
        i += 1
    end

    false

end

def prime?(num)
    (2...num).each do |fac|
        return false if num % fac == 0
    end
    true
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false


def vigenere_cipher(message, keys)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    new_message = ""

        i = 0
        while i < keys.length
            message.each_char do |char|
                old_idx_in_alpha = alpha.index(char)
                new_idx_in_alpha = (alpha.index(char) + keys[i]) % 26
                new_char = alpha[new_idx_in_alpha]
                new_message += new_char

                if new_message.length < message.length && i < keys.length - 1
                    i += 1
                elsif new_message.length < message.length && i == keys.length - 1
                    i = 0
                else
                    return new_message
                end
            end
        end
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"


def vowel_rotate(str)
    vowels = "aeiou"
    current_vowel = ""
    new_str = ""

    i = 0
    while i < str.length
        if vowels.include?(str[i]) && current_vowel.empty?
            str.reverse.each_char do |char2|
                if vowels.include?(char2)
                    current_vowel = str[i]
                    new_str += char2
                    i += 1
                    break
                end
            end
        elsif vowels.include?(str[i]) && !current_vowel.empty?
            new_str += current_vowel
            current_vowel = str[i]
            i += 1
        else
            new_str += str[i]
            i += 1
        end

    end

    new_str


end

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"


class String

    def select(&prc)
        new_str = ""

        self.each_char do |char|
            return new_str if !prc
            new_str += char if prc.call(char)
        end 

        new_str
    end

# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

    def map!(&prc)

        self.each_char.with_index do |char, i|
            self[i] = prc.call(char, i)
        end

        self

    end

# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"
    
end


# Stopped here, need to do recursion problems:

# Write a method multiply(a, b) that takes in two numbers and returns their product.

# You must solve this recursively (no loops!)
# You must not use the multiplication (*) operator

# # Examples
# multiply(3, 5)        # => 15
# multiply(5, 3)        # => 15
# multiply(2, 4)        # => 8
# multiply(0, 10)       # => 0
# multiply(-3, -6)      # => 18
# multiply(3, -6)       # => -18
# multiply(-3, 6)       # => -18


# The Lucas Sequence is a sequence of numbers. The first number of the sequence is 2. The second number of the Lucas Sequence is 1. To generate the next number of the sequence, we add up the previous two numbers. For example, the first six numbers of the sequence are: 2, 1, 3, 4, 7, 11, ...

# Write a method lucasSequence that accepts a number representing a length as an arg. The method should return an array containing the Lucas Sequence up to the given length. Solve this recursively.

# # Examples
# lucas_sequence(0)   # => []
# lucas_sequence(1)   # => [2]    
# lucas_sequence(2)   # => [2, 1]
# lucas_sequence(3)   # => [2, 1, 3]
# lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]


# The Fundamental Theorem of Arithmetic states that every positive integer is either a prime or can be represented as a product of prime numbers.

# Write a method prime_factorization(num) that accepts a number and returns an array representing the prime factorization of the given number. This means that the array should contain only prime numbers that multiply together to the given num. The array returned should contain numbers in ascending order. Do this recursively.

# # Examples
# prime_factorization(12)     # => [2, 2, 3]
# prime_factorization(24)     # => [2, 2, 2, 3]
# prime_factorization(25)     # => [5, 5]
# prime_factorization(60)     # => [2, 2, 3, 5]
# prime_factorization(7)      # => [7]
# prime_factorization(11)     # => [11]
# prime_factorization(2017)   # => [2017]