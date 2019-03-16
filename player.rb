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

    def turn remaining_positions
        puts "#{self.name}, choose a position on the board."
        begin
            reply = gets.chomp.match(/^\d/)[0]
            unless remaining_positions.include? reply.to_i
                raise
            end
        rescue
            if reply
                puts "That spot is already taken. Try again."
                reply = nil
                retry
            else
                puts "Thats not a number. Try again."
                retry
            end
        else
            self.position = reply.to_i
            puts `clear`
        end
    end

    private
    def store_position
        @all_positions << @position
        @all_positions.sort!
    end
end