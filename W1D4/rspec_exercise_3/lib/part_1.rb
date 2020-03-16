def prime_range(min, max)
    primes = []

    (min..max).each do |num|
        primes << num if is_prime?(num)
    end

    primes

end

def nth_prime(n)
    primes = []

    i = 0
    while primes.length < n
        primes << i if is_prime?(i)

        i += 1
    end

    primes.last

end

def is_prime?(num)
    return false if num < 2

    (2...num).each do |div|
        return false if num % div == 0
    end

    return true
end


