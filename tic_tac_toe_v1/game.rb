require_relative "board"
require_relative "human_player"

class Game
    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current_player = @player_1
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
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