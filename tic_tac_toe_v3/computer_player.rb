class ComputerPlayer
    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)
        random = rand(legal_positions.length)
        legal_positions[random]
    end
end