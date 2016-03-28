class Game < ActiveRecord::Base
  belongs_to :white_player, class_name: 'User'
  belongs_to :black_player, class_name: 'User'
  belongs_to :winner, class_name: 'User'
  has_many :pieces, dependent: :destroy

  # Ready to get set up for Ajax Requests
  def self.open_seats
    games_available = Game.where( "white_player_id = ? or black_player_id = ?", nil, nil, limit: 10)
    return games_available
  end
end
