require_relative 'game'
require_relative 'board'

class Humanplayer

    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts
        puts @mark.to_s + ' player enter a position (Ex. 0 0):'
        puts
        position = gets.chomp
        if position.length != 3 || position[1] != ' ' || !'0123456789'.include?(position[0]) || !'0123456789'.include?(position[2])
            raise 're-enter position in proper format'
        end
        pos = [position[0].to_i,position[2].to_i]
    end

end