class RenameColumnsReference < ActiveRecord::Migration[5.2]
  def change
	  rename_column :games, :users_id, :user_id
	  add_reference :games, :users, index: true

  end
end
