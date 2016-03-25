require 'spec_helper'

RSpec.describe Game, type: :model do

  describe 'populate gameboard' do
    it 'should create 32 pieces' do 
        Game = FactoryGirl.create(:game)
        #expect(game.pieces.count).to eq 0
        populate_board!
        expect(game.pieces.count).to eq 32

    end
  end

  # describe 'add_pawns_black' do
  #   it 'should create 8 black pawns' do
  #     game = FactoryGirl.create(:game)
  #     expect(game.pieces.count).to eq 0
  #     game.add_pawns_black
  #     expect(game.pieces.count).to eq 8
  #     expect(game.pieces.pluck(:color)
  #       .uniq).to eq(['black'])
  #     expect(game.pieces.pluck(:type).uniq).to eq(['Pawn'])
  #     expect(game.pieces.pluck(:current_row_index)
  #       .uniq).to eq([6])
  #     expect(game.pieces.pluck(:current_column_index)
  #       .uniq).to eq([0,1,2,3,4,5,6,7])
  #   end
  # end

  # describe 'add_pawns_white' do
  #   it 'should create 8 white pawns' do
  #     game = FactoryGirl.create(:game)
  #     expect(game.pieces.count).to eq 0
  #     game.add_pawns_white
  #     expect(game.pieces.count).to eq 8
  #     expect(game.pieces.pluck(:color)
  #       .uniq).to eq(['white'])
  #     expect(game.pieces.pluck(:type).uniq).to eq(['Pawn'])
  #     expect(game.pieces.pluck(:current_row_index)
  #       .uniq).to eq([1])
  #     expect(game.pieces.pluck(:current_column_index)
  #       .uniq).to eq([0,1,2,3,4,5,6,7])
  #   end
  # end

  # describe 'add_rooks_black' do
  #   it 'should create 2 black rooks' do
  #     game = FactoryGirl.create(:game)
  #     expect(game.pieces.count).to eq 0
  #     game.add_rooks_black
  #     expect(game.pieces.count).to eq 2
  #     expect(game.pieces.pluck(:color)
  #       .uniq).to eq(['black'])
  #     expect(game.pieces.pluck(:type).uniq).to eq(['Rook'])
  #     expect(game.pieces.pluck(:current_row_index).uniq).to eq([7])
  #     expect(game.pieces.pluck(:current_column_index).uniq).to eq([0,7])
  #   end
  # end


  # describe 'add_rooks_white' do
  #   it 'should create 2 white rooks' do
  #     game = FactoryGirl.create(:game)
  #     expect(game.pieces.count).to eq 0
  #     game.add_rooks_white
  #     expect(game.pieces.count).to eq 2
  #     expect(game.pieces.pluck(:color)
  #       .uniq).to eq(['white'])
  #     expect(game.pieces.pluck(:type).uniq).to eq(['Rook'])
  #     expect(game.pieces.pluck(:current_row_index).uniq).to eq([0])
  #     expect(game.pieces.pluck(:current_column_index).uniq).to eq([0,7])
  #   end
  # end
  # describe 'add_knights_black' do
  #   it 'should create 2 black knights' do
  #     game = FactoryGirl.create(:game)
  #     expect(game.pieces.count).to eq 0
  #     game.add_knights_black
  #     expect(game.pieces.count).to eq 2
  #     expect(game.pieces.pluck(:color)
  #       .uniq).to eq(['black'])
  #     expect(game.pieces.pluck(:type).uniq).to eq(['Knight'])
  #     expect(game.pieces.pluck(:current_row_index).uniq).to eq([7])
  #     expect(game.pieces.pluck(:current_column_index).uniq).to eq([1,6])

  #   end
  # end

  # describe 'add_knights_white' do
  #   it 'should create 2 white knights' do
  #     game = FactoryGirl.create(:game)
  #     expect(game.pieces.count).to eq 0
  #     game.add_knights_white
  #     expect(game.pieces.count).to eq 2
  #     expect(game.pieces.pluck(:color)
  #       .uniq).to eq(['white'])
  #     expect(game.pieces.pluck(:type).uniq).to eq(['Knight'])
  #     expect(game.pieces.pluck(:current_row_index).uniq).to eq([0])
  #     expect(game.pieces.pluck(:current_column_index).uniq).to eq([1,6])

  #   end
  # end

  # describe 'add_bishops_black' do
  #   it 'should create 2 black bishops' do
  #     game = FactoryGirl.create(:game)
  #     expect(game.pieces.count).to eq 0
  #     game.add_bishops_black
  #     expect(game.pieces.count).to eq 2
  #     expect(game.pieces.pluck(:color)
  #       .uniq).to eq(['black'])
  #     expect(game.pieces.pluck(:type).uniq).to eq(['Bishop'])
  #     expect(game.pieces.pluck(:current_row_index).uniq).to eq([7])
  #     expect(game.pieces.pluck(:current_column_index).uniq).to eq([2,5])
  #   end
  # end

  # describe 'add_bishops_white' do
  #   it 'should create 2 white bishops' do
  #     game = FactoryGirl.create(:game)
  #     expect(game.pieces.count).to eq 0
  #     game.add_bishops_white
  #     expect(game.pieces.count).to eq 2
  #     expect(game.pieces.pluck(:color)
  #       .uniq).to eq(['white'])
  #     expect(game.pieces.pluck(:type).uniq).to eq(['Bishop'])
  #     expect(game.pieces.pluck(:current_row_index).uniq).to eq([0])
  #     expect(game.pieces.pluck(:current_column_index).uniq).to eq([2,5])
  #   end
  # end

  # describe 'add_queen_black' do
  #     it 'should create 1 black queen' do
  #     game = FactoryGirl.create(:game)
  #     expect(game.pieces.count).to eq 0
  #     game.add_queen_black
  #     expect(game.pieces.count).to eq 1
  #     expect(game.pieces.pluck(:color)
  #       .uniq).to eq(['black'])
  #     expect(game.pieces.pluck(:type).uniq).to eq(['Queen'])
  #     expect(game.pieces.pluck(:current_row_index).uniq).to eq([7])
  #     expect(game.pieces.pluck(:current_column_index).uniq).to eq([4])
  #   end
  # end

  # describe 'add_queen_white' do
  #     it 'should create 1 white queen' do
  #     game = FactoryGirl.create(:game)
  #     expect(game.pieces.count).to eq 0
  #     game.add_queen_white
  #     expect(game.pieces.count).to eq 1
  #     expect(game.pieces.pluck(:color)
  #       .uniq).to eq(['white'])
  #     expect(game.pieces.pluck(:type).uniq).to eq(['Queen'])
  #     expect(game.pieces.pluck(:current_row_index).uniq).to eq([0])
  #     expect(game.pieces.pluck(:current_column_index).uniq).to eq([4])
  #   end
  # end

  # describe 'add_king_black' do
  #   it 'should create 1 black king' do
  #     game = FactoryGirl.create(:game)
  #     expect(game.pieces.count).to eq 0
  #     game.add_king_black
  #     expect(game.pieces.count).to eq 1
  #     expect(game.pieces.pluck(:color)
  #       .uniq).to eq(['black'])
  #     expect(game.pieces.pluck(:type).uniq).to eq(['King'])
  #     expect(game.pieces.pluck(:current_row_index).uniq).to eq([7])
  #     expect(game.pieces.pluck(:current_column_index).uniq).to eq([3])
  #   end
  # end

  # describe 'add_king_white' do
  #   it 'should create 1 white king' do
  #     game = FactoryGirl.create(:game)
  #     expect(game.pieces.count).to eq 0
  #     game.add_king_white
  #     expect(game.pieces.count).to eq 1
  #     expect(game.pieces.pluck(:color)
  #       .uniq).to eq(['white'])
  #     expect(game.pieces.pluck(:type).uniq).to eq(['King'])
  #     expect(game.pieces.pluck(:current_row_index).uniq).to eq([0])
  #     expect(game.pieces.pluck(:current_column_index).uniq).to eq([3])
  #   end
  # end
  
end

