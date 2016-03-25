class AddAvailableToGames < ActiveRecord::Migration
  def change
    add_column :games, :available, :boolean
    add_index :games, :available
  end
end
