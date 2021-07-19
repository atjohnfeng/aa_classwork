def zip(*arrays)
    length = arrays.first.length

    (0...length).map do |i|
        arrays.map { |array| array[i] }
    end
end

def prizz_proc(array, prc_1, prc_2)
    array.select do |el|
        (prc_1.call(el) && !prc_2.call(el)) || (!prc_1.call(el) && prc_2.call(el))
    end
end

def zany_zip(*arrays)
    length = arrays.map(&:length).max

    (0...length).map do |i|
        arrays.map { |array| array[i] }
    end
end

def maximum(array, &prc)
    return nil if array.empty?
    max = array.first
    array.each do |el|
        max = el if prc.call(el) >= prc.call(max)
    end
    max
end

def my_group_by(array, &prc)
    groups = Hash.new { |h, k| h[k] = [] }
    array.each do |el|
        key = prc.call(el)
        groups[key] << el
    end
    groups
end

def max_tie_breaker(array, tie_breaker, &prc)
    return nil if array.empty?
    max = array.first
    array.each do |el|
        result_el = prc.call(el)
        result_max = prc.call(max)
        if result_el > result_max
            max = el
        elsif result_el == result_max && tie_breaker.call(el) > tie_breaker.call(max)
            max = el
        end
    end
    max
end

def change_word(word)
    indices = vowel_indices(word)
    word[indices.first..indices.last]
end

def vowel_indices(word)
    vowels = 'aeiou'
    indices = []
    word.each_char.with_index do |char, i|
        indices << i if vowels.include?(char)
    end
    indices
end

def silly_syllables(sentence)
    words = sentence.split(' ')
    new_words = words.map do |word|
        num_vowels = vowel_indices(word).length
        if num_vowels < 2
            word
        else
            change_word(word)
        end
    end
    new_words.join(' ')
end
