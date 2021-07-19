# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)

compressed = ""

num = 1

str.each_char.with_index do |char, i|
    if char == str[i+1]
        num += 1
    elsif num != 1
        compressed += num.to_s
        compressed += char
        num = 1
    else
        compressed += char
    end
end

compressed

end


p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
