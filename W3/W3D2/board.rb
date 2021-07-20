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
        
        # while self.empty_positions?
        #     random_card = Card.new 
        #     row = rand(0...4)
        #     col = rand(0...4)
        #     row_2 = rand(0...4)
        #     col_2 = rand(0...4)
        #     pos = [row, col]
        #     pos_2 = [row_2, col_2]
        #     if self.empty?(pos) && self.empty?(pos_2)
        #         self[pos] = random_card
        #         self[pos_2] = random_card
        #     end
        # end

        while full?
            random_card = :X
            available_positions = empty_positions
            pos_1 = available_positions.sample
            @board[pos_1[0]][pos_1[1]] = random_card
            available_positions = empty_positions
            pos_2 = available_positions.sample
            @board[pos_2[0]][pos_2[1]] = random_card
        end
            
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
                return false if row[i] != :E 
            end 
        end 
        return true 
    end 

    def empty?(pos)
        @board[pos] == :E 
    end 

end