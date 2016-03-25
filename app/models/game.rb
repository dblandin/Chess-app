class Game < ActiveRecord::Base
  belongs_to :white_player, class_name: 'User'
  belongs_to :black_player, class_name: 'User'
  belongs_to :winner, class_name: 'User'
  has_many :pieces, dependent: :destroy

  after_create :open_seat

  def open_seat
    white_player_open = white_player_id.nil?
    black_player_open = black_player_id.nil?

    self.available = if white_player_open || black_player_open
                     end

    return 'delete this game' if white_player_open && black_player_open
    # TODO: implement delete game in sepearate method
    # then call it here. Give it optional parameter
    # to pass in an id as argument
  end
end
