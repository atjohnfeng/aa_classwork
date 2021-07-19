require_relative 'game'
require_relative 'human_player'
require_relative 'computer_player'

class Board

    attr_reader :grid

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :_) }
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

    def valid?(pos)
        if pos[0] >= @grid.length || pos[1] > @grid.length
            puts 'out of bounds'
            return false
        else
            return true
        end
    end

    def empty?(pos)
        if @grid[pos[0]][pos[1]] == :_
            return true
        else 
            return false
        end
    end

    def place_mark(pos, mark)
        if empty?(pos) && valid?(pos)
            @grid[pos[0]][pos[1]] = mark
        else
            raise 'invalid mark'
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            if row[0] == mark
                return true if row.uniq.length == 1
            end
        end
        return false
    end

    def win_col?(mark)
        columns = @grid.transpose
        columns.each do |row|
            if row[0] == mark
                return true if row.uniq.length == 1
            end
        end
        return false
    end

    def win_diagonal?(mark)
        length = @grid.length
        (0...grid.length).each do |i|
            if mark != @grid[i][i]
                return false
            end
        end
        (0...grid.length).each do |i|
            if mark != @grid[-i][-i]
                return false
            end
        end
        return true
    end

    def win?(mark)
        if win_row?(mark)
            return true
        elsif win_col?(mark)
            return true
        elsif win_diagonal?(mark)
            return true
        end
        return false
    end

    def empty_positions?
        @grid.each do |row|
            return true if row.any? { |ele| ele == :_ }
        end
        return false
    end

    def legal_positions
        legal_positions = []
        @grid.each_with_index do |row, i|
            row.each_with_index do |ele, i2|
                if empty?([i,i2]) && valid?([i,i2])
                    legal_positions << [i,i2]
                end
            end
        end
        legal_positions
    end

end