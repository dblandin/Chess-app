require 'rails_helper'
RSpec.describe Piece, type: :model do
  describe 'obstructed?' do
    it 'returns true for horizontal-right obstructions' do
      game = FactoryGirl.create(:game) # Would do this using FactoryGirl
      piece1 = FactoryGirl.create(:piece, game: game, current_row_index: 1, current_column_index: 1)
      FactoryGirl.create(:piece, game: game, current_row_index: 1, current_column_index: 2)

      expect(piece1.obstructed?(1, 3)).to eq true
      # it is obstructed because there is a piece in position row: 1, col: 2
    end

    it 'returns true for horizontal-left obstructions' do
      game = FactoryGirl.create(:game) # Would do this using FactoryGirl
      piece1 = FactoryGirl.create(:piece, game: game, current_row_index: 1, current_column_index: 3)
      FactoryGirl.create(:piece, game: game, current_row_index: 1, current_column_index: 2)

      expect(piece1.obstructed?(1, 1)).to eq true
      # it is obstructed because there is a piece in position row: 1, col: 2
    end

    it 'returns false for pieces with no vertical inbetween' do
      game = FactoryGirl.create(:game) # Would do this using FactoryGirl
      piece = game.pieces.find_by_current_row_index_and_current_column_index(0, 0)
      piece2 = game.pieces.find_by_current_row_index_and_current_column_index(1, 0)

      expect(piece.obstructed?(1, 0)).to eq false
      # it is obstructed because there is a piece in position row: 1, col: 2
    end

    it 'returns false for pieces with no diagnal inbetween' do
      game = FactoryGirl.create(:game) # Would do this using FactoryGirl
      piece = game.pieces.find_by_current_row_index_and_current_column_index(0, 0)
      piece2 = game.pieces.find_by_current_row_index_and_current_column_index(1, 1)

      expect(piece.obstructed?(1, 1)).to eq false
      # it is obstructed because there is a piece in position row: 1, col: 2
    end

    it 'returns false for pieces with no horizontal inbetween' do
      game = FactoryGirl.create(:game) # Would do this using FactoryGirl
      piece = game.pieces.find_by_current_row_index_and_current_column_index(0, 0)
      piece2 = game.pieces.find_by_current_row_index_and_current_column_index(0, 1)

      expect(piece.obstructed?(0, 1)).to eq false
      # it is obstructed because there is a piece in position row: 1, col: 2
    end

    it 'returns true for vertical-down obstructions' do
      game = FactoryGirl.create(:game) # Would do this using FactoryGirl
      piece1 = FactoryGirl.create(:piece, game: game, current_row_index: 1, current_column_index: 1)
      FactoryGirl.create(:piece, game: game, current_row_index: 2, current_column_index: 1)

      expect(piece1.obstructed?(3, 1)).to eq true
      # it is obstructed because there is a piece in position row: 2, col: 1
    end

    it 'returns true for vertical-up obstructions' do
      game = FactoryGirl.create(:game) # Would do this using FactoryGirl
      piece1 = FactoryGirl.create(:piece, game: game, current_row_index: 3, current_column_index: 1)
      FactoryGirl.create(:piece, game: game, current_row_index: 2, current_column_index: 1)

      expect(piece1.obstructed?(1, 1)).to eq true
      # it is obstructed because there is a piece in position row: 2, col: 1
    end

    it 'returns true for diagonal-down-right obstructions' do
      game = FactoryGirl.create(:game) # Would do this using FactoryGirl
      piece1 = FactoryGirl.create(:piece, game: game, current_row_index: 1, current_column_index: 1)
      FactoryGirl.create(:piece, game: game, current_row_index: 2, current_column_index: 2)

      expect(piece1.obstructed?(3, 3)).to eq true
      # it is obstructed because there is a piece in position row: 2, col: 2
    end

    it 'returns true for diagonal-up-left obstructions' do
      game = FactoryGirl.create(:game) # Would do this using FactoryGirl
      piece1 = FactoryGirl.create(:piece, game: game, current_row_index: 3, current_column_index: 3)
      FactoryGirl.create(:piece, game: game, current_row_index: 2, current_column_index: 2)

      expect(piece1.obstructed?(1, 1)).to eq true
      # it is obstructed because there is a piece in position row: 2, col: 2
    end

    it 'returns true for diagonal-down-left obstructions' do
      game = FactoryGirl.create(:game) # Would do this using FactoryGirl
      piece1 = FactoryGirl.create(:piece, game: game, current_row_index: 1, current_column_index: 3)
      FactoryGirl.create(:piece, game: game, current_row_index: 2, current_column_index: 2)

      expect(piece1.obstructed?(3, 1)).to eq true
      # it is obstructed because there is a piece in position row: 2, col: 2
    end

    it 'returns true for diagonal-up-right obstructions' do
      game = FactoryGirl.create(:game) # Would do this using FactoryGirl
      piece1 = FactoryGirl.create(:piece, game: game, current_row_index: 3, current_column_index: 1)
      FactoryGirl.create(:piece, game: game, current_row_index: 2, current_column_index: 2)

      expect(piece1.obstructed?(1, 3)).to eq true
      # it is obstructed because there is a piece in position row: 2, col: 2
    end

    it 'returns true for invalid input' do
      game = FactoryGirl.create(:game) # Would do this using FactoryGirl
      piece1 = FactoryGirl.create(:piece, game: game, current_row_index: 3, current_column_index: 1)
      FactoryGirl.create(:piece, game: game, current_row_index: 2, current_column_index: 2)

      expect(piece1.obstructed?(100, 300)).to eq true
      # it raises an error because there is an invalid input. There is no row: 100, col: 300
    end

    it 'returns true for invalid destination' do
      game = FactoryGirl.create(:game) # Would do this using FactoryGirl
      piece1 = FactoryGirl.create(:piece, game: game, current_row_index: 1, current_column_index: 1)
      FactoryGirl.create(:piece, game: game, current_row_index: 2, current_column_index: 2)

      expect(piece1.obstructed?(2, 2)).to eq true
      # it raises an error because there is a piece in the destination.
    end
  end

  describe 'move_to!' do

    it 'moves the piece if the spot is empty' do
      game = FactoryGirl.create(:game)
      piece = game.pieces.find_by_current_row_index_and_current_column_index(1, 0)
      piece.move_to!(2,0)
      expect(piece.current_row_index).to eq 2
      expect(piece.current_column_index).to eq 0
    end

    it 'moves the piece if the spot is taken with an opposite color' do
      game = FactoryGirl.create(:game)
      white_pawn = game.pieces.find_by_current_row_index_and_current_column_index(1, 0)
      black_pawn = game.pieces.find_by_current_row_index_and_current_column_index(6, 0)
      # Move black pawn to be infront of the white pawn
      black_pawn.update_attributes(current_row_index: 2, current_column_index: 0)
      expect(white_pawn.obstructed?(2,0)).to eq false # But getting true due to obstructed? method not being done correctly
      # Move the pawn to the spot the black pawn is currently in
      white_pawn.move_to!(2,0)
      # Check to make sure the piece is in the right spot
      expect(white_pawn.current_row_index).to eq 2
      expect(white_pawn.current_column_index).to eq 0
    end

    # it 'doesnt move the piece to the new location' do
    #
    # end

    # it 'returns true for existing piece in destination' do
    #   game = FactoryGirl.create(:game) # Would do this using FactoryGirl
    #   piece1 = game.pieces.find_by_current_row_index_and_current_column_index(0, 0)
    #
    #   expect(piece1.spot_taken?(0, 1)).to eq true
    #   # it raises an error because there is a piece in the destination.
    # end
    #
    # it 'returns true for opposing color piece in destination' do
    #   game = FactoryGirl.create(:game) # Would do this using FactoryGirl
    #   piece1 = FactoryGirl.create(:piece, game: game, current_row_index: 1, current_column_index: 1, color: 'black')
    #   FactoryGirl.create(:piece, game: game, current_row_index: 2, current_column_index: 2, color: 'white')
    #
    #   expect(piece1.move_to!(2, 2)).to eq true
    #   # it returns true because a piece should be able to take an opposing piece's destination.
    # end
    #
    # it 'returns false for same color piece in destination' do
    #   game = FactoryGirl.create(:game) # Would do this using FactoryGirl
    #   piece1 = game.pieces.find_by_current_row_index_and_current_column_index(0, 0)
    #   piece2 = game.pieces.find_by_current_row_index_and_current_column_index(0, 1)
    #   expect(piece1.color).to eq piece2.color
    #   # it returns false and raises an error because a piece should not be able to move to a destination where another same color piece exists.
    # end
    #
    # it 'should call update_attributes on the piece when move is allowed' do
    #   game = FactoryGirl.create(:game) # Would do this using FactoryGirl
    #   piece1 = FactoryGirl.create(:piece, game: game, current_row_index: 1, current_column_index: 1, color: 'black')
    #   FactoryGirl.create(:piece, game: game, current_row_index: 2, current_column_index: 2, color: 'white')
    #   piece1.move_to!(2, 2)
    #   piece1.reload
    #
    #   expect(piece1.current_column_index).to eq(2)
    #   expect(piece1.current_row_index).to eq(2)
    #
    #   # it should update the piece's current_column_index and current_row_index values in the database.
    # end
  end
end
