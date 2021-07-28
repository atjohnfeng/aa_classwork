require_relative "piece.rb"

class Board 

    attr_reader :rows
    
    def initialize
        @rows = Array.new(8) { Array.new(8) }
        populate_board
    end

    def populate_board 
        @rows[1].each_index { |idx| @rows[1][idx] = Pawn.new(:Black, self, [1, idx]) }
        @rows[6].each_index { |idx| @rows[6][idx] = Pawn.new(:White, self, [6, idx]) }
        (2..5).each { |row| (0..7).each { |col| @rows[row][col] = NullPiece.instance } }
        [:White, :Black].each do |color|
            (0..7).each do |col|
                color == :White ? row = 7 : row = 0
                case col
                when 0, 7
                    @rows[row][col] = Rook.new(color, self, [row,col])
                when 1, 6
                    @rows[row][col] = Knight.new(color, self, [row,col])
                when 2, 5
                    @rows[row][col] = Bishop.new(color, self, [row,col])
                when 3
                    @rows[row][col] = Queen.new(color, self, [row,col])
                when 4
                    @rows[row][col] = King.new(color, self, [row,col])
                end
            end
        end
    end
    
    def [](pos)
        @rows[pos[0]][pos[1]]
    end

    def []=(pos, value)
        @rows[pos[0]][pos[1]] = value
    end
    
    def move_piece(start_pos, end_pos)
        raise 'There is no piece here.' if start_pos.any? { |ele| !ele.between?(0, 7) } || self[start_pos].is_a?(NullPiece)
        raise 'Cannot move there.' if end_pos.any? { |ele| !ele.between?(0, 7) }
        self[end_pos] = self[start_pos]
        self[end_pos].pos = end_pos
        self[start_pos] = NullPiece.instance
    end
    
    def find_king(color)
        @rows.each { |row| row.each { |ele| return ele.pos if ele.is_a?(King) && ele.color == color}}
    end 

    def in_check?(color)
        king_pos = find_king(color)
        @rows.each do |row|
            row.each do |ele|
                if !ele.is_a?(NullPiece) && ele.color != color
                    return true if ele.moves.include?(king_pos)
                end
            end
        end
        false
    end
    
    def checkmate(color)

    end

end