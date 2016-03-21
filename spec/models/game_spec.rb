require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "Game status" do
    it "should not have an open seat available" do
      game = Game.create(name: "test", white_player_id: 1, black_player_id:2)
      expect(game.open_seat?).to eq nil
    end

    it "should have an open seat available" do
      game = Game.create(name: "test")
      expect(game.open_seat?).to eq true
    end

  end
end
