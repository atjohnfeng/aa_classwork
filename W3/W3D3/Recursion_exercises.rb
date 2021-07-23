require 'byebug'
#warmup
def range(start, final)
    result= []
    (start...final).each { |i| result<< i }
    result
end

def rec_range(start, final)
    return [] if final <= start
    [*rec_range(start, final-1), final-1]
end

# p rec_range(1, 5)

def exponentiation(base, power)
    return 1 if power == 0
    return base if power == 1
    base*exponentiation(base, power-1)
end

def exponentiation2(base, power)
    return 1 if power == 0
    return base if power == 1

    if power.even?
        exponentiation(exponentiation2(base, power/2), 2)
    else
        base * exponentiation((exponentiation2(base, (power-1)/2)), 2)
    end
end

# p exponentiation2(5, 1)
# p exponentiation2(2, 2)
# p exponentiation2(2, 5)
# p exponentiation2(3, 100)

def deep_dup(array)
    result=[]
    array.each {|el| el.is_a?(Array) ? result<< deep_dup(el) : result<< el.dup}
    result
end

# a= [[1, 2],[3, 4, 5]]
# b= deep_dup(a)
# b[1]<<100
# p a
# p b

def rec_fib(n)
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2

    fib = [*rec_fib(n-1)]
    fib << rec_fib(n-1)[-1] + rec_fib(n-2)[-1]
    fib
end

# p rec_fib(10)
# p rec_fib(5)
# p rec_fib(3)
# p rec_fib(0)

def fib(n)
    if n == 0
        result = []
    elsif n == 1
        result = [0]
    else
        result = [0, 1]
    end

    (2...n).each { |num| result << result[num-2] + result[num-1] }
    result

end

# p fib(10)
# p fib(5)
# p fib(3)
# p fib(0)

def bsearch(array, target)
    return nil if array.length== 0
    mididx= array.length/2
    left= array[0...mididx]
    right= array[mididx+1..-1]
    if target == array[mididx]
        return mididx
    elsif target < array[mididx]
        bsearch(left, target)
    elsif bsearch(right, target) != nil
        left.length + 1 + bsearch(right, target)
    end
end

# p bsearch((1..100).to_a, 100)
# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)
    return array if array.length <= 1
    mididx= array.length/2
    left= array[0...mididx]
    right= array[mididx..-1]
    
    merge(merge_sort(left), merge_sort(right))

end

def merge(arr1, arr2)
    result = []
    length = arr1.length + arr2.length
    while result.length < length
        if arr1[0] == nil
            result += arr2
        elsif arr2[0] == nil
            result += arr1
        else
            if arr1[0] < arr2[0] 
                result << arr1.shift
            else
                result << arr2.shift
            end
        end
    end
    result
end

# a = [38, 27, 43, 3, 9, 82, 10]
# p merge_sort(a)

def subsets(array)
    return [] if array.length==0
    return [[], array] if array.length==1
    result= [*subsets(array[0..-2])]
    subsets(array[0..-2]).each do |el| 
        result << (el << array[-1])
    end
    #array[-1] 
    #subsets(array[0..-2]).each {|el| el << array[-1]}
    result
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def permutations(array)
    if array.length == 1
        return [array]
    end
    perm_list = [] 
    array.each do |ele|
        remaining_elements = array.select {|x| x != ele}
        sub_perms = permutations(remaining_elements) 
        sub_perms.each do |ele2|
            perm_list << ([ele] + ele2)
        end
    end
    return perm_list
end

# p permutations([1, 2, 3, 4]) # => [[1, 2, 3], [1, 3, 2],
                            # [2, 1, 3], [2, 3, 1],
                            # [3, 1, 2], [3, 2, 1]]  

def num_occur(array, target)
    return 1 if array.length == 1 && array[0] == target
    return 0 if array.length == 1
    if array[0] == target
        return 1 + num_occur(array[1..-1], target)
    else 
        num_occur(array[1..-1], target)
    end
end

p num_occur([4, 5, 2, 2, 2, 8, 2], 2)