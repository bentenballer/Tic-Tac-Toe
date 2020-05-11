class HumanPlayer
    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)
        puts "Player #{self.mark_value} turn:"
        p "Valid positions: #{legal_positions}"
        puts
        puts "Please enter the position as two numbers with a space between them: "
        input = gets
        position = input.split(" ").map{ |ele| ele.to_i }
        
        while !legal_positions.include?(position)
            puts "Please choose a valid position, and enter the position as two numbers with a space between them: "
            input = gets
            position = input.split(" ").map{ |ele| ele.to_i }
        end

        position
    end
end