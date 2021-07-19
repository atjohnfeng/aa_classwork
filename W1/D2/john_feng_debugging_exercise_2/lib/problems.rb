# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def prime(num)

    return false if num < 2

    (2...num).none? { |i| num % i == 0 }

end

def largest_prime_factor(num)
    
    primes = []
    (1..num).each do |i|
        if num % i == 0
            primes << i if prime(i)
        end
    end

    return primes.max

end

def unique_chars?(str)

    count = Hash.new(0)
    str.each_char { |c| count[c] += 1 }

    count.each_value do |val|
        if val > 1
            return false
        end
    end

    true

end

def dupe_indices(arr)

    index_Hash = Hash.new { |k,v| k[v] = [] }

    arr.each_with_index do |c,i|
        index_Hash[c] << i
    end

    index_Hash.select { |ele,ind| ind.length > 1 }

end

def ana_array(a1, a2) 

    count1 = Hash.new(0)
    count2 = Hash.new(0)

    a1.each { |ele| count1[ele] += 1 }

    a2.each { |ele| count2[ele] += 1 }

    return true if count1 == count2
    false

end