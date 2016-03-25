require 'spec_helper'

RSpec.describe Game, type: :model do

  describe 'add_pawns' do
    it 'should create 8 pawns' do
      game = FactoryGirl.create(:game)
      expect(game.pieces.count).to eq 0
      game.add_pawns
      expect(game.pieces.count).to eq 8
      expect(game.pieces.pluck(:type).uniq).to eq(['Pawn'])
      expect(game.pieces.pluck(:current_row_index)
        .uniq).to eq([6])
      expect(game.pieces.pluck(:current_column_index)
        .uniq).to eq([0,1,2,3,4,5,6,7])
    end
  end

  describe 'add_rooks' do
    it 'should create 2 rooks' do
      game = FactoryGirl.create(:game)
      expect(game.pieces.count).to eq 0
      game.add_rooks
      expect(game.pieces.count).to eq 2
      expect(game.pieces.pluck(:type).uniq).to eq(['Rook'])
      expect(game.pieces.pluck(:current_row_index).uniq).to eq([7])
      expect(game.pieces.pluck(:current_column_index).uniq).to eq([0,7])
    end
  end

  describe 'add_knights' do
    it 'should create 2 knights' do
      game = FactoryGirl.create(:game)
      expect(game.pieces.count).to eq 0
      game.add_knights
      expect(game.pieces.count).to eq 2
      expect(game.pieces.pluck(:type).uniq).to eq(['Knight'])
      expect(game.pieces.pluck(:current_row_index).uniq).to eq([7])
      expect(game.pieces.pluck(:current_column_index).uniq).to eq([1,6])

    end
  end

  describe 'add_bishops' do
    it 'should create 2 bishops' do
      game = FactoryGirl.create(:game)
      expect(game.pieces.count).to eq 0
      game.add_bishops
      expect(game.pieces.count).to eq 2
      expect(game.pieces.pluck(:type).uniq).to eq(['Bishop'])
      expect(game.pieces.pluck(:current_row_index).uniq).to eq([7])
      expect(game.pieces.pluck(:current_column_index).uniq).to eq([2,5])


    end
  end

  describe 'add_queen' do
      it 'should create 1 queen' do
      game = FactoryGirl.create(:game)
      expect(game.pieces.count).to eq 0
      game.add_queen
      expect(game.pieces.count).to eq 1
      expect(game.pieces.pluck(:type).uniq).to eq(['Queen'])
      expect(game.pieces.pluck(:current_row_index).uniq).to eq([7])
      expect(game.pieces.pluck(:current_column_index).uniq).to eq([4])


    end

  end

  describe 'add_king' do
    it 'should create 1 king' do
      game = FactoryGirl.create(:game)
      expect(game.pieces.count).to eq 0
      game.add_king
      expect(game.pieces.count).to eq 1
      expect(game.pieces.pluck(:type).uniq).to eq(['King'])
      expect(game.pieces.pluck(:current_row_index).uniq).to eq([7])
      expect(game.pieces.pluck(:current_column_index).uniq).to eq([3])

    end

  end
  
end

