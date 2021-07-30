#Phase I - Quadratic
# def my_min(arr)

#     arr.each_with_index do |ele, i|
#         flag = true
#         arr.each_with_index do |el, j|
#             if j != i
#                 if el < ele
#                     flag = false
#                 end
#             end
#         end
#         return ele if flag
#     end

# end

#Phase II - Linear
# def my_min(arr)

#     min = arr.first
#     arr.each { |ele| min = ele if ele < min }
#     min 

# end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

#Phase I - Exponential
# def largest_contiguous_subsum(arr)

#     results = []
#     (0...arr.length).each do |idx1|
#         (0...arr.length).each do |idx2|
#             if idx2 >= idx1
#                 results.push(arr[idx1..idx2])
#             end
#         end
#     end

#     largest = results[0].sum
#     results.each do |ele|
#         current = ele.sum
#         largest = current if current > largest
#     end
#     largest

# end

#Phase 2 - 
def largest_contiguous_subsum(arr)

    largest_sum = arr.first
    curr_sum = arr.first
    (1...arr.length).each do |i|
      if curr_sum + arr[i] > 0  
        curr_sum += arr[i] 
      elsif curr_sum + arr[i] < 0
        if curr_sum > largest_sum 
          largest_sum = curr_sum
        end
        curr_sum = 0
      end
    end
    largest_sum
end

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])