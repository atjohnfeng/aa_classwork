class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.join("").to_i
  end
end

class String
  def hash
    alphabet = ('a'..'z').to_a
    hash = Hash.new(0)
    alphabet.each_with_index { |char,i| hash[char] = i }
    output = []
    self.each_char do |char|
      output << hash[char].to_s
    end
    output.join("").to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    alphabet = (:a..:z).to_a
    hash = Hash.new(0)
    alphabet.each_with_index { |char,i| hash[char] = i }
    output = []
    keys = self.keys
    keys.each do |key|
      output << hash[key].to_s
    end
    new_output = output.map{|x| x.to_i}.sum

    return new_output
  end
end
