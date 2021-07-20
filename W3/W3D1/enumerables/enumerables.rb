class Array

    def my_each(&prc)
      i = 0
      while i < self.length
          prc.call(self[i])
          i+=1
      end
      self
    end

def my_select(&prc)
  new_arr = []
  self.my_each(&prc)
  i = 0
  while i < self.length
    if prc.call(self[i])
      new_arr << self[i]
    end
    i += 1
  end
  new_arr
end


def my_reject(&prc)
  new_arr = []
  # self.my_each(&prc)
  i = 0
  while i < self.length
    if !prc.call(self[i])
      new_arr << self[i]
    end
    i += 1
  end
  new_arr
end

# def my_any(&prc)
#   i = 0
#   while i < self.length
#     if prc.call(self[i])
#       return true
end

p a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# p a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

#  # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # => 1
#      2
#      3
#      1
#      2
#      3

# p return_value  # => [1, 2, 3]

