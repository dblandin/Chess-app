class ChangePlayerIdToUserIdInPieces < ActiveRecord::Migration
  def change
    rename_column :pieces, :player_id, :user_id
  end
end
