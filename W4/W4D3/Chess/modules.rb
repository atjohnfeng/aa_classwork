module Slideable 
    
    HORIZONTAL_DIRS = [ [1, 0],[0, 1],[-1, 0],[0, -1] ]
    DIAGONAL_DIRS = [ [1, -1],[1, 1],[-1, 1],[-1, -1] ]
    
    def horizontal_dirs 
        HORIZONTAL_DIRS
    end
    
    def diagonal_dirs 
        DIAGONAL_DIRS
    end
    
    def move_dirs
    
    end
    
    def moves
        moves_arr = []
        valid_dirs = move_dirs
        valid_dirs.each do |dir|            
            moves_arr += grow_unblocked_moves_in_dir(dir[0], dir[1])
        end
        moves_arr
    end
    
    def grow_unblocked_moves_in_dir(dx, dy)
        cur_pos = pos.dup
        results = []
        loop do 
            cur_pos = [cur_pos[0]+dx, cur_pos[1]+dy]
            results << cur_pos if cur_pos.all? { |ele| ele.between?(0, 7) } && board[cur_pos].color != color 
            if !cur_pos.all? { |ele| ele.between?(0, 7) } || board[cur_pos].color == color 
                break
            end
        end
        results
    end

end 

module Stepable
    
    def move_diffs
    
    end

    def moves
        moves_arr = []
        valid_moves = move_diffs 
        cur_pos = pos.dup 
        valid_moves.each do |move|
            new_pos = [cur_pos[0] + move[0], cur_pos[1] + move[1]]
            # p new_pos
            if new_pos.all? { |ele| ele.between?(0, 7) } && board[new_pos].color != color 
                moves_arr << new_pos
            end
        end
        moves_arr
    end


end