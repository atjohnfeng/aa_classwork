class Array

    def my_each(&prc)
      i = 0
      while i < self.length
          prc.call(self[i])
          i+=1
      end
      self
    end

end

 # calls my_each twice on the array, printing all the numbers twice.
return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end
# => 1
    #  2
    #  3
    #  1
    #  2
    #  3

p return_value  # => [1, 2, 3]