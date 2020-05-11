require_relative "board"
require_relative "human_player"

class Game
    def initialize(size, *players)
        @players = players.map { |player| HumanPlayer.new(player) }
        @board = Board.new(size)
        @current_player = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play
        while @board.empty_positions?

            @board.print
            puts 

            position = @current_player.get_position
            position = position.map { |ele| ele.to_i }
            @board.place_mark(position, @current_player.mark_value)

            if @board.win?(@current_player.mark_value)
                puts "Player #{@current_player.mark_value} won!"
                return
            else
                self.switch_turn
            end

        end
        puts "This game is a draw!"
    end

end