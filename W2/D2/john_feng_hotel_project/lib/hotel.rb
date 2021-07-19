require_relative "room"

class Hotel

    def initialize(name, room_capacity)
        @name = name
        @rooms = {}
        room_capacity.each do |room, capacity|
            @rooms[room] = Room.new(capacity)
        end
    end

    def name 
        @name.split.map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room)
        @rooms.has_key?(room)
    end

    def check_in(person, room)
        if !room_exists?(room)
            puts 'sorry, room does not exist'
        else
            if @rooms[room].add_occupant(person)
                puts 'check in successful'
            else
                puts 'sorry, room is full'
            end
        end
    end

    def has_vacancy?
        !@rooms.keys.all? { |room| @rooms[room].full? }
    end

    def list_rooms
        @rooms.each_key do |room|
            space = @rooms[room].available_space
            puts room + " : " + space.to_s
        end
    end

end