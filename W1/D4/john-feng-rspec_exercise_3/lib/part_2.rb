def element_count(arr)

    count = Hash.new(0)

    arr.each { |ele| count[ele]+= 1}

    count

end

def char_replace!(str, hash)

    str.each_char.with_index do |c,i|
        if hash.has_key?(c)
            str[i] = hash[c]
        end
    end
    
    str

end

def product_inject(arr)

    arr.inject { |i, x| i*x }

end