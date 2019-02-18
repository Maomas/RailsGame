class AddTournamentReferenceToGames < ActiveRecord::Migration[5.2]
  def change
    add_reference :games, :tournament, index: true
  end
end
