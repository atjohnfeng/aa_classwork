require_relative "card.rb"
require_relative "game.rb"


class Board

    attr_reader :board

    def initialize
        @board = Array.new(4) { Array.new(4, :E) }
    end

    def [](pos)
        @board[pos[0]][pos[1]]
    end

    def []=(pos, value)
        @board[pos[0]][pos[1]] = value
    end

    def place_random_cards
        while !self.full?
            generate_pair
        end 
    end

    def generate_pair
        random_card = Card.new
        available_positions = empty_positions
        pos_1 = available_positions.sample
        @board[pos_1[0]][pos_1[1]] = random_card
        available_positions = empty_positions
        pos_2 = available_positions.sample
        @board[pos_2[0]][pos_2[1]] = random_card
    end 

    def render 
        rows = Array.new(4) {Array.new}
        puts "  0 1 2 3" 
        @board.each_with_index do |row, i|
            (0...4).each do |i2|
                if row[i2].hidden
                    rows[i] << ' '
                else 
                    rows[i] << row[i2].face_value
                end 
            end 
        end 
        rows.each_with_index do |row, i|
            puts i.to_s + ' ' + row.join(' ')
        end 
        # @board.each_with_index do |row, i|
        #     p " #{i} #{row[0].face_value} #{row[1].face_value} #{row[2].face_value} #{row[3].face_value}" q
        # end
    end 




    def empty_positions
        empty_positions = []
        (0...4).each do |i1|
            (0...4).each do |i2|
                empty_positions << [i1, i2] if @board[i1][i2] == :E  
            end
        end
        empty_positions
    end

    def full?
         @board.each do |row|
            (0...4).each do |i|
                return false if row[i] == :E 
            end 
        end 
        return true 
    end 

    def empty?(pos)
        @board[pos] == :E 
    end 

end