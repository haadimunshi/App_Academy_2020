class Passenger

    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(flight_number_str)
        return true if @flight_numbers.include?(flight_number_str.upcase) || @flight_numbers.include?(flight_number_str.downcase)
        false
    end

    def add_flight(flight_number_str)
        if !has_flight?(flight_number_str)
            @flight_numbers << flight_number_str.upcase
        end
    end

end