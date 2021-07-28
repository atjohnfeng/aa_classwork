require "colorize"
require_relative "cursor.rb"

class Display

    WHITE_SYMBOLS = { 
        :R => "♖",
        :B => "♗",
        :Kn => "♘",
        :K => "♔",
        :Q => "♕",
        :P => "♙"
    }

    BLACK_SYMBOLS = {
        :R => "♜",
        :B => "♝",
        :Kn => "♞",
        :K => "♚",
        :Q => "♛",
        :P => "♟",
    }
    
    attr_reader :board

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0],board)
    end

    def render
        system("clear")
        str_to_p = ""
        board.rows.each do |row|
            row.each do |ele|
                case ele.color
                when nil
                    str_to_p << "  "
                when :White 
                    str_to_p << "#{ele.symbol}"
            end
        end
    end

end