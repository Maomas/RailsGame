class AddUserToTournaments < ActiveRecord::Migration[5.2]
  def change
    add_reference :tournaments, :user, index: true
    add_reference :users, :tournament, index: true

  end
end
