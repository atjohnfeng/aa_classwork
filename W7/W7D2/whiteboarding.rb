# Validate Subsequence

# Given two non-empty arrays of integers, 
# write a function that determines whether 
# the second array is a subsequence of the first one.

# A subsequence of an array is a set of numbers that aren't 
# necessarily adjacent but that are in the same order as they appear in the array. 
# For instance, the numbers [1,3,4] form a subsequence of the array [1, 2, 3, 4], 
# and so fo the numbers [2, 4]. Note that a single number in an array and 
# the array itself are both valid sub sequences of the array.


# Sample Input:
# array= [5, 1, 22, 25, 6, -1, 8, 10]
# Sequence = [1, 6, -1, 10]

# Sample Output:
# True

#We can check each element of the subsequent array and check the indice, and 
#then we'll want to slice the array at the index. If the index of the number is
#not found, we will return false.

def validate_subsequence(arr1, arr2)

    arr2.each do |num|
        idx = arr1.index(num)
        return false if idx.nil?
        arr1 = arr1[idx+1..-1]
    end

    true
end

array = [5, 1, 22, 25, 6, 5, -1, 8, 10]
sequence = [1, 6, 5, -1, 10]

p validate_subsequence(array, sequence)