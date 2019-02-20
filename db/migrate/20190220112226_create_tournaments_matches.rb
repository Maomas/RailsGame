class CreateTournamentsMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments_matches do |t|
      t.references :tournament, foreign_key: true
      t.references :match, foreign_key: true

      t.timestamps
    end
  end
end
