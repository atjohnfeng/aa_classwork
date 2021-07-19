require_relative 'game'
require_relative 'human_player'

class Game

    attr_reader :playerOne, :playerTwo, :p1_mark, :p2_mark, :currentplayer

    def initialize(p1_mark, p2_mark)
        @p1_mark = p1_mark
        @p2_mark = p2_mark
        @playerOne = Humanplayer.new(p1_mark)
        @playerTwo = Humanplayer.new(p2_mark)
        @grid = Board.new
        @currentplayer = @playerOne
    end

    def switch_turn
        if @currentplayer == @playerOne
            @currentplayer = @playerTwo
        else
            @currentplayer = @playerOne
        end
    end

    def play
        while @grid.empty_positions?
            puts '------------------------------------'
            @grid.print
            mark = @currentplayer.mark
            pos = @currentplayer.get_position
            @grid.place_mark(pos, mark)
            if @grid.win?(mark)
                return mark.to_s + ' has achieved victory for glorious purpose!'
            else
                switch_turn
            end
        end
        return 'Neither player achieved glorious purpose.'
    end

end