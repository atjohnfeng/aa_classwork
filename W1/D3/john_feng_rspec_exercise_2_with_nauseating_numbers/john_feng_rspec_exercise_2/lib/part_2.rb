def palindrome?(str)

    str.each_char.with_index do |c,i|
        if str[i] != str[i * -1 - 1]
            return false
        end
    end
    
    true

end

def substrings(string)

    substrings = []
    
    (0...string.length).each do |start|
        (start...string.length).each do |en|
            substrings << string[start..en]
        end
    end

    substrings

end

def palindrome_substrings(string)

    substrings = substrings(string)

    substrings.select { |str| palindrome?(str) && str.length > 1 }

end