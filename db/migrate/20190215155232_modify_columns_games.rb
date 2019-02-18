class ModifyColumnsGames < ActiveRecord::Migration[5.2]
  def change
	  remove_column :games, :user_id
	  remove_column :games, :users_id
  end
end
