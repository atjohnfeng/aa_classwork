def reverser(str, &prc)

    prc.call(str.reverse)

end

def word_changer(str, &prc)

    words = str.split(" ")
    words.map! { |word| prc.call(word) }
    words.join(" ")

end

def greater_proc_value(str, prc1, prc2)

    if prc1.call(str) > prc2.call(str)
        return prc1.call(str)
    else
        return prc2.call(str)
    end

end

def and_selector(arr, prc1, prc2)

    selected = []

    arr.each do |ele|
        if prc1.call(ele) == true && prc2.call(ele) == true
            selected << ele
        end
    end

    selected
    
end

def alternating_mapper(arr, prc1, prc2)

    mapped = []

    arr.each_with_index do |ele|

        if arr.index(ele).even?
            mapped << prc1.call(ele)
        else
            mapped << prc2.call(ele)
        end
    end

    mapped

end