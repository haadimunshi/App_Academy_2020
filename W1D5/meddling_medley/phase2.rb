def conjunct_select(arr, *prcs)
    new_arr = []

    arr.each do |ele|
        prcs.each_with_index do |prc, i|
            break if !prc.call(ele)
            next if prc.call(ele) && i < prcs.length - 1
            new_arr << ele if prc.call(ele) && i == prcs.length - 1
        end
    end

    new_arr

end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]


def convert_pig_latin(sent)
    vowels = "aeiou"
    new_sent = []

    sent.split.each do |word|
        if word.length < 3
            new_sent << word
            next
        else
            word.each_char.with_index do |char, i|
                if vowels.include?(char) && i == 0
                    new_sent << word + "yay"
                    break
                elsif !vowels.include?(char) && i == 0
                    next
                elsif vowels.include?(char) && i != 0
                    new_sent << word[i..-1] + word[0...i] + "ay"
                    break
                end
            end
        end
    end

    sent.split.each.with_index do |word, i|
        new_sent.each.with_index do |new_word, j|
            if i == j && word[0] == word[0].upcase
                new_word[0] = new_word[0].upcase
                new_word[1..-1] = new_word[1..-1].downcase
            end
        end
    end


    new_sent.join(" ")


end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"


def reverberate(sent)
    vowels = "aeiou"
    new_sent = []

    sent.split.each do |word|
        if word.length < 3
            new_sent << word
            next
        elsif vowels.include?(word[-1])
            new_sent << word + word
        else
            i = word.length - 2
            while i >= 0
                if vowels.include?(word[i])
                    new_sent << word + word[i..-1]
                    break
                end
            i -= 1
            end
        end
    end

    sent.split.each.with_index do |word, i|
        new_sent.each.with_index do |new_word, j|
            if i == j && word[0] == word[0].upcase
                new_word[0] = new_word[0].upcase
                new_word[1..-1] = new_word[1..-1].downcase
            end
        end
    end


    new_sent.join(" ")



end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"


def disjunct_select(arr, *prcs)
    new_arr = []

    arr.each do |ele|
        prcs.each do |prc|
            if prc.call(ele)
                new_arr << ele
                break
            end
        end
    end

    new_arr

end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]


def alternating_vowel(sent)
    new_sent = []
    vowels = "aeiou"

    sent.split.each.with_index do |word, i|
        new_sent << word if word.length < 3
        if i.even?
            word.each_char.with_index do |char, j|
                if vowels.include?(char)
                    new_sent << word[0...j] + word[(j+1)..-1]
                    break
                end
            end
        else
            word.reverse.each_char.with_index do |char, j|
                if vowels.include?(char)
                    new_sent << (word.reverse[0...j] + word.reverse[(j+1)..-1]).reverse
                    break
                end
            end
        end
    end

    new_sent.join(" ")

end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"


def silly_talk(sent)
    new_sent = []
    vowels = "aeiou"

    sent.split.each do |word|
        if vowels.include?(word[-1])
            new_sent << word + word[-1]
        else
            new_sent << sillify(word)
        end
    end

    new_sent.join(" ")
end

def sillify(word)
    vowels = "aeiou"
    new_word = ""

    word.each_char do |char|
        if !vowels.include?(char)
            new_word += char
        else
            new_word += char + "b" + char
        end
    end

    new_word

end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"


def compress(str)
    new_str = ""
    count = 0

    i = 0
    while i < str.length
        if str[i] == str[i+1] && count == 0
            count += 2
        elsif str[i] == str[i+1] && count > 1
            count += 1
        else
            if count == 0
                new_str += str[i]
            else
                new_str += str[i] + count.to_s
                count = 0
            end
        end

        i += 1
    end

    new_str


end

# p compress('aabbbbc')   # "a2b4c"
# p compress('boot')      # "bo2t"
# p compress('xxxyxxzzzz')# "x3yx2z4"