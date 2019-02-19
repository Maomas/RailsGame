class DeleteIncorrectColumns < ActiveRecord::Migration[5.2]
  def change
	  remove_column :tournaments, :users_id
	  remove_column :users, :tournaments_id
  end
end
