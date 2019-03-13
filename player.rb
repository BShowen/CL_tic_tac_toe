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

    private
    def store_position
        @all_positions << @position
        @all_positions.sort!
    end
end