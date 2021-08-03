class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count+1 > num_buckets
      resize!
    end

    index = key.hash % num_buckets
    @store[index] << key
    @count +=1
  end

  def include?(key)
    index = key.hash % num_buckets
    @store[index].include?(key)
  end

  def remove(key)
    index = key.hash % num_buckets
    if include?(key)
      @store[index].delete(key) 
      @count -=1    
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`

  end

  def num_buckets
    @store.length
  end

  def resize!
    elements = @store.flatten
    elements.each {|ele| remove(ele)}

    num_buckets.times {@store << [] }
    
    elements.each {|ele| insert(ele)}

  end
end
