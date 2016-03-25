require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'status' do
    it 'should not have an open seat available if both players present' do
      game = Game.create(name: 'test', white_player_id: 1, black_player_id: 2)
      game.open_seat
      expect(game.available).to eq false
    end

    it 'should have an open seat available with white_player current' do
      game = Game.create(name: 'test', white_player_id: 1)
      game.open_seat
      expect(game.available).to eq true
    end

    it 'should have an open seat available with white_player current' do
      game = Game.create(name: 'test', black_player_id: 1)
      expect(game.available).to eq true
    end

    it 'should destroy the game if no players present' do
      game = Game.create(name: 'test')
      deleted = game.open_seat

      # TODO: implment test for deleting game
      expect(deleted).to eq('delete this game')
    end
  end
end
