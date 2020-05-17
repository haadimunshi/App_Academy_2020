class Board
    
    attr_reader :size

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](indices)
        @grid[indices.min][indices.max]
    end

    def []=(position, value)
        @grid[position.min][position.max] = value
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(position)
        if self.[](position) == :S
            self.[]=(position, :H)
            p "you sunk my battleship!"
            return true
        else
            self.[]=(position, :X)
            return false
        end
    end

    def place_random_ships
        quarter = @size / 4
        while self.num_ships < quarter
            range = (0...@grid.length)
            random_pos = [rand(range), rand(range)]
            self.[]=(random_pos, :S)
        end
    end

    def hidden_ships_grid
        new_grid = Array.new(@grid.length) {Array.new(@grid.length)}

        @grid.each_with_index do |row, i|
            row.each_with_index do |ele, j|
                if ele == :S
                    new_grid[i][j] = :N
                else
                    new_grid[i][j] = ele
                end
            end
        end

        new_grid
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

  
end
