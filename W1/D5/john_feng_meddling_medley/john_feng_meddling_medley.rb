require "byebug"

def duos(str)

    str.each_char.with_index.count { |c,i| c == str[i+1] }

end

p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0

def sentence_swap(str, hash)

    words = str.split(" ")
    words.each_with_index do |word,i|
        if hash.has_key?(word)
            words[i] = hash[word]
        end
    end
    words.join(" ")

end

p sentence_swap('anything you can do I can do',
    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
    'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'

def hash_mapped(hash, prc1, &prc2)

    mappedHash = {}

    hash.each do |k,v|
        newKey = prc2.call(k)
        newValue = prc1.call(v)
        mappedHash[newKey] = newValue
    end

    mappedHash

end

double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}

def counted_characters(str)

    multiple = []
    scores = Hash.new(0)

    str.each_char { |c| scores[c] += 1 }
    scores.select! do |k, v|
        v > 2
    end

    scores.each { |k,v| multiple << k }
    
    multiple

end

p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []

def triplet_true(str)

    count = 1
    str.each_char.with_index do |c,i|
        if count == 3
            return true
        elsif c == str[i+1]
            count += 1
        else
            count = 1
        end
    end
    false

end

p triplet_true('caaabb')        # true
p triplet_true('terrrrrible')   # true
p triplet_true('runninggg')     # true
p triplet_true('bootcamp')      # false
p triplet_true('e')             # false

def encode(word, hash)

    word.each_char.with_index do |c,i|
        if hash.has_key?(c)
            word[i] = hash[c]
        else
            word[i] = '?'
        end
    end

    word

end

def energetic_encoding(str, hash)

    words = str.split(" ")
    words.each do |word|
        word = encode(word, hash)
    end
    words.join(" ")

end

p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'

def uncompress(str)

    uncompressed = ""
    str.each_char.with_index do |c, i|
        if "abcdefghijklmnopqrstuvwxyz".include?(c.downcase)
            uncompressed += c
        else
            (c.to_i - 1).times do
                uncompressed += str[i-1]
            end
        end
    end
    uncompressed

end

p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(arr, *prc)

    conjunct = []
    length = prc.length

    arr.each do |ele|
        count = 0
        (0...length).each do |i|
            count+=1 if prc[i].call(ele)
        end
        conjunct << ele if count == length
    end

    conjunct

end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def pig_word(word)

    return word if word.length < 3
    return word + "yay" if "aeiouAEIOU".include?(word[0])
    
    word.each_char.with_index do |c,i|
        if "aeiouAEIOU".include?(c) && word != word.capitalize
            return word[i..-1] + word[0...i] + "ay"
        elsif "aeiouAEIOU".include?(c)
            newword = word[i..-1].downcase + word[0...i].downcase + "ay"
            return newword.capitalize
        end
    end
        
end

def convert_pig_latin(str)

    piggy = str.split(" ").map { |word| pig_word(word) }
    piggy.join(" ")

end

p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverb(word)

    return word if word.length < 3
    if "aeiouAEIOU".include?(word[-1]) && word == word.capitalize
        newword = word+word
        return newword.capitalize
    elsif "aeiouAEIOU".include?(word[-1])
        return word+word
    end
    lastIndex = word.rindex(/[aeiouAEIOU]/)
    return word + word[lastIndex..-1]

end

def reverberate(str)

    words = str.split(" ").map { |word| reverb(word) }
    words.join (" ")

end

p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(arr, *prc)

    selected = []
    length = prc.length

    arr.each do |ele|
        (0...length).each do |i|
            selected << ele if prc[i].call(ele)
        end
    end

    selected

end

longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
) # ["apple", "teeming"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o
) # ["dog", "apple", "teeming", "boot"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o,
    starts_a
) # ["ace", "dog", "apple", "teeming", "boot"]

def wordtranslate(word, i)

    vowels = "aeiouAEIOU"

    if i % 2 == 0
        word.each_char.with_index { |c,i| return word[0...i]+word[i+1..-1] if vowels.include?(c) }
    else
        word.reverse.each_char.with_index { |c,i| return (word.reverse[0...i]+word.reverse[i+1..-1]).reverse if vowels.include?(c) }
    end

end

def alternating_vowel(str)

    words = str.split(" ")
    alternatingwords = []
    words.each_with_index do |word,i|
        if word.rindex(/[aeiou]/) == nil
            alternatingwords << word 
        else
            alternatingwords << wordtranslate(word, i)
        end
    end
    alternatingwords.join(" ")

end

p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def sillytranslate(word)

    lastletter = word[-1]
    return word + lastletter if "aeiouAEIOU".include?(lastletter)
    sillyword = ""
    word.each_char.with_index do |c, i|
        if !"aeiouAEIOU".include?(c) 
            sillyword += c
        else
            sillyword += c + 'b' + c
        end
    end

    if sillyword[0] == sillyword[0].upcase
        return sillyword.capitalize
    else
        return sillyword
    end

end

def silly_talk(str)

    sillytalk = []
    words = str.split(" ")
    words.each do |word|
        sillytalk << sillytranslate(word)
    end
    sillytalk.join(" ")

end

p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(str)

    counts = []
    counter = 1
    
    str.each_char.with_index do |c,i|
        if c == str[i+1]
            counter+=1
        elsif c != str[i+1]
            if counter > 1
                counts << [c,counter]
                counter = 1
            else
                counts << c
            end
        end
    end

    counts.join

end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"