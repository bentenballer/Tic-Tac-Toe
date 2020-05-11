class Board
    
    def initialize
        @grid = Array.new(3){ Array.new(3){ "_" } }
    end

    def valid?(position)
        row = position[0] >= 0 && position[0] < @grid.length
        column = position[1] >= 0 && position[1] < @grid.length
        row && column
    end

    def empty?(position)
        @grid[position[0]][position[1]] == "_"
    end

    def place_mark(position, mark)
        if !self.valid?(position) || !self.empty?(position)
            raise "Position is invalid or already take!"
        else
            @grid[position[0]][position[1]] = mark
        end
    end

    def print
        @grid.each { |row| p row }
    end

    def win_row?(mark)
        @grid.each { |row| return true if row.all? { |ele| ele == mark } }
        false
    end

    def win_col?(mark)
        (0...@grid.length).each { |idx| return true if @grid[0][idx] == mark && @grid[1][idx] == mark && @grid[2][idx] == mark }
        false
    end

    def win_diagonal?(mark)
        corner = 0
        return true if @grid[corner][corner] == mark && @grid[corner+1][corner+1] == mark && @grid[corner+2][corner+2] == mark

        reverse = @grid.reverse
        return true if reverse[corner][corner] == mark && reverse[corner+1][corner+1] == mark && reverse[corner+2][corner+2] == mark

        false
    end

    def win?(mark)
        if self.win_col?(mark) || self.win_row?(mark) || self.win_diagonal?(mark)
            return true
        end
        false
    end

    def empty_positions?
        @grid.each { |row| return true if row.include?("_") }
        false
    end
end





