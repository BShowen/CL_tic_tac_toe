require "./player.rb"
require "./game_board.rb"

puts "Lets play.\nWho wnats to be X?"
player_X = Player.new gets.chomp , 'X'
puts "Who will be O?"
player_O = Player.new gets.chomp , "O"
puts `clear`
board = GameBoard.new

keep_playing = true

while keep_playing
    player_X.turn
    board.render_board player_X.character , player_X.position
    if board.winner? player_X.all_positions
        puts "WOOT WOOT #{player_X.name} won!"
        break
    end

    player_O.turn
    board.render_board player_O.character , player_O.position
    if board.winner? player_O.all_positions
        puts "WOOT WOOT #{player_O.name} won!"
        break
    end

    # puts "#{player_X.name}, choose a position on the board."
    # player_X.position = gets.chomp.to_i
    # puts `clear`
    # board.render_board player_X.character , player_X.position
    # if board.winner? player_O.all_positions
    #     puts "WOOT WOOT #{player_O.name} won!"
    #     break
    # end

    # puts "#{player_O.name}, choose a position on the board."
    # player_O.position = gets.chomp.to_i
    # puts `clear`
    # board.render_board player_O.character , player_O.position
    # if board.winner? player_O.all_positions
    #     puts "WOOT WOOT #{player_O.name} won!"
    #     break
    # end
end
