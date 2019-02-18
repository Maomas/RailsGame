class AddIndexBetweenUsersAndGames < ActiveRecord::Migration[5.2]
  def change
	  add_reference :games, :user, index: true
	  add_reference :users, :game, index: true
  end
end
