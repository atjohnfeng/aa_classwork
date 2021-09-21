def palindrome_int(num)

	num.to_s == num.to_s.reverse

end

p palindrome_int(123)
p palindrome_int(12321)
p palindrome_int(111)
p palindrome_int(235)

def common_prefix(array)

    prefixes = Hash.new(0)
    (0...array[0].length).each do |i|
        prefixes[array[0][0..i]] += 1
    end
    
    prefixes.keys.each do |key|
        (1...array.length).each do |i|
            hash[key] += 1 if array[i].include?(key)
        end
    end
       
    return_value = ""

    hash.each do |k, v|
        if v == array.length
            return_value = k
        else 
            return return_value
        end
    end

end

p common_prefix(["flower","flow","flight"])
p common_prefix(["dog","racecar","car"])