class AddReferenceToGame < ActiveRecord::Migration[5.2]
  def change
	  add_reference :games, :users, index: true
  end
end
