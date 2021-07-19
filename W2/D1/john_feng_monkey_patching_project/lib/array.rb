# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.sum/self.length.to_f
    end

    def median
        return nil if self.empty?
        return self.sort[self.length/2] if self.length.odd?
        self.sort[self.length/2-1..self.length/2].sum/2.0
    end

    def counts
        count = Hash.new(0)
        self.each { |c| count[c] += 1 }
        count
    end

    def my_count(value)
        count = 0
        self.each { |c| count += 1 if c == value }
        count
    end

    def my_index(value)
        # self.index(value)
        return nil if !self.include?(value)
        self.each_with_index { |c,i| return i if c == value }
    end

    def my_uniq
        unique = []
        self.each { |c| unique << c if !unique.include?(c) }
        unique
    end

    def my_transpose
        height = self.length
        length = self[0].length
        transposed = Array.new(length) { Array.new(height) }
        (0...height).each do |i|
            (0...length).each do |i2|
                transposed[i][i2] = self[i2][i]
            end
        end
        transposed
    end
  
end