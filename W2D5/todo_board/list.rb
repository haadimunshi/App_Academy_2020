require_relative 'item.rb'

class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        return true if @items << Item.new(title, deadline, description)
        false
    end

    def size
        @items.length
    end

    def valid_index?(index)
        if index < self.size && index >= 0
            return true
        end
        false
    end

    def swap(index_1, index_2)
        if !valid_index?(index_1) || !valid_index?(index_2)
            return false
        else
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        end
    end

    def [](index)
        return nil if !valid_index?(index)
        @items[index]
    end

    def priority
        @items[0]
    end

    def print
        print @label
        @items.each do |item|
            print item.title
            print item.title
            print item.deadline
    end

    def print_full_item(index)
        if valid_index(index)
            @items[index].print
            print @items[index].description
        end
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount)
        
    end

end