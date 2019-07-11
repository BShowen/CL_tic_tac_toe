require "./lib/game_board.rb"

RSpec.describe GameBoard do

    before(:each) do
        subject {GameBoard.new}
    end

    def fill_board_with_no_winners
        subject.populate_board_pieces("X",0)
        subject.populate_board_pieces("X",2)
        subject.populate_board_pieces("X",5)
        subject.populate_board_pieces("X",6)
        subject.populate_board_pieces("X",7)
        subject.populate_board_pieces("Y",1)
        subject.populate_board_pieces("Y",3)
        subject.populate_board_pieces("Y",4)
        subject.populate_board_pieces("Y",8)
    end

    context "check for winners" do
        it "returns true when winner is found" do
            expect(subject.winner?([0,1,2])).to eql(true)
        end

        it "returns false when there are no winners" do
            expect(subject.winner?([0,3,2])).to eql(false)
        end
    end

    context "checks for a tie" do
        it "returns false if there isnt a tie" do
            expect(subject.tie?).to eql(false)
        end

        it "returns true when there is a tie" do
            fill_board_with_no_winners

            expect(subject.tie?).to eql(true)
        end
    end

    context "remaining_positions" do
        it "returns array of open positions remaining" do
            expect(subject.remaining_positions).to eql([0,1,2,3,4,5,6,7,8])
        end

        it "only returns non occupied positions" do
            subject.populate_board_pieces("X",3)
            subject.populate_board_pieces("Y",5)
            expect(subject.remaining_positions).to eql([0,1,2,4,6,7,8])
        end
    end
end