class GameBoard

    def initialize 
        @positions = [0,1,2,3,4,5,6,7,8] 
        # display_board
    end

    def display_board
        puts "\n\t #{@positions[0] } | #{@positions[1]} | #{@positions[2]} \n\t---|---|---\n\t #{@positions[3]} | #{@positions[4]} | #{@positions[5]} \n\t---|---|---\n\t #{@positions[6]} | #{@positions[7]} | #{@positions[8]}"
    end
    
    def populate_board_pieces(character,desired_position)
        @positions.map! do |board_square|
            board_square == desired_position ? character : board_square
        end
    end

    def winner_or_tie?(player_positions , name)
        solutions = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
        winner = solutions.any? do |sub_array|
            sub_array.all? do |sub_array_item|
                player_positions.include?(sub_array_item)
            end
        end
    
        tie = remaining_positions.empty? 
    
        if winner
            puts "\n#{name} won!"
            true
        elsif tie
            puts "\nIts a tie!"
            true
        else
            false
        end
    end

    def remaining_positions 
        @positions.select do |sqaure|
            sqaure.is_a?(Integer)
        end
    end
end