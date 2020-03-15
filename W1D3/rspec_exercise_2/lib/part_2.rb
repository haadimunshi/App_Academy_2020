def palindrome_substrings(str)
    substrings(str).select { |sub| sub.length > 1 && palindrome?(sub) }
end

def substrings(str)
    subs = []

    str.each_char.with_index do |char, i|
        subs << str[i]
        j = i + 1
        while j < str.length
            subs << str[i..j]
            j += 1
        end
    end

    subs
end

def palindrome?(str)
    reversed = ""

    i = str.length - 1

    while i >= 0
        reversed += str[i]
        i -= 1
    end

    return true if str == reversed
    false
end