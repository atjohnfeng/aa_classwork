class Board

    attr_reader :max_height

    def self.build_stacks(n)
        Array.new(n) { [] }
    end

    def initialize(n, max_height)
        if n < 4 || max_height < 4
            raise 'rows and cols must be >= 4'
        end
        @stacks = Board.build_stacks(n)
        @max_height = max_height
    end

    def add(token, index)
        if @stacks[index].length < max_height
            @stacks[index] << token
            return true
        end
        return false
    end

    def vertical_winner?(token)
        @stacks.each do |row|
            if row.length == max_height && row.uniq.length == 1 && row[0] == token
                return true
            end
        end

        return false
    end

    def horizontal_winner?(token)
        (0...max_height).any? do |colidx|
            @stacks.all? do |row|
                row[colidx] == token
            end
        end
    end

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
