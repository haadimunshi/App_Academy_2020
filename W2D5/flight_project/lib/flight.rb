class Flight

    attr_reader :passengers

    def initialize(flight_number_str, capacity)
        @flight_number = flight_number_str
        @capacity = capacity
        @passengers = []
    end

    def full?
        if @passengers.length == @capacity
            return true
        end
        false
    end

    def board_passenger(passenger)
        if passenger.has_flight?(@flight_number) && !full?
            @passengers << passenger
        end
    end

    def list_passengers
        passengers_arr = []
        @passengers.map { |passenger| passengers_arr << passenger.name }
        passengers_arr
    end

    def [](idx)
        @passengers[idx]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end

end