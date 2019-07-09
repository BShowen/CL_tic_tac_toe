require "./lib/game_board.rb"

RSpec.describe GameBoard do
    let(:board) {GameBoard.new}

    context "check for winners" do
        it "returns true when winner is found" do
            expect(board.winner?([0,1,2])).to eql(true)
        end

        it "returns false when there are no winners" do
            expect(board.winner?([0,3,2])).to eql(false)
        end

    end

    context "checks for a tie" do
        it "returns false if there isnt a tie" do
            expect(board.tie?).to eql(false)
        end

        it "returns true when there is a tie" do
            board.populate_board_pieces("X",0)
            board.populate_board_pieces("X",2)
            board.populate_board_pieces("X",5)
            board.populate_board_pieces("X",6)
            board.populate_board_pieces("X",7)
            board.populate_board_pieces("Y",1)
            board.populate_board_pieces("Y",3)
            board.populate_board_pieces("Y",4)
            board.populate_board_pieces("Y",8)
            expect(board.tie?).to eql(true)
        end
    end

    context "remaining_positions" do
        it "returns array of open positions remaining" do
            expect(board.remaining_positions).to eql([0,1,2,3,4,5,6,7,8])
        end

        it "only returns non occupied positions" do
            board.populate_board_pieces("X",3)
            board.populate_board_pieces("Y",5)
            expect(board.remaining_positions).to eql([0,1,2,4,6,7,8])
        end
    end
end