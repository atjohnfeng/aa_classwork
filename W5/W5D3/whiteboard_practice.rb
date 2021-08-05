# Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

# Example 1:

# Input: "babad"
# Output: "bab"
# Note: "aba" is also a valid answer.
# Example 2:

# Input: "cbbd"
# Output: "bb"

# Iterate through the string and find all substrings that are palindromes
# Iterate through palindromes and pass &length and just return the longest string

def longest_palindrome(string)

    palindromes = []

    (0...string.length).each do |i|
        (i+1...string.length).each do |j|
            sub = string[i..j]
            palindromes << sub if sub == sub.reverse
        end
    end

    palindromes.sort_by(&:length).last    

end

p longest_palindrome("babad")

# You are climbing a stair case. It takes n steps to reach to the top.

#   Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
  
#   Note: Given n will be a positive integer.
  
#   Example 1:
  
  
#   Input: 2
#   Output: 2
#   Explanation: There are two ways to climb to the top.
#   1. 1 step + 1 step
#   2. 2 steps
  
#   Example 2:
  
  
#   Input: 3
#   Output: 3
#   Explanation: There are three ways to climb to the top.
#   1. 1 step + 1 step + 1 step
#   2. 1 step + 2 steps
#   3. 2 steps + 1 step

#   Input: 4
#   Output: 
#   1. 1 + 1 + 1 + 1
#   2. 2 + 1 + 1
#   3. 1 + 2 + 1
#   4. 1 + 1 + 2
#   5. 2 + 2

#   Input: 5
#   Output:
#   1. 1 + 1 + 1 + 1 + 1
#   2. 2 + 1 + 1 + 1
#   3. 1 + 2 + 1 + 1
#   4. 1 + 1 + 2 + 1
#   5. 1 + 1 + 1 + 2
#   6. 2 + 2 + 1
#   7. 1 + 2 + 2
#   8. 2 + 1 + 2


# receive a positive integer n
# 
# return possible ways

def num_steps(n)
  return 1 if n <= 1
  num_steps(n-1) + num_steps(n-2)
end


# Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

# Example:


# Input: [0,1,0,3,12]
# Output: [1,3,12,0,0]

# Iterate through the array and shove non-zero elements into a new array
# Keep count of the 0's
# Shove count times of 0's into new array
# O(n)

def array_nums(arr)

    result = []
    count = 0

    arr.each { |num| num!=0 ? result << num : count += 1 }
    count.times { result.push(0) }
    result

end

p array_nums([0,1,0,3,12])

# You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check.
# Since each version is developed based on the previous version, all the versions after a bad version are also bad.

# Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.

# You are given an API bool isBadVersion(version) which will return whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.

# Example:


# Given n = 5, and version = 4 is the first bad version.

# call isBadVersion(3) -> false
# call isBadVersion(5) -> true
# call isBadVersion(4) -> true

# Then 4 is the first bad version. 

# receive an array of versions
# I would iterate over the array, testing each version with the isBadVersion method
# if a version returns true when passed to method, return that version number
# if we never encounter a bad version return true
# big O of O(n)

def bad_version_finder(array)
  array.each { |version| return version if isBadVersion(version) }
  nil
end
