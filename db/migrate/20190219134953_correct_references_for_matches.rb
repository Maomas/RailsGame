class CorrectReferencesForMatches < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :matches, index: true
    remove_reference :tournaments, :matches, index: true
    remove_reference :matches, :users, index: true
    remove_reference :matches, :tournament, index: true

    add_reference :tournaments, :match, index: true
    add_reference :matches, :user, index: true
    add_reference :matches, :tournament, index: true
    add_reference :users, :match, index: true
  end
end
