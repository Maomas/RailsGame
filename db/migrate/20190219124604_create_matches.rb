class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|

      t.string :player1
      t.string :player2
      t.integer :score
      t.timestamps
    end
  end
end
