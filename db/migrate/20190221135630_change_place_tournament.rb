class ChangePlaceTournament < ActiveRecord::Migration[5.2]
  def change
	  rename_column :tournaments, :place, :address
  end
end
