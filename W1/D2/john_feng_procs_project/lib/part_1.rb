def my_map(arr, &prc)

    map = []

    arr.each { |ele| map << prc.call(ele) }

    map
    
end

def my_select(arr, &prc)

    selected = []

    arr.each do |ele|
        if prc.call(ele) == true
            selected << ele
        end
    end

    selected

end

def my_count(arr, &prc)

    count = 0

    arr.each do |ele|
        if prc.call(ele) == true
            count += 1
        end
    end

    count

end

def my_any?(arr, &prc)

    arr.each { |ele| return true if prc.call(ele) == true }
    false

end

def my_all?(arr, &prc)

    arr.each { |ele| return false if prc.call(ele) == false }
    true

end

def my_none?(arr, &prc)

    arr.each { |ele| return false if prc.call(ele) == true }
    true

end