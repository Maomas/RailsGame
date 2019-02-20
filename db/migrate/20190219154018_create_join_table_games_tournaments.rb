class CreateJoinTableGamesTournaments < ActiveRecord::Migration[5.2]
  def change
    create_join_table :games, :tournaments do |t|
      # t.index [:game_id, :tournament_id]
      # t.index [:tournament_id, :game_id]
    end
  end
end
