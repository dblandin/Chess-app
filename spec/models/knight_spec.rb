require 'rails_helper'
RSpec.describe Knight, type: :model do
  describe 'valid_move?' do
    it 'should return true for valid_move if theres an empty destination spot' do
      game = FactoryGirl.create(:game)
      # Select white knight from the board
      white_knight = game.pieces.find_by_current_row_index_and_current_column_index(0,1)
      expect(white_knight.valid_move?(2, 2)).to eq true
    end

    it 'should return false for valid_move if theres a piece with same color' do
      game = FactoryGirl.create(:game)
      white_knight = game.pieces.find_by_current_row_index_and_current_column_index(0,1)
      white_pawn = game.pieces.find_by_current_row_index_and_current_column_index(1,3)
      expect(white_knight.valid_move?(1,3)).to eq false
      # Should return false as there is an existing same color piece in the destination square
    end

    it 'should return false for valid_move if piece move is invalid' do
      game = FactoryGirl.create(:game)
      white_knight = game.pieces.find_by_current_row_index_and_current_column_index(0, 1)
      expect(white_knight.valid_move?(0, 2)).to eq false
      # Should return false as a knight cannot move to one adjacent square
    end

    it 'should return true for valid_move if theres a piece with different color' do
      game = FactoryGirl.create(:game)
      # Select white knight from the board
      white_knight = game.pieces.find_by_current_row_index_and_current_column_index(0, 1)
      

    end
  end
end