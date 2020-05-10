def duos(str)
    count = 0

    i = 0
    while i < str.length - 1
        count += 1 if str[i+1] == str[i]
    i += 1
    end

    count

end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0


def sentence_swap(sent, hash)
    new_sent = []
    
    sent.split.each do |word|
        if hash.keys.include?(word)
            new_sent << hash[word]
        else
            new_sent << word
        end
    end

    new_sent.join(" ")

end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'


def hash_mapped(hash, prc1, &prc2)
    new_hash = {}

    hash.each do |k, v|
        new_key = prc2.call(k)
        new_val = prc1.call(v)
        new_hash[new_key] = new_val
    end

    new_hash

end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}


def counted_characters(str)
    more_than_twice = []
    char_count = Hash.new(0)

    words = str.split("")
    words.each do |word|
        word.each_char do |char|
            char_count[char] += 1
        end
    end

    char_count.each do |k, v|
        more_than_twice << k if v > 2
    end

    more_than_twice 
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []


def triplet_true?(str)
    count = 0

    i = 0
    while i < str.length - 1
        count += 1 if str[i+1] == str[i]
        return true if count == 3

    i += 1
    end

    count = 0
    false

end

# p triplet_true?('caaabb')        # true
# p triplet_true?('terrrrrible')   # true
# p triplet_true?('runninggg')     # true
# p triplet_true?('bootcamp')      # false
# p triplet_true?('e')             # false


def energetic_encoding(str, hash)
    new_str = ""

    str.each_char do |char|
        if hash.keys.include?(char)
            new_str += hash[char]
        elsif char == " "
            new_str += " "
        else
            new_str += "?"
        end
    end

    new_str

end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'


def uncompress(str)
    new_str = ""

    str.each_char.with_index do |char, i|
        if !i.even?
            str[i].to_i.times do
                new_str += str[i-1]
            end
        end
    end

    new_str
end

p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'