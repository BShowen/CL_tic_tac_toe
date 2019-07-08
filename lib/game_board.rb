class GameBoard

    def initialize 
        @positions = [0,1,2,3,4,5,6,7,8] 
        @winning_solutions = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    end

    def display_board
        puts "\n\t #{@positions[0] } | #{@positions[1]} | #{@positions[2]} \n\t---|---|---\n\t #{@positions[3]} | #{@positions[4]} | #{@positions[5]} \n\t---|---|---\n\t #{@positions[6]} | #{@positions[7]} | #{@positions[8]}"
    end
    
    def populate_board_pieces(character,desired_position)
        @positions.map! do |board_square|
            board_square == desired_position ? character : board_square
        end
    end

    def winner_or_tie?(player_positions, name)
        if winner?(player_positions)
            puts "\n#{name} won!"
            true
        elsif tie?
            puts "\nIts a tie!"
            true
        else
            false
        end
    end
    
    def winner?(player_positions)
        @winning_solutions.any? do |single_solution|
            player_positions_include_a_winning_solution?(player_positions, single_solution)
        end
    end
    
    def player_positions_include_a_winning_solution?(player_positions, solution)
        solution.all? do |square|
            player_positions.include?(square)
        end
    end
    
    def tie?
        remaining_positions.empty? 
    end

    def remaining_positions 
        @positions.select do |sqaure|
            sqaure.is_a?(Integer)
        end
    end
end