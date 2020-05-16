# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        return nil if self.empty?

        self.max - self.min
    end

    def average
        return nil if self.empty?

        (self.sum.to_f / self.length)
    end

    def median
        return nil if self.empty?

        if self.length.odd?
            median_index = (self.length - 1) / 2
            return self.sort[median_index]
        else
            second_index = self.length / 2
            first_index = second_index - 1
            new_arr = [self.sort[first_index], self.sort[second_index]]
            new_arr.average
        end      
    end

    def counts
        count = Hash.new(0)

        self.map { |ele| count[ele] += 1 }

        count
    end

    def my_count(anything)
        count = 0

        self.each do |ele|
            count += 1 if ele == anything
        end

        count
    end

    def my_index(anything)
        indices = []

        self.each_with_index do |ele, i|
            if ele == anything
                indices << i
            end
        end

        return nil if indices.empty?
        indices.min
    end

    def my_uniq
        new_arr = []

        self.each do |ele|
            new_arr << ele if !new_arr.include?(ele)
        end

        new_arr
    end

    def my_transpose
        new_arr = []

        i = 0
        while i < self.length
            new_arr[i] = []
            j = 0
            while j < self.length
                new_arr[i] << self[j][i]

                j += 1
            end
            i += 1
        end

        new_arr
    end

    
end
