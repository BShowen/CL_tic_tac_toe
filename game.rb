require "./player.rb"
require "./game_board.rb"

puts "Lets play.\nWho wnats to be X?"
x = Player.new gets.chomp , 'X'
puts "Who will be O?"
o = Player.new gets.chomp , "O"
board = GameBoard.new

keep_playing = true

while keep_playing

    puts "#{x.name} choose a position on the board."
    x.position = gets.chomp.to_i
    board.render_board x.character , x.position
    if board.winner? x.all_positions
        puts "WOOT WOOT #{x.name} won!"
        break
    end

    puts "#{o.name} choose a position on the board."
    o.position = gets.chomp.to_i
    board.render_board o.character , o.position
    if board.winner? o.all_positions
        puts "WOOT WOOT #{o.name} won!"
        break
    end

end