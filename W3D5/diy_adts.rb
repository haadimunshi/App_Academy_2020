class Stack
    def initialize
        @stack = []
    end

    def push(el)
        @stack << el
    end

    def pop
        @stack.pop
    end

    def peek
        return @stack.last
    end
end

class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.push(el)
    end

    def dequeue
        @queue.shift
    end
    
    def peek
        return @queue.first
    end
end

class Map
    def initialize
        @map = []
    end

    def set(key, value)
        pair_index = @map.index { |pair| pair[0] == key }
        if pair_index
            @map[pair_index][1] = value
        else
            @map << [key, value]
        end
    end

    def get(key)
        @map.each do |sub_arr|
            if sub_arr[0] == key
                return sub_arr[1]
            end
        end
        nil
    end

    def delete(key)
        @map.each do |sub_arr|
            if sub_arr[0] == key
                @map.delete(sub_arr)
            end
        end
    end

    def show
        return @map
    end
end