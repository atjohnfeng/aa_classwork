require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player = Player.new()
        @board = Board.new(n)
        @remaining_misses = @board.size/2
    end

    def start_game
        @board.place_random_ships
        puts "Number of ships: " + @board.num_ships.to_s
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts 'you lose'
            return true
        end
        return false
    end

    def win?
        if @board.num_ships == 0
            puts 'you win'
            return true
        end
        return false
    end

    def game_over?
        if lose? or win?
            return true
        end
        return false
    end

    def turn
        position = @player.get_move
        number_of_ships = @board.num_ships
        @board.attack(position)
        if @board.num_ships == number_of_ships
            @remaining_misses -= 1
        end
        @board.print
        puts @remaining_misses
    end

end
