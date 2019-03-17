require "./player.rb"
require "./game_board.rb"

puts "Lets play.\nWho wnats to be X?"
player_X = Player.new gets.chomp , 'X'
puts "Who will be O?"
player_O = Player.new gets.chomp , "O"
puts `clear`
board = GameBoard.new

turn = Proc.new do | player |
    player.turn board.positions_left
    board.render_board player.character , player.position
    return if board.winner_or_tie? player.all_positions , player.name
end

def next_turn player , &turn 
    turn.call player
end

loop do
    next_turn player_X , &turn
    next_turn player_O , &turn
end