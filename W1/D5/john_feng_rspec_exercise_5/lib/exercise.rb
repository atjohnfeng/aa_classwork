require "byebug"

def zip(*arr)

    arrays = [*arr]

    zipped = Array.new(arrays[0].length) { Array.new([]) }

    arrays.each do |subarray|
        subarray.each_with_index { |ele, i| zipped[i] << ele }
    end

    zipped

end

def prizz_proc(arr, prc1, prc2)

    justOne = []
    arr.each do |ele|
        justOne << ele if (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele))
    end
    justOne            

end

def zany_zip(*arr)
# debugger
    
    arraylengths = arr.map(&:length)
    maxarraylength = arraylengths.max

    (0...maxarraylength).map do |i|
        arr.map { |sub| sub[i] }
    end

end

def maximum(arr, &prc)

    return nil if arr.length == 0
    passed = arr.map { |ele| prc.call(ele) }
    i = passed.reverse.index(passed.max)
    return arr.reverse[i]

end

def my_group_by(arr, &prc)

    grouped = {}
    results = []

    arr.each do |ele|
        results << prc.call(ele)
    end

    results.each do |result|
        grouped[result] = []
    end

    results.each_with_index do |r, i|
        grouped[r] << arr[i]
    end

    grouped

end

def tie_break(max, ele, prc1)

    if prc1.call(ele) > prc1.call(max)
        ele
    else
        max
    end

end

def max_tie_breaker(arr, prc1, &prc2)

    return nil if arr.length == 0
    max = arr[0]
    arr.each do |ele|
        if prc2.call(ele) > prc2.call(max)
            max = ele
        elsif prc2.call(ele) == prc2.call(max)
            max = tie_break(max, ele, prc1)
        end
    end

    max

end

def vowel_count(word)

    word.each_char.count { |c| "aeiouAEIOU".include?(c) }

end

def sillytranslate(word)

    newword = ""
    word.each_char.with_index do |c,i|
        if "aeiouAEIOU".include?(c)
            newword += word[i..-1]
            break
        end
    end

    newword.reverse.each_char.with_index do |c,i|
        if "aeiouAEIOU".include?(c)
            newword = newword.reverse[i..-1].reverse
            break
        end
    end

    newword

end

def silly_syllables(str)

    silly = []
    words = str.split(" ")
    words.each do |word| 
        if vowel_count(word) < 2
            silly << word
        else
            silly << sillytranslate(word)
        end
    end

    silly.join(" ")

end