# Define your methods here. 

def first_letter_vowel_count(str)

    vowel_count = 0
    vowels = "aeiou"
    words = str.split(" ")
    words.each do |word| 
        first_letter = word[0].downcase
        vowel_count += 1 if vowels.include?(first_letter)
    end
    vowel_count

end

def count_true(arr, prc)

    count = 0
    arr.each { |ele| count+=1 if prc.call(ele) }
    count

end

def procformation(arr, prc1, prc2, prc3)

    arr.map do |ele|
        if prc1.call(ele)
            prc2.call(ele)
        else
            prc3.call(ele)
        end
    end

end

def array_of_array_sum(arr)

    arr.flatten.sum

end

def selective_reverse(str)

    words = str.split(" ")
    selected_reverse = []
    words.each do |word|
        firstletter = word[0]
        lastletter = word[-1]
        if !"aeiouAEIOU".include?(firstletter) && !"aeiouAEIOU".include?(lastletter)
            selected_reverse << word.reverse
        else
            selected_reverse << word
        end
    end
    selected_reverse.join(" ")

end

def hash_missing_keys(hash, *arg)

    missing_keys = []
    arg.each { |ele| missing_keys << ele if !hash.has_key?(ele) }
    missing_keys

end