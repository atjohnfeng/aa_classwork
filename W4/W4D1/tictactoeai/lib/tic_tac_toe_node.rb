require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

# A #losing_node? is described in the following cases:

# Base case: the board is over AND
# If winner is the opponent, this is a losing node.
# If winner is nil or us, this is not a losing node.
# Recursive case:
# It is the player's turn, and all the children nodes are losers for the player (anywhere they move they still lose), OR
# It is the opponent's turn, and one of the children nodes is a losing node for the player (assumes your opponent plays perfectly; they'll force you to lose if they can).


  def losing_node?(evaluator)
    # base case
    return true if @board.over? && evaluator == next_mover_mark
    # 
    return children.all? {|child| child.losing_node?(evaluator)}
    # every child is a loser
    return true if children.any? {|child| child.board.won? }
    # cat's game
    return false if !children.any? {|child| child.board.tied? }
    false
  end

  def winning_node?(evaluator)
    return true if @board.over? && evaluator == next_mover_mark
    child_queue = children
    until child_queue.empty?
      child = child_queue.shift
      return true if child.board.over? && evaluator == next_mover_mark
      child_queue += child.children
    end
    return false
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    available_moves = []
    (0...@board.rows.length).each do |i|
      (0...@board.rows[i].length).each do |j|
        if @board.empty?([i,j])
          new_board = @board.dup
          new_board[[i,j]] = next_mover_mark
          if next_mover_mark == :x
            next_mover_mark = :o
          else
            next_mover_mark = :x
          end
          available_moves << TicTacToeNode.new(new_board, next_mover_mark, [i,j]) 
        end
      end
    end
    available_moves
  end
end
