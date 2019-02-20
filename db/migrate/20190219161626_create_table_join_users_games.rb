class CreateTableJoinUsersGames < ActiveRecord::Migration[5.2]
  def change
    create_table :table_join_users_games do |t|
      t.string :users
      t.string :games
    end
  end
end
