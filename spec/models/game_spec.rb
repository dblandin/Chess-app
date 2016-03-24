require 'rails_helper'

RSpec.describe Game, type: :model do

  describe 'add_pawns' do
    it 'should create 8 pawns' do
      game = FactoryGirl.create(:game)
      expect(game.pieces.count).to eq 0
      game.add_pawns
      expect(game.pieces.count).to eq 8
      #expect(game.pieces.pluck(:type).uniq).to eq([pawn])

    end
  end

  
end

