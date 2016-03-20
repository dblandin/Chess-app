class AddToGameModel < ActiveRecord::Migration
  def change

    add_column :games, :black_player_id, :integer
    add_column :games, :white_player_id, :integer
    add_column :games, :winner_id, :integer
    add_column :games, :current_player_turn, :integer
    
    
  end
end
