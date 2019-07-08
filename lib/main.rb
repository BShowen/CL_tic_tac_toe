require "./player.rb"
require "./game_board.rb"
require "./instructions.rb"

Instructions::intro

def set_players
    puts "Who wnats to be X?"
    $player_X = Player.new(gets.chomp , 'X')
    puts "Who will be O?"
    $player_O = Player.new(gets.chomp , "O")
    puts `clear`
    $board = GameBoard.new
    $board.display_board
end

$turn = Proc.new do | player |
    player.turn($board.remaining_positions)
    $board.populate_board_pieces(player.character, player.position)
    $board.display_board
    play_again if $board.winner_or_tie?(player.all_positions , player.name)
end

def start_turn(player , &block)
    block.call(player)
end

def play_one_round
    set_players 
    loop do
        start_turn($player_X, &$turn)
        start_turn($player_O, &$turn)
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