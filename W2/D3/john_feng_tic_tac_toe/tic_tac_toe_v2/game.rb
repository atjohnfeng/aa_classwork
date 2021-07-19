require_relative 'game'
require_relative 'human_player'

class Game

    attr_reader :players, :mark, :currentplayer

    def initialize(*mark, n)
        @marks = mark
        @players = []
        (0...mark.length).each do |i|
            @players[i] = Humanplayer.new(mark[i])
        end
        @grid = Board.new(n)
        @currentplayer = @players[0]
    end

    def switch_turn
        @currentplayer = @players.rotate(@players.index(@currentplayer)+1)
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