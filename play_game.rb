require "./player.rb"
require "./game_board.rb"
require "./instructions.rb"

Instructions::intro

def intro
    puts "\nLets play.\nWho wnats to be X?"
    $player_X = Player.new gets.chomp , 'X'
    puts "Who will be O?"
    $player_O = Player.new gets.chomp , "O"
    puts `clear`
    $board = GameBoard.new
end

$turn = Proc.new do | player |
    player.turn $board.positions_left
    $board.render_board player.character , player.position
    play_again if $board.winner_or_tie? player.all_positions , player.name
end

def my_turn player , &block
    block.call player
end

def play_one_round
    intro 
    loop do
        my_turn $player_X , &$turn
        my_turn $player_O , &$turn
    end
end

def play_again
    sleep 1
    puts "\nWant to play again? Y/N"
    reply = gets.chomp.upcase
    if reply == "Y"
        play_one_round
    else
        puts `clear`
        puts "\nThanks for playing!"
        exit 
    end
end

play_one_round