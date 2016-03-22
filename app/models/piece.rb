class Piece < ActiveRecord::Base

  belongs_to :game
  belongs_to :user, class_name: 'User'

  def obstructed?(destination_x, destination_y)
  end

end
