class AddGeoInfosTournament < ActiveRecord::Migration[5.2]
  def change
	  add_column :tournaments, :latitude, :float
	  add_column :tournaments, :longitude, :float
  end
end
