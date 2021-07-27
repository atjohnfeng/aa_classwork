require_relative "piece.rb"

class Board 
    
    def initialize
        @rows = Array.new(8) { Array.new(8) }
        @null_piece = NullPiece
        @rows.each_with_index do |row, idx|
            if [1, 2, 6, 7].include?(idx)
                row.each_with_index do |space, idx2|
                    row[idx2] = Piece.new 
                end
            else
                row.each_with_index do |space, idx2|
                    row[idx2] = NullPiece.instance
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
        raise 'There is no piece here.' if start_pos.any? { |ele| !ele.between?(0..7) } || self[start_pos].is_a?(NullPiece)
        raise 'Cannot move there.' if end_pos.any? { |ele| !ele.between?(0..7) }
        self[end_pos] = self[start_pos]
        self[start_pos] = NullPiece.instance
    end

end