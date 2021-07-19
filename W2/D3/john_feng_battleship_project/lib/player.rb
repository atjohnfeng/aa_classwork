class Player

    def get_move
        print "enter a position with coordinates separated with a space like '4 7'"
        position = gets.chomp.split
        position.each_with_index do |num,i|
            position[i] = num.to_i
        end
    end

end