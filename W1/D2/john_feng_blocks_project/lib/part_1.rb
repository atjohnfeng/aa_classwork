def select_even_nums(arr)

    arr.select(&:even?)

end

def reject_puppies(dogs)

    dogs.reject { |dog| dog["age"] <= 2 }

end

def count_positive_subarrays(arr)

    arr.count { |sub| sub.sum >= 1 }

end

def aba_translate(word)

    newword = ""
    word.each_char do |c|
        if "aeiouAEIOU".include?(c)
            newword += c + "b" + c
        else
            newword += c
        end
    end

    newword

end

def aba_array(arr)

    arr.map { |word| aba_translate(word) }

end