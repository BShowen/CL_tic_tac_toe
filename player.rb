class Player
    attr_reader :name, :character, :position, :all_positions

    def initialize name, character
        @name = name
        @character = character
        @position = nil
        @all_positions = []
    end

    def position=(number)
        @position = number
        store_position
    end

    def turn 
        # This is a loop because I am not done defining this method. This method (soon) will verify that the user has entered the correct input. If the user enters an undesired input then it will be ingored and this loop will start over, until they have entered the desired input. This will be implemented later on when im posotive that I will be keeping this method. For now this method works perfectly for my testing. 
        @my_turn = true
        while @my_turn 
            puts "#{self.name}, choose a position on the board."
            self.position = gets.chomp.to_i
            puts `clear`
            @my_turn = !@my_turn 
        end
    end

    private
    def store_position
        @all_positions << @position
        @all_positions.sort!
    end
end