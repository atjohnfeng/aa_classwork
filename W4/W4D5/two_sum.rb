def bad_two_sum?(arr, value)
  flag = false
  (0...arr.length - 1).each do |i|
    (i + 1...arr.length).each do |j|
      flag = true if arr[i] + arr[j] == value
    end
  end
  flag
end

#Runtime? n * log(n) || n^2

def okay_two_sum?(arr, value)
  sorted = arr.sort

end
