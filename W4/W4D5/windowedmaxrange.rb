#Naive Solution

def windowed_max_range(arr, window)

    current_max_range = nil
    (0..arr.length-window).each do |i|
        min = arr[i...i+window].min
        max = arr[i...i+window].max
        range = max - min
        current_max_range = range if current_max_range.nil?
        current_max_range = range if current_max_range < range
    end
    current_max_range

end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8p 