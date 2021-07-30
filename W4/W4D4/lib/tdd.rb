class Tower

    attr_accessor :board, :game_over, :moves

    def initialize
        @board = Array.new(3) { [] }
        @game_over = false
        @moves = 0
        populate
    end

    def populate
        @board[0] << 4 << 3 << 2 << 1
    end

    def valid_move?(piece, stack_target)
        return false if @board[piece].empty?
        return true if @board[stack_target].empty?
        return false if @board[piece].last > @board[stack_target].last 
        true   
    end

    def move 
        begin
            system("clear")
            render
            puts
            puts "Enter a piece to move: 0, 1, 2"
            puts "Move Count: #{@moves}"
            piece = gets.chomp.to_i
            system("clear")
            render
            puts
            puts "Enter a stack to place the piece: 0, 1, 2"
            puts "Move Count: #{@moves}"
            stack = gets.chomp.to_i
            if valid_move?(piece, stack)
                @board[stack] << @board[piece].pop
                move_count
            end
        rescue
            puts "Move is not valid"
            retry
        end
    end

    def won?
        @board == [[],[],[4,3,2,1]] ? @game_over = true : false
    end

    def render
        print @board
    end

    def play
        until game_over
            move
        end
        puts "You Win!!"
    end

end

# def my_uniq(arr)
#     new_arr = []
#     arr.each { |ele| new_arr << ele if !new_arr.include?(ele) }
#     new_arr
#     # arr.uniq
# end

# def two_sum(arr)
#     new_arr = []
#     arr.each_with_index do |ele1,i|
#         arr.each_with_index do |ele2,j|
#             if i < j && (ele1 + ele2 == 0)
#                 new_arr << [i,j]
#             end
#         end
#     end
#     new_arr
# end

# def my_transpose(arr)
#     transposed = Array.new(arr.length) { Array.new(arr.length) }
#     arr.each.with_index do |row, i|
#         row.each.with_index do |col, j|
#             transposed[j][i] = arr[i][j]
#         end
#     end
#     transposed
# end

# def stock_picker(prices)

#     min = prices.index(prices.min)
#     max = prices.rindex(prices.max)

#     return "Buy on Day #{min}, Sell on Day #{max}!"

# end