require 'rails_helper'
RSpec.describe Queen, type: :model do
  describe "valid_move?" do
    let :game { build :game }
    let :queen { create :queen, game: game }
    it "should allow a vertical-up move" do
      queen
      
      expect(queen.valid_move?(6,4)).to eq true
      expect(queen.valid_move?(2,4)).to eq true
      expect(queen.valid_move?(6,6)).to eq true
    end

    it "does not allow an invalid move" do
      queen
      expect(queen.valid_move?(6,5)).to eq false
    end

    it "should allow a horizonal-left move" do

    end

    it "should allow a horizonal-right move" do

    end

    it "should allow a diagonal-up left move" do

    end

    it "should allow a diagonal-up right move" do

    end
end
end