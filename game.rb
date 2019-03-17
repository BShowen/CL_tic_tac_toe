require "./player.rb"
require "./game_board.rb"

puts "Lets play.\nWho wnats to be X?"
player_X = Player.new gets.chomp , 'X'
puts "Who will be O?"
player_O = Player.new gets.chomp , "O"
puts `clear`
board = GameBoard.new

turn = Proc.new do | player |
    player.turn board.positions
    board.render_board player.character , player.position
    if board.winner_or_tie? player.all_positions , 'winner?'
        puts "WOOT WOOT #{player.name} won!"
        return 
    end
    if board.winner_or_tie? 'tie?'
        puts "It\'s a tie!"
        return
    end
end

def next_turn player , &turn 
    turn.call player
end

loop do
    next_turn player_X , &turn
    next_turn player_O , &turn
end