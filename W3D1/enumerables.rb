require 'byebug'

class Array

    def my_each(&prc)
        self.map do |ele|
            prc.call(ele)
        end
        self
    end

    def my_select(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if prc.call(ele)
        end

        new_arr
    end

    def my_reject(&prc)
        new_arr = []
        self.my_select do |ele|
            new_arr << ele if !prc.call(ele)
        end

        new_arr
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end

        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end

        true
    end

    def my_flatten
        new_arr = []

        self.my_each do |ele|
            if ele.is_a?(Array)
                new_arr.concat(ele.my_flatten)
            else
                new_arr << ele
            end
        end

        new_arr
    end

    def my_zip(*args)
        new_arr = Array.new(self.length) {Array.new}

        i = 0
        while i < self.length
            new_arr[i] << self[i]
            args.map { |arg| new_arr[i] << arg[i] }

            i += 1
        end

        new_arr
    end

    def my_rotate(num=nil)
        new_arr = []

        if !num
            first = self[0]
            new_arr << self[1..-1]
            new_arr << first
        elsif num > 0 && num < self.length
            first = self[0...num]
            new_arr << self[num..-1]
            new_arr << first
        elsif num > 0 && num > self.length
            new_num = (num % self.length)
            first = self[0...new_num]
            new_arr << self[new_num..-1]
            new_arr << first
        elsif num < 0
            last = self[num..-1]
            new_arr << last
            new_arr << self[0...num]
        end

        new_arr.my_flatten
    end

    def my_join(separator=nil)
        final_str = ""

        self.each_with_index do |ele, i|
            if !separator
                final_str += ele
            else
                if i == 0
                    final_str += (ele+separator) 
                elsif i == (self.length - 1)
                    final_str += ele
                else
                    final_str += (ele+separator)
                end
            end
        end

        final_str
    end

    def my_reverse
        return self if self.length == 1

        new_arr = []

        while !self.empty?
            new_ele = self.pop
            new_arr << new_ele
        end

        new_arr
    end


end