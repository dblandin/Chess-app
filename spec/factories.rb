FactoryGirl.define do
  factory :game do
    name 'New Game'
    black_player_id 1
    white_player_id 1
    current_player_turn_id nil
  end
end
