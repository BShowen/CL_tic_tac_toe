require "./game_board.rb"
module Instructions
    def Instructions.intro
        game_board = GameBoard.new
        puts `clear`
        puts "Welcome to Tic-Tac-Toe".center(100)
        puts "\nThe rules are simple. Try to get three spots in a row to win the game."
        puts "The game board looks like this."
        game_board.render_board
        puts "\nEnter the corresponding number for the spot you want and the board will be updated."
        puts "For example, you want spot 4. When asked, type in 4 and then the board will update to look like this."
        game_board.render_board "X" , 4

    end
end