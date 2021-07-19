class Passenger
   
    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(flight_numb)
        @flight_numbers.include?(flight_numb.upcase)
    end

    def add_flight(flight_num)
        @flight_numbers << flight_num.upcase if !has_flight?(flight_num)  
    end

end