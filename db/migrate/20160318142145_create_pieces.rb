class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|

      t.string :type
      t.integer :current_row_index
      t.integer :current_column_index
      t.string :color
      t.boolean :captured?
      t.integer :player_id
      t.integer :game_id

      t.timestamps
    end
  end
end
