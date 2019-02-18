class AddReferencesToTournament < ActiveRecord::Migration[5.2]
  def change
	  add_reference :tournaments, :users, index: true
  end
end
