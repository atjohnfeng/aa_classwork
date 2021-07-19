require 'byebug'

def my_map!(arr, &prc)

    arr.each_with_index { |ele,i| arr[i] = prc.call(ele) }

end

def two?(arr, &prc)

    arr.select.count { |ele| prc.call(ele) } == 2

end

def nor_select(arr, prc1, prc2)

    arr.select { |ele| !prc1.call(ele) && !prc2.call(ele) }

end

def array_of_hash_sum(arr)

    sum = 0
    arr.each do |hash|
        hash.each do |k,v|
            sum += v
        end
    end
    sum

end

def slangtranslate(word)

    word.each_char.with_index do |c,i|
        if "aeiou".include?(c)
            return word[0...i] + word[i+1..-1]
        end
    end
    word

end

def slangify(str)

    words = str.split
    words.map! { |word| slangtranslate(word) }
    words.join(" ")

end

def char_counter(str, *char)

    chars = [*char]
    char_count = Hash.new(0)

    if chars.length == 0
        str.each_char { |c| char_count[c] += 1}
        return char_count
    end

    chars.each { |c| char_count[c] = 0 }
    str.each_char do |c|
        if char_count.has_key?(c)
            char_count[c] += 1
        end
    end

    char_count

end