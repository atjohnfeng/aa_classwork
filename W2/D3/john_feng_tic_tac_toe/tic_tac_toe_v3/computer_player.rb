require_relative 'game'
require_relative 'human_player'
require_relative 'board'

class Computerplayer 

    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        length = legal_positions.length
        index = rand(0...length)
        pos = legal_positions[index]
        puts
        puts 'Computer ' + mark.to_s + ' made its move at ' + pos.to_s + '!'
        return pos
    end

end