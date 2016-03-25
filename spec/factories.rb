
# Game class
FactoryGirl.define do
  factory :game do
    name "New Game"
    black_player_id 1
    white_player_id 1 
    current_player_turn_id nil
  end

end
# Piece class
# FactoryGirl.define do
#   factory :piece do
#     type nil
#     color nil
#     current_row_index 1
#     current_column_index 1
#   end
# end