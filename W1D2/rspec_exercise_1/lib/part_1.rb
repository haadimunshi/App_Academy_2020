def average (num1, num2)
    return (num1 + num2) / 2.0
end

def average_array(arr)
    return arr.sum / (arr.length * 1.0)
end

def repeat(str, num)
new_str = ""

    num.times do
        new_str += str
    end

    new_str
end

def yell(str)
    new_str = ""

    str.each_char do |char|
        new_str += char.upcase
    end

    return new_str + "!"
end

def alternating_case(sent)
    new_sent = []

    sent.split.each.with_index do |word, i|
        if i.even?
            new_sent << word.upcase
        else
            new_sent << word.downcase
        end
    end

    new_sent.join(" ")
end