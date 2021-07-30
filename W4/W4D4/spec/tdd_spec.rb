require "rspec"
require "tdd"

describe Tower do
    subject(:game) { Tower.new }

    describe "#initialize" do
        it "creates a 2d array with a length of 3" do
            expect(game.board.length).to eq(3)
        end

        it "should set game_over to false" do 
            expect(game.game_over).to be false
        end

        it "should set moves to 0" do 
            expect(game.moves).to eq(0)
        end

        it "should populate the game" do 
            expect(game.board).to eq([[4,3,2,1],[],[]])
        end
    end

    describe "#valid_move?" do
        
        it "should return false if chosen stack is empty" do
            expect(game.valid_move?(2, 1)).to be false
        end
        it "should return true if moving piece to empty spot" do
            expect(game.valid_move?(0, 1)).to be true
        end
        it "should return false if moving piece to stack with lesser value" do
            game.board[2] << 0 
            expect(game.valid_move?(0,2)).to be false
        end

    end

    describe "#won?" do
        it "should return true if game is over" do
            4.times { game.board[0].pop }
            game.board[2] << 4 << 3 << 2 << 1
            expect(game.won?).to be true
        end

        it "should set game_over to true if game is over" do
            4.times { game.board[0].pop }
            game.board[2] << 4 << 3 << 2 << 1
            game.won?
            expect(game.game_over).to be true
        end

        it "should return false if game is not over" do
            expect(game.won?).to be false
        end
    end

    describe "#play" do

        it "should call moves until game_over is true" do
            expect(game).to receive(:move) {  }
            expect(game).to receive(:move) {  }
            expect(game).to receive(:move) { game.game_over = true }
            game.play
        end

    end

end

# describe "#my_uniq" do
#     let(:arr) { [1,2,3,4,5] }

#     it "removes duplicates from array" do 
#         arr = [1,1,1,3,3,2,5,7,7,7]
#         expect(my_uniq(arr)).to eq([1,3,2,5,7])
#     end

#     it "keeps all elements if already unique" do
#         expect(my_uniq(arr)).to eq(arr)
#     end

#     it "returns a new array" do
#         expect(my_uniq(arr)).to_not be(arr)
#     end

#     it "does not receive uniq method" do 
#         expect(arr).not_to receive(:uniq) 
#         my_uniq(arr)
#     end
    
# end

# describe "#two_sum" do
#     let(:arr) { [-1,0,2,-2,1] }

#     it "should return unique pairs of indicies whose values equal 0" do
#         expect(two_sum(arr)).to eq([[0,4],[2,3]])
#     end

#     it "smaller indices should come first" do
#         expect(two_sum(arr)).not_to eql([[2,3],[0,4]])
#     end

# end

# describe "#my_transpose" do
#     let(:rows) {
#         [[0, 1, 2],
#         [3, 4, 5],
#         [6, 7, 8]]
#     }

#     let(:ans) {
#         [[0, 3, 6],
#         [1, 4, 7],
#         [2, 5, 8]]
#     }

#     it "should convert rows to columns" do
#         expect(my_transpose(rows)).to eq(ans)
#     end

#     it "should not receive .transpose" do
#         expect(rows).not_to receive(:transpose)
#         my_transpose(rows)
#     end

# end

# describe "#stock_picker" do
#     let(:prices) { [1,5,7,4,5,19,1,2] }

#     it "should pick the most profitible days to buy and then sell" do
#         expect(stock_picker(prices)).to eq("Buy on Day 0, Sell on Day 5!")
#     end

#     it "should not buy high and sell low" do
#         expect(stock_picker(prices)).to_not eq("Buy on Day 8, Sell on Day 0!")
#     end
# end