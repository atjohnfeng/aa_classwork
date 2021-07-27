require "singleton"

module Slideable 
    
    HORIZONTAL_DIRS = [ [1, 0],[0, 1],[-1, 0],[1, 0] ]
    DIAGONAL_DIRS = [ [1, -1],[1, 1],[-1, 1],[-1, -1] ]
    
    def horizontal_dirs 
        HORIZONTAL_DIRS
    end
    
    def diagonal_dirs 
        DIAGONAL_DIRS
    end
    
    def move_dirs
    
    end
    
    def moves
        moves_arr = []
        valid_dirs = move_dirs
        valid_dirs.each do |dir|
        end
    end
    
    def grow_unblocked_moves_in_dir(dx, dy)
        cur_pos = pos.dup
        results = []
        loop do 
            cur_pos = [cur_pos[0]+dx, cur_pos[1]+dy]
            results << cur_pos if cur_pos.all? { |ele| ele.between?(0, 7) } && !board[cur_pos].is_a?(NullPiece)
            if !(cur_pos.all? { |ele| ele.between?(0, 7) } || board[cur_pos].is_a?(NullPiece))
                break
            end
        end
        results
    end

end 

module Stepable

end


class Piece 

    def initialize(color, board, pos)
        @color = color 
        @board = board 
        @pos = pos 
    end
    
    def move_dirs
    
    end

    def to_s 
        
    end 

    private
    attr_reader :board, :pos

end

class NullPiece < Piece
    include Singleton
    
    def initialize 
        
    end

end