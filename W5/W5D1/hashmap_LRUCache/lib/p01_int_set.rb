class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)

  end

  def insert(num)
    raise "Out of bounds" if !is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num.between?(0,@store.length)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    index = num%20
    @store[index] << num
    
  end

  def remove(num)
    index = num % 20
    @store[index].delete(num)
  end

  def include?(num)
    index = num % 20
    # modulo (%) the number by the set's length
    @store[index].include?(num)
    # add it to the array at that index
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if count + 1 > num_buckets
      resize!
    end
    if !include?(num)
      idx = num % num_buckets
      @store[idx] << num
      @count +=1
    end
  end

  def remove(num)
    idx = num % num_buckets
    if include?(num)
      @store[idx].delete(num)
      @count -=1
    end
  end

  def include?(num)
    idx = num % num_buckets
    @store[idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    numbers = @store.flatten
    numbers.each do |num|
      remove(num)
    end

    num_buckets.times do
      @store << []
    end
    numbers.each { |num| insert(num) }
  end
  
end
