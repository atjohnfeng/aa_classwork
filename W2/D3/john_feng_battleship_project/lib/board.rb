class Board
  
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n*n
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

    def num_ships
        count = 0
        @grid.each do |row|
            row.each do |ele|
                count += 1 if ele == :S
            end
        end
        count
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts 'you sunk my battleship!'
            true
        else
            self[pos] = :X
            false
        end
    end

    def place_random_ships
        required_ships = @size / 4
        while num_ships < required_ships
            rrow = rand(0...@grid.length)
            rcol = rand(0...@grid.length)
            pos = [rcol, rrow]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        length = @grid.length
        hidden_grid = @grid.map do |row|
            row.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
        hidden_grid
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end