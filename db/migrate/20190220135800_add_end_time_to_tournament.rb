class AddEndTimeToTournament < ActiveRecord::Migration[5.2]
  def change
    add_column :tournaments, :end_time, :timestamp
  end
end
