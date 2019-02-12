class AddIsSuperColumn < ActiveRecord::Migration[5.2]
  def change
	  add_column :users, :isSuper, :boolean
  end
end
