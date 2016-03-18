class AddFieldsToUsersModel < ActiveRecord::Migration
  def change

    add_column :users, :name, :string
    add_column :users, :avatar, :string
    add_column :users, :games_won, :integer
  end
end
