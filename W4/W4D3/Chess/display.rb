require "colorize"
require_relative "cursor.rb"
require_relative "board.rb"

class Display

    BLACK_SYMBOLS = { 
        :R => "♖",
        :B => "♗",
        :Kn => "♘",
        :K => "♔",
        :Q => "♕",
        :P => "♙"
    }

    WHITE_SYMBOLS = {
        :R => "♜",
        :B => "♝",
        :Kn => "♞",
        :K => "♚",
        :Q => "♛",
        :P => "♟",
    }
    
    attr_reader :board, :cursor
    
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0],board)
    end

    def render
        system("clear")
        str_to_p = ""
        board.rows.each_with_index do |row, i|
            row.each_with_index do |ele, j|
                case ele.color
                when nil
                    cur_symbol = "  "
                when :White 
                    cur_symbol = "#{WHITE_SYMBOLS[ele.symbol]} "
                when :Black
                    cur_symbol = "#{BLACK_SYMBOLS[ele.symbol]} "
                end
                if [i, j] == cursor.cursor_pos 
                    cur_symbol = cur_symbol.red
                end
                # cur_symbol.colorize({background: :blue, color: :white}) 
                str_to_p << cur_symbol
            end
            str_to_p << "\n"
        end
        puts str_to_p
    end

end

# d = Display.new(Board.new)
# 10.times do
#     d.render
#     d.cursor.get_input
# end