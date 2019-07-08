require "./game_board.rb"
module Instructions
    def Instructions.intro
        game_board = GameBoard.new
        puts `clear`
        puts "Welcome to Tic-Tac-Toe".center(100)
        sleep 0.5
        puts "\nThe rules are simple. Try to get three spots in a row to win the game."
        sleep 0.5
        puts "The game board looks like this."
        sleep 0.5
        game_board.display_board
        sleep 2
        puts "\nEnter the corresponding number for the spot you want and the board will be updated."
        sleep 0.5
        puts "For example, you want spot 4. When asked, type in 4 and then the board will update to look like this."
        sleep 0.5
        game_board.populate_board_pieces("X", 4)
        game_board.display_board

    end
end
