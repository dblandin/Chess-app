require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe "obstructed?" do

    it "should take in arguments for a destination_x and destination_y" do
    end

    it "shouldn't allow a piece to move horizontally" do
      :horizontal_move
  #     expect(response).to eq("Sorry invalid move")
  #     expect(response).to eq(game.pieces.find_by(row:, col:))
    end

    it "shouldn't allow a piece to move vertically" do
      :vertical_move
    end

    it "shouldn't allow a piece to move diagonally" do
      :diagonal_move
    end
  end
end
