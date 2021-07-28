require "singleton"
require_relative "modules.rb"

class Piece 

    def initialize(color, board, pos)
        @color = color 
        @board = board 
        @pos = pos 
    end
    
    def pos=(new_pos)
        @pos = new_pos
    end
    
    def move_dirs
    
    end

    def to_s 
        
    end
    
    attr_reader :board, :pos, :color 

end

class NullPiece < Piece
    include Singleton
    
    def initialize 
        super(nil, nil, nil)
    end

    def symbol
        ""
    end

    def moves
        []
    end

end

class Rook < Piece
include Slideable

    def initialize(color, board, pos)
        super(color, board, pos)
    end

    def symbol
        :R
    end

    def move_dirs
        horizontal_dirs
    end

end

class Bishop < Piece 
include Slideable 

    def initialize(color, board, pos)
        super(color, board, pos)
    end

    def symbol 
        :B 
    end

    def move_dirs
        diagonal_dirs 
    end

end

class Queen < Piece 
include Slideable 
    
    def initialize(color, board, pos)
        super(color, board, pos)
    end

    def symbol
        :Q
    end

    def move_dirs 
        diagonal_dirs + horizontal_dirs
    end

end

class Knight < Piece 
include Stepable 

    def initialize(color, board, pos)
        super(color, board, pos)
    end

    def symbol
        :Kn 
    end

    def move_diffs 
        [ [2, 1], [1, 2], [-2, -1], [-1, -2], [-2, 1], [2, -1], [-1, 2], [1, -2] ]
    end

end

class King < Piece 
include Stepable 

    def initialize(color, board, pos)
        super(color, board, pos)
    end
    
    def symbol
        :K
    end

    def move_diffs 
        [ [1, 1], [1, -1], [-1, 1], [-1, -1], [0, -1], [0, 1], [1, 0], [-1, 0] ]
    end

end 

class Pawn < Piece 

    def initialize(color, board, pos)
        super(color, board, pos)
    end

    def symbol
        :P 
    end

    def moves
        forward_steps + side_attacks
    end

    def at_start_row?
        return true if color == :White && pos[0] == 6
        return true if color == :Black && pos[0] == 1
        false
    end
    
    def forward_dir
        color == :White ? -1 : 1
    end 
    
    def forward_steps
        results = []
        possible = [[pos[0]+forward_dir,pos[1]]]
        if at_start_row?
            possible << [pos[0]+(forward_dir*2),pos[1]]
        end
        possible.each do |new_pos|
            if new_pos.all? { |ele| ele.between?(0,7) } && board[new_pos].is_a?(NullPiece)
                results << new_pos
            end
        end
        results
    end 
    
    def side_attacks
        results = []
        [-1,1].each do |i|
            new_pos = [pos[0]+forward_dir,pos[1]+i]
            if new_pos.all? { |ele| ele.between?(0,7) } && !board[new_pos].is_a?(NullPiece) && board[new_pos].color != color
                results << new_pos
            end 
        end
        results
    end

end 