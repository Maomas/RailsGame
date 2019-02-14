class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.datetime :date
      t.string :place
      t.string :place
      t.integer :maxNumberPlayers
      t.timestamps
    end
  end
end
