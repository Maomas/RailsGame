class CreateUsersTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :users_tournaments do |t|
      t.references :user, foreign_key: true
      t.references :tournament, foreign_key: true

      t.timestamps
    end
  end
end
