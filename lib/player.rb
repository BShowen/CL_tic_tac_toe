class Player
    attr_reader :name, :character, :position, :all_positions

    def initialize(name, character)
        @name = name
        @character = character
        @position = nil
        @all_positions = []
        @player_input = nil
    end

    def position=(number)
        @position = number
        store_position
    end

    def turn(remaining_open_positions)
        puts "\n#{self.name}, choose a position on the board."
        begin
            solicit_input_from_human
            raise unless position_is_taken?(remaining_open_positions)
        rescue
            if @player_input != nil
                puts "\nThat spot is already taken. Try again."
                @player_input = nil
                retry
            else
                puts "\nThats not a number. Try again."
                retry
            end
        else
            self.position = @player_input
            puts `clear`
        end
    end

    def solicit_input_from_human
        @player_input = gets.chomp.match(/^\d/)[0].to_i
    end

    def position_is_taken?(remaining_open_positions)
        remaining_open_positions.include?(@player_input)
    end

    private
    def store_position
        @all_positions << @position
        @all_positions.sort!
    end
end