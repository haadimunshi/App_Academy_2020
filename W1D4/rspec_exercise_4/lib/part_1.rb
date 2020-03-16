def my_reject(arr, &prc)
    arr.select { |ele| !prc.call(ele) }
end

def my_one?(arr, &prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele) }
    return true if count == 1
    false
end

def hash_select(hash, &prc)
    new_hash = {}

    hash.each do |k, v|
        new_hash[k] = v if prc.call(k, v)
    end
    
    new_hash
end

def xor_select(arr, prc1, prc2)
    new_arr = []

    arr.each do |ele|
        if (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele))
            new_arr << ele
        end
    end

    new_arr
end

def proc_count(val, arr)
    count = 0

    arr.each do |prc|
        count += 1 if prc.call(val)
    end

    count

end