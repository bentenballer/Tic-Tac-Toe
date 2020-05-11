class Board
    
    def initialize(n)
        @grid = Array.new(n){ Array.new(n){ "_" } }
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
        (0...@grid.length).each do |idx|
            counter = 0
            (0...@grid.length).each do |idx2|
                counter += 1 if @grid[idx2][idx] == mark
            end
            return true if counter == @grid.length
        end
        false
    end

    def win_diagonal?(mark)
        counter = 0

        (0...@grid.length).each do |idx|
            if @grid[idx][idx] == mark
                counter += 1
            end
        end

        return true if counter == @grid.length

        counter = 0

        reverse = @grid.reverse
        (0...reverse.length).each do |idx|
            if reverse[idx][idx] == mark
                counter += 1
            end
        end

        counter == @grid.length
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

    def legal_positions
        positions = []
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |column|
                positions << [row, column] if @grid[row][column] == "_"
            end
        end
        positions
    end
end





