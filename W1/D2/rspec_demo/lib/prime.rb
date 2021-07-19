def prime?(num)

if num == 1
    return false
end

    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end

    true

end