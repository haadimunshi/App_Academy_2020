def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(sent, &prc)
    new_sent = []

    sent.split.each do |word|
        new_sent << prc.call(word)
    end

    new_sent.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    if prc1.call(num) > prc2.call(num)
        return prc1.call(num)
    else
        return prc2.call(num)
    end
end

def and_selector(arr, prc1, prc2)
    new_arr = []

    arr.each do |ele|
        new_arr << ele if prc1.call(ele) && prc2.call(ele)
    end

    new_arr
end

def alternating_mapper(arr, prc1, prc2)
    new_arr = []

    arr.each do |num|
        if arr.index(num).even?
            new_arr << prc1.call(num)
        else
            new_arr << prc2.call(num)
        end
    end

    new_arr

end