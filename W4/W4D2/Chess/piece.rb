require "singleton"
require_relative "modules.rb"

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