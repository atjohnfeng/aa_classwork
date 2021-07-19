def average(num1, num2)

    (num1+num2)/2.0

end

def average_array(arr)

    arr.sum/arr.length.to_f

end

def repeat(str, num)

    str * num

end

def yell(str)

    str.upcase + "!"

end

def alternating_case(str)

    alternating = ""
    words = str.split(" ")
    words.each_with_index do |word,i|
        if (i % 2 == 1 || i == 1) && (i != words.length - 1)
            alternating += word.downcase + " "
        elsif i == words.length - 1
            if i % 2 == 1 || i == 1
                alternating += word.downcase
            else
                alternating += word.upcase
            end
        else 
            alternating += word.upcase + " "
        end
    end

    alternating

end