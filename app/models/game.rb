class Game < ActiveRecord::Base
  belongs_to :white_player, class_name: 'User'
  belongs_to :black_player, class_name: 'User'
  belongs_to :winner, class_name: 'User'
  has_many :pieces

  def open_seat?
    white_player_id.nil? || black_player_id.nil?
  end

end
