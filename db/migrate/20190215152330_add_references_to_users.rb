class AddReferencesToUsers < ActiveRecord::Migration[5.2]
  def change
	  add_reference :users, :tournaments, index: true
  end
end
