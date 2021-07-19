def no_dupes?(arr)

    count = Hash.new(0)
    arr.each do |ele|
        count[ele] += 1
    end

    nodupes = []
    count.each do |k,v|
        nodupes << k if v == 1
    end
    nodupes
        
end

p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)

    (0...arr.length-1).each do |i|
        if arr[i] == arr[i+1]
            return false
        end
    end

    true

end

p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)

    count = Hash.new { |count,k| count[k] = [] }

    str.each_char.with_index do |c,i|
        count[c] << i
    end

    count

end

p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)

    count = 1
    streaks = {}

    (0...str.length).each do |i|
        if str[i] == str[i+1]
            count += 1
        else
            streaks[str[i]] = count
            count = 1
        end
    end

    sorted = streaks.sort_by { |k, v| v }
    sorted.last[0] * sorted.last[1]

end

p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'

def prime?(num)

    return false if num < 2
    (2...num).each do |i|
        return false if num % i == 0
    end

    return true

end

def bi_prime?(num)

    multiples = []

    (2...num).each do |num1|
        (2...num).each do |num2|
            multiples << [num1, num2] if num1 * num2 == num
        end
    end

    multiples.each do |pair|
        return true if prime?(pair[0]) && prime?(pair[1])
    end

    false

end

p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false

def vigenere_cipher(str, arr)

    alphabet = ('a'..'z').to_a
    str.each_char.with_index do |c,i|
        idx = alphabet.index(c)
        idx2 = arr[0]
        shift = (idx + idx2) % 26
        str[i] = alphabet[shift]
        arr.rotate!(1)
    end
        
    str

end

p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)

    vowels = "aeiou"
    vowel = []

    str.each_char do |c|
        if vowels.include?(c)
            vowel << c
        end
    end

    str.each_char.with_index do |c,i|
        str[i] = vowel.rotate![-2] if vowels.include?(c)
    end

    str

end

p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"

class String

    def select(&prc)
        prc ||= Proc.new { |ch| ch == "" }

        new_string = ""
        self.each_char.with_index do |c,i|
            if c == " "
                new_string += c
            elsif prc.call(c)
                new_string += c
            end
        end
        new_string
    end

    def map!(&prc)
        self.each_char.with_index do |c,i|
            self[i] = prc.call(c, i)
        end
        self
    end

end

p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""

word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"

def multiply(a,b)

    return 0 if b == 0 || a == 0
    return a if b == 1
    return a if b == -1

    if b > 0
        sum = a + multiply(a, b-1)
    elsif a < 0 && b < 0
        multiply(-a, -b)
    elsif a > 0 && b < 0
        sum = a + multiply(b-1, a)
    end

end

p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18

def lucas_sequence(n)
    
    return [] if n == 0
    return [*lucas_sequence(n-1), lucas_number(n-1)]

end

def lucas_number(n)

    return 2 if n == 0
    return 1 if n == 1

    lucas_number(n-2) + lucas_number(n-1)

end

p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)

    return [num] if prime?(num)

    (2...num).each do |divisor|
        if num % divisor == 0
            next_factor = num / divisor
            return [divisor, *prime_factorization(next_factor)]
        end
    end

end

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]