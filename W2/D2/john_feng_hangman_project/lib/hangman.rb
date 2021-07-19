class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) { "_" }
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(c)
    if @attempted_chars.include?(c)
      return true
    end
    false
  end

  def get_matching_indices(c)
    indices = []
    @secret_word.each_char.with_index do |char, i|
      if c == char
        indices << i
      end
    end
    indices
  end

  def fill_indices(c, indices)
    indices.each { |i| @guess_word[i] = c }
  end

  def try_guess(c)
    if already_attempted?(c)
      puts 'that has already been attempted'
      false
    else 
      @attempted_chars << c[0]
      if get_matching_indices(c).length == 0
        @remaining_incorrect_guesses -=1 
      else
        fill_indices(c, get_matching_indices(c))
      end
      true
    end
  end

  def ask_user_for_guess
    puts 'Enter a char:'
    char = gets.chomp[0]
    try_guess(char)
  end

  def win?
    if @guess_word.join == @secret_word
      puts 'WIN' 
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts 'LOSE'
      return true
    end
    false
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    end
    false
  end

end
