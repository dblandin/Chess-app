<<<<<<< HEAD
require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'Game status' do
    it 'should not have an open seat available' do
      game = Game.create(name: 'test', white_player_id: 1, black_player_id: 2)
      expect(game.open_seat?).to eq false
    end

    it 'should have an open seat available' do
      game = Game.create(name: 'test')
      expect(game.open_seat?).to eq true
=======
require 'spec_helper'

RSpec.describe Game, type: :model do
  describe 'populate gameboard' do
    it 'should create 32 pieces' do
      game = FactoryGirl.create(:game)
      expect(game.reload.pieces.count).to eq 32
>>>>>>> populate-gameboard
    end
  end
end
