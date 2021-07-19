require "byebug"

def is_prime?(num)

    return false if num < 2

    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end

    true

end

def nth_prime(num)

    primes = []

    i = 2
    while primes.length < num
        primes << i if is_prime?(i)
        i += 1
    end

    primes[-1]

end

def prime_range(min, max)

    range = []

    (min..max).each { |num| range << num if is_prime?(num) }

    range

end