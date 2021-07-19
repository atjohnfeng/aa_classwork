class Board

    attr_reader :size

    def initialize(n)
        @size = n
        @grid = Array.new(n) { Array.new(n) }
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos,mark)
        @grid[pos[0]][pos[1]] = mark
    end

    def complete_row?(mark)
        @grid.each do |row|
            return true if row.uniq.length == 1 && row[0] == mark
        end
        return false
    end

    def complete_col?(mark)
        @grid.transpose.each do |col|
            return true if col.uniq.length == 1 && col[0] == mark
        end
        return false
    end

    def complete_diag?(mark)
        n = @grid.size
        (0...n-1).each do |row|
            count = 1
            (0...n-1).each do |col|
                count += 1 if @grid[row][row] == @grid[row+1][row+1] && @grid[row][row] == mark
            end
            return true if count == n
        end

        (1...n).each do |row|
            count = 1
            (0...n-1).each do |col|
                count += 1 if @grid[-row][-row] == @grid[row-1][row-1] && @grid[-row][-row] == mark
            end
            return true if count == n
        end

        return false
        
    end

    def winner?(mark)
        complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
