def hipsterfy(word)

    vowels = "aeiouAEIOU"
    hipword = ""
    word.reverse.each_char.with_index do |char,i|
        if !vowels.include?(char)
            hipword += char
        else
            hipword += word.reverse[i+1..-1]
            return hipword.reverse
        end
    end
    
    hipword.reverse

end

def vowel_counts(string)

    vowelsStr = "aeoiu"
    vowels = Hash.new(0)
    string.downcase.each_char do |char|
        if vowelsStr.include?(char)
            vowels[char] += 1
        end
    end

    vowels

end

def caesar_cipher(str, n)

    alphabet = "abcdefghijklmnopqrstuvwxyz"
    cipher = ""

    str.each_char do |char|
        if alphabet.include?(char)
            alpha = alphabet.index(char)
            beta = alpha + n
            newchar = alphabet[beta % 26]
            cipher += newchar
        else
            cipher += char
        end
    end

    cipher

end