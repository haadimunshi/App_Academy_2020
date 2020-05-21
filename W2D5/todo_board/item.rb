class Item

    attr_reader :deadline
    attr_accessor :title, :description

    def self.valid_date?(date_string)
        date_arr = date_string.split("-")
        date_arr.each_with_index do |part, i|
            return false if !date_arr[0].length == 4
            
            if date_arr[1][0].include?("0") || date_arr[1].to_i <= 12 && date_arr[2].to_i <= 31
                return true
            end
        end
        false
    end

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
        raise "invalid date" if !Item.valid_date?(deadline)
    end

    def deadline=(new_deadline)
        if !Item.valid_date?(new_deadline)
            raise "invalid deadline"
        else
            @deadline = new_deadline
        end
    end


end