def partition(arr, num)

    twoD = [[], []]

    arr.each do |i|
        if i < num
            twoD[0] << i
        else
            twoD[1] << i
        end
    end

    twoD

end

def merge(h1, h2)

    merged = {}

    h1.each do |k,v|
        h2.each do |x,y|
            if h2.has_key?(k)
                merged[x] = y
            else
                merged[k] = v
                merged[x] = y
            end
        end
    end

merged

end

def censor(sentence, curse)

    words = sentence.split(" ")
    censored = []

    words.each do |word|
        if curse.include?(word.downcase)
            censored << censorWord(word)
        else
            censored << word
        end
    end

    censored.join(" ")
end

def censorWord(word)

    censored = ""

    word.each_char do |char|
        if "aeiouAEIOU".include?(char)
            censored += '*'
        else
            censored += char
        end
    end

    censored

end

def power_of_two?(num)

    powers_of_two = [1]

    num.times do
        powers_of_two << powers_of_two[-1]*2
    end

    if powers_of_two.include?(num)
        true
    else
        false
    end

end