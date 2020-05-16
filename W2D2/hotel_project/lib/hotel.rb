require_relative "room"

class Hotel

    attr_reader :rooms
    
    def initialize(name, hash)
        @name = name
        @rooms = {}

        hash.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end

    def name
        capitalized = []
        @name.split.each do |word|
            capitalized << word.capitalize
        end
        capitalized.join(" ")
    end

    def room_exists?(room_name)
        return true if @rooms.keys.include?(room_name)
        false
    end

    def check_in(person, room_name)
        if room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                p "check in successful" 
            else
                p "sorry, room is full"
            end
        else
            p "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.values.map { |room| return true if !room.full? }
        false
    end

    def list_rooms
        @rooms.each do |room_name, room|
            print room_name
            p room.available_space
        end
    end

end
