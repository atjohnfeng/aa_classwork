require "byebug"

def strange_sums(arr)

    count = 0

    arr.each_with_index do |num1, i1|
        arr.each_with_index do |num2, i2|
            count += 1 if i1 < i2 && num1 + num2 == 0
        end
    end

    count

end

p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0

def pair_product(arr, product)

    arr.each_with_index do |num1, i1|
        arr.each_with_index do |num2, i2|
            return true if i1 < i2 && num1 * num2 == product
        end
    end

    false

end

p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false

def rampant_repeats(str, hash)

    repeated = ""

    str.each_char do |char|
        if hash.has_key?(char)
             hash[char].times do
                repeated += char
             end
        else
            repeated += char
        end
    end

    repeated

end

p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square(num)

    (1..num).each { |i| return true if i*i==num }

    false

end

p perfect_square(1)     # true
p perfect_square(4)     # true
p perfect_square(64)    # true
p perfect_square(100)   # true
p perfect_square(169)   # true
p perfect_square(2)     # false
p perfect_square(40)    # false
p perfect_square(32)    # false
p perfect_square(50)    # false

def divisor(num)

    (1..num).select { |i| num % i == 0 }

end

def anti_prime?(num)

    count = divisor(num).length

    (1...num).all? { |i| divisor(i).length < count }

end
p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false

def matrix_addition(arr1, arr2)

    matrix = Array.new(arr1.length) { [0] * 2 }

    (0...arr1.length).each do |apple|
        (0..1).each do |seed|
            matrix[apple][seed] = arr1[apple][seed] + arr2[apple][seed]
        end
    end

    matrix

end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*num)

    num.map { |i| divisor(i) }.inject(:&)

end

p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]

def tribonacci_number(num)

    tribonacci_sequence = [1, 1, 2]
    num.times do
        tribonacci_sequence << tribonacci_sequence[-3]+tribonacci_sequence[-2]+tribonacci_sequence[-1]
    end

    tribonacci_sequence[num-1]

end

p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274

def matrix_addition_reloaded(*arr)

    matrix = arr.first
    height = matrix.length
    width = matrix[0].length

    newMatrix = Array.new(height) { [0] * width }
    arr.inject(newMatrix) do |m1, m2|
        return nil if m2.length != height || m2[0].length != width
        matrix_addition(m1, m2)
    end
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(square)

    # height = square.length
    # width = square[0].length

    # rowcheck = Hash.new(0)
    # columncheck = Hash.new(0)

    # square.each do |array|
    #     i = 0
    #     while i < width
    #         key = array[i]
    #         rowcheck[key] += 1
    #         i += 1
    #     end
    #     return true if rowcheck.has_value?(width)
    #     rowcheck = Hash.new(0)
    # end

    square.each { |array| return true if array.uniq.length == 1 }
    square.transpose.each { |array| return true if array.uniq.length == 1 }
    false

end

p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false

def squaragonal?(square)

    square.each { |array| return true if array.uniq.length == 1 }
    square.transpose.each { |array| return true if array.uniq.length == 1 }

    height = square.length
    width = square[0].length

    firstDiagonal = Hash.new(0)
    x = 0
    y = 0
    while x < height
        firstDiagonal[square[x][y]] += 1
        x += 1
        y += 1
    end
    return true if firstDiagonal.has_value?(height)

    secondDiagonal = Hash.new(0)
    x = 0
    y = -1
    while x < height
        secondDiagonal[square[x][y]] += 1
        x += 1
        y -= 1
    end
    return true if secondDiagonal.has_value?(height)

    false

end

p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false

def pascals_triangle(num)

    triangle = [[1]]
    
    while triangle.length < num
        lastlevel = triangle[-1]
        nextlevel = []
        nextlevel += sums(lastlevel)
        nextlevel << 1
        triangle << nextlevel
    end

    triangle

end

def sums(layer)

    sums = [1]
    (0...layer.length-1).each do |i|
        sums << layer[i] + layer[i+1]
    end
    sums

end

p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]

def isitprime?(num)

    return false if num < 2
    (2...num).each do |i|
       return false if num % i == 0
    end
    true

end

def mersenne_prime(n)
# debugger
    mersenne = []
    i = 1
    while mersenne.length < n
        poweroftwo = 2 ** i - 1
        mersenne << poweroftwo if isitprime?(poweroftwo)
        i+=1
    end

    mersenne[-1]

end

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071

def word_score(word)

    score = 0
    alphabet="abcdefghijklmnopqrstuvwxyz"
    word.each_char { |char| score+=alphabet.index(char.downcase)+1 }   
    score 

end

def triangular_word?(word)

    (1..word_score(word)).each do |i|

       return true if ((i * (i+1)) / 2) == word_score(word)

    end

    false

end

p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false

def consecutive_collapse(arr)

    length = arr.length
    length.times do 
        (0...arr.length).each do |i|
            if arr[i+1] != nil && arr[i-1]!= nil
                if !(arr[i] != arr[i+1]+1 && arr[i] != arr[i+1]-1) || !(arr[i] != arr[i-1]+1 && arr[i] != arr[i-1]-1)
                    arr = arr[0...i] + arr[i+2..-1]
                end
            end
        end
    end

    arr

    # fails three cases

end

p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []

def prime?(num)
    return false if num < 2
    (2...num).each { |i| return false if num % i == 0 }
end

def prime_replacement(num, n)

    # if n < 0 && n.even?
    # elsif n < 0 && n.odd?
    # elsif n > 0 && n.even?
    # elsif n > 0 && n.odd?
    # end

end

def pretentious_primes(arr, n)

    pretentious = arr.map { |num| prime_replacement(num, n)}
    return pretentious

end

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]