class UpdateCurrentPlayerTurnColumn < ActiveRecord::Migration
  def change

    rename_column :games, :current_player_turn, :current_player_turn_id
  end
end
