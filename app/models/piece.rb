class Piece < ActiveRecord::Base
  belongs_to :game
  belongs_to :user, class_name: 'User'
end
