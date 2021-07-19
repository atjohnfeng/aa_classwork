require_relative 'game'
require_relative 'human_player'
require_relative 'computer_player'

class Game

    attr_reader :players, :currentplayer

    def initialize(n, *mark)
        @marks = mark[0].keys
        @isrobot = mark[0].values
        @players = []
        length = @marks.length
        (0...length).each do |i|
            if @isrobot[i] != true
                @players[i] = Humanplayer.new(@marks[i])
            else
                @players[i] = Computerplayer.new(@marks[i])
            end
        end
        @grid = Board.new(n)
        @currentplayer = @players[0]
    end

    def switch_turn
        @currentplayer = @players.rotate(@players.index(@currentplayer)+1)[0]
    end

    def play
        while @grid.empty_positions?
            puts
            @grid.print
            puts
            mark = @currentplayer.mark
            pos = @currentplayer.get_position(@grid.legal_positions)
            @grid.place_mark(pos, mark)
            if @grid.win?(mark)
                @grid.print
                puts
                return mark.to_s + ' has achieved victory for glorious purpose!'
            else
                switch_turn
            end
        end
        puts
        @grid.print
        puts
        return 'Neither player achieved glorious purpose.'
    end

end