require 'byebug'

class Code
  
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(pegs)
    pegs.each do |color|
      if !POSSIBLE_PEGS.include?(color.upcase)
        return false
      end
    end
    return true
  end

  def initialize(pegs)
    if !Code.valid_pegs?(pegs)
      raise "pegs not valid"
    else 
      @pegs = pegs.map(&:upcase)
    end
  end

  def self.random(length)
    pegs = Array.new(length)
    possible_pegs = ["R", "G", "B", "Y"]
    pegs.each_index do |i|
      pegs[i] = possible_pegs[rand(0..3)]
    end
    Code.new(pegs)
  end

  def self.from_string(pegs)
    peg_array = pegs.upcase.split("")
    Code.new(peg_array)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guesses)
    correct = 0
    @pegs.each_with_index do |peg, i|
      correct += 1 if pegs[i] == guesses[i]
    end
    correct
  end

  def num_near_matches(guesses)

    near_match = 0
    matches = Hash.new(0)

    @pegs.each do |peg|
      matches[peg] += 1
    end

    @pegs.each_with_index do |peg, i|
      if peg == guesses[i]  
        matches[guesses[i]] -= 1
      end
    end
    
    @pegs.each_with_index do |peg, i|
      if !(peg == guesses[i]) && matches[guesses[i]] > 0 
        near_match += 1
        matches[guesses[i]] -= 1
      end
    end

    near_match

  end

  def ==(pegs)
    pegs == @pegs
  end

end
