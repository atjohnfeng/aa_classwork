class Flight

    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        @passengers.length == @capacity
    end

    def board_passenger(passenger)
        if passenger.has_flight?(@flight_number) && !self.full?
            @passengers << passenger
        end
    end

    def list_passengers
        passengers_list = []
        passengers.each { |passenger| passengers_list << passenger.name }
        return passengers_list
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger)
        board_passenger(passenger)
    end

end