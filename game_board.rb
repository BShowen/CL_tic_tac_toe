class GameBoard

    def initialize 
        @positions = [0,1,2,3,4,5,6,7,8] 
        render_board
    end

    def render_board character=nil , position=nil
        unless position == nil || character == nil
            @positions.map! do |item|
                item == position ? character : item 
            end
        end
        puts "\n #{@positions[0] } | #{@positions[1]} | #{@positions[2]} \n---|---|---\n #{@positions[3]} | #{@positions[4]} | #{@positions[5]} \n---|---|---\n #{@positions[6]} | #{@positions[7]} | #{@positions[8]}"
    end

    def winner_or_tie? player_positions , name
        solutions = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
        winner = solutions.any? do |sub_array|
            sub_array.all? do |sub_array_item|
                player_positions.include? sub_array_item
            end
        end
    
        tie = positions_left.empty? 
    
        if winner
            puts "#{name} won!"
            true
        elsif tie
            puts "Its a tie!"
            true
        else
            false
        end
    end

    def positions_left 
        @positions.select do |item|
            item.is_a? Integer
        end
    end
end