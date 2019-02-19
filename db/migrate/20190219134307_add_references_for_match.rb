class AddReferencesForMatch < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :matches, index: true
    add_reference :tournaments, :matches, index: true
    add_reference :matches, :users, index: true
    add_reference :matches, :tournament, index: true
  end
end
