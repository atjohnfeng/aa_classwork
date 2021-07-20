class Board

    def initialize
        @board = Array.new(4) { Array.new(4, :E) }
    end

    def place_random_cards
        
        while self.empty_positions?
        random_card = Card.new 
        row = rand(0...4)
        col = rand(0...4)
        pos = [row, col]
        if self.empty?(pos)
            self[pos] = random_card
            row_2 = rand(0...4)
            col_2 = rand(0...4)
            pos_2 = [row_2, col_2]
            if self.empty?(pos_2)
                self[pos_2] = random_card
            
    end

    def empty_positions?
        self.each do |row|
            (0...4).each do |i|
                return true if row[i] == :E 
            end 
        end 
        false 
    end 



    def empty?(pos)
        self[pos] == :E 
    end 



    def [](pos)
        #row, col = [pos(0), pos(1)]
        @board[pos[0]][pos[1]]
    end 

end