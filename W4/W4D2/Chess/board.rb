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
                    row[idx2] = NullPiece.new
                end

            end
        end
    end

end