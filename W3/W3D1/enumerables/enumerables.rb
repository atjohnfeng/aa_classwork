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
        self.my_each do |ele|
            new_arr << ele if prc.call(ele)
        end
        new_arr

    end


    def my_reject(&prc)
      new_arr = []
        self.my_each do |ele|
            new_arr << ele if !prc.call(ele)
        end
        new_arr
    end


    def my_any?(&prc)
      i = 0
      while i < self.length
        return true if prc.call(self[i])
        i+=1
      end
      return false
    end

    def my_all?(&prc)
      i = 0
      while i < self.length
        return false if !prc.call(self[i])
        i+=1
      end
      return true
    end

    def my_flatten
      return [self] if self.type_of != Array
      self.my_each do |sub| 
        if sub.type_of == Array
          sub.my_flatten
        end
      end

end


p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# p a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# p a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

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

