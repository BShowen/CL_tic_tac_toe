require "./player.rb"
require "./game_board.rb"

puts "Lets play.\nWho wnats to be X?"
player_X = Player.new gets.chomp , 'X'
puts "Who will be O?"
player_O = Player.new gets.chomp , "O"
puts `clear`
board = GameBoard.new

loop do
    player_X.turn board.positions
    board.render_board player_X.character , player_X.position
    if board.winner_or_tie? player_X.all_positions , 'winner?'
        puts "WOOT WOOT #{player_X.name} won!"
        break
    end
    if board.winner_or_tie? 'tie?'
        puts "It\'s a tie!"
        break
    end

    player_O.turn board.positions
    board.render_board player_O.character , player_O.position
    if board.winner_or_tie? player_O.all_positions , 'winner?'
        puts "WOOT WOOT #{player_O.name} won!"
        break
    end
    if board.winner_or_tie? 'tie?'
        puts "It\'s a tie!"
        break
    end
end