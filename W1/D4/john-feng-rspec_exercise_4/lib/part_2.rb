def proper_factors(num)

    (1...num).select { |i| num % i == 0 }

end

def aliquot_sum(num)

    proper_factors(num).sum

end

def perfect_number?(num)

    return true if aliquot_sum(num) == num
    false

end

def ideal_numbers(n)

    ideals = []
    i = 6
    while ideals.length < n
        ideals << i if perfect_number?(i)
        i += 1
    end

    ideals

end