class HumanPlayer
    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position
        puts "Player #{self.mark_value} turn:"
        puts "Please enter the position as two numbers with a space between them"
        input = gets
        alphabet = ("a".."z").to_a
        
        raise "Input has too many spaces!" if input.count(" ") > 1 
        input.each_char { |char| raise "Input shouldn't include letters!" if alphabet.include?(char) }

        position = input.split(" ")
        raise "You only enter a single number!" if position.length < 2
        position
    end
end