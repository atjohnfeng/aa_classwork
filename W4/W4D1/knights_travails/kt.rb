require_relative "00_tree_node"

class KnightPathFinder

    attr_reader :root_node, :considered_positions

    def initialize(pos)
        @considered_positions = [pos]
        @root_node = PolyTreeNode.new(pos)
        self.build_move_tree
    end

    def self.valid_moves(pos)
        # With this pos passed in, where could I move from here
        row, col = pos
        valid_moves = []
        valid_moves << [row+2, col+1] if KnightPathFinder.valid_pos?([row+2, col+1])
        valid_moves << [row+1, col+2] if KnightPathFinder.valid_pos?([row+1, col+2])
        valid_moves << [row-2, col-1] if KnightPathFinder.valid_pos?([row-2, col-1])
        valid_moves << [row-1, col-2] if KnightPathFinder.valid_pos?([row-1, col-2])
        valid_moves << [row+1, col-2] if KnightPathFinder.valid_pos?([row+1, col-2])
        valid_moves << [row-1, col+2] if KnightPathFinder.valid_pos?([row-1, col+2])
        valid_moves << [row+2, col-1] if KnightPathFinder.valid_pos?([row+2, col-1])
        valid_moves << [row-2, col+1] if KnightPathFinder.valid_pos?([row-2, col+1])
        valid_moves
        # return array of pos
    end

    def self.valid_pos?(pos)
        row, col = pos
        return false if row > 7 || row < 0 || col > 7 || col < 0
        return true
    end

    # Write an instance method #new_move_positions(pos); 
    # this should call the ::valid_moves class method, but filter out any positions that are 
    # already in @considered_positions. It should then add the remaining new positions to 
    # @considered_positions and return these new positions.

    def new_move_positions(pos)
        poss_moves = KnightPathFinder.valid_moves(pos)
        poss_moves.select! { |move| !@considered_positions.include?(move) }
        poss_moves.each do |move|
            @considered_positions << move
        end
        poss_moves
    end

    # To ensure that your tree represents only the shortest path to a given position, 
    # build your tree in a breadth-first manner. Take inspiration from your BFS algorithm: 
    # use a queue to process nodes in FIFO order. Start with a root node representing 
    # the start_pos and explore moves from one position at a time.


    # Create a node tree
    # Parent, the previous move
    # Child, all the possible moves from there
    def build_move_tree
        queue = [root_node]
        until queue.empty?
            node = queue.shift
            children = new_move_positions(node.value)
            children.each do |child|
                child_node = PolyTreeNode.new(child, node)
                node.add_child(child_node)
                queue << child_node
            end
        end
    end

    # Create an instance method #find_path(end_pos) to search for end_pos in the move tree. 
    # You can use either dfs or bfs search methods from the PolyTreeNode exercises; it doesn't matter. 
    # This should return the tree node instance containing end_pos.
    def find_path(end_pos)
        trace_path_back(@root_node.dfs(end_pos))
    end
    # This gives us a node, but not a path. 
    # Lastly, add a method #trace_path_back to KnightPathFinder.
    # This should trace back from the node to the root using PolyTreeNode#parent. 
    # As it goes up-and-up toward the root, it should add each value to an array. 
    # #trace_path_back should return the values in order from the start position to the end position.
    def trace_path_back(node)
        path_back = [node.value]
        node_parent = node.parent
        until node_parent == nil
            path_back << node_parent.value
            node_parent = node_parent.parent
        end
        path_back.reverse
    end
    # Use #trace_path_back to finish up #find_path.

end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]