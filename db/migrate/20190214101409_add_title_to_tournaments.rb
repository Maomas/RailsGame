class AddTitleToTournaments < ActiveRecord::Migration[5.2]
  def change
    add_column :tournaments, :title, :string 
  end
end
