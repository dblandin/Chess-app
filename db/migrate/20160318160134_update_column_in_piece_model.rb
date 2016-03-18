class UpdateColumnInPieceModel < ActiveRecord::Migration
  def change

    rename_column :pieces, :captured?, :captured
  end
end
