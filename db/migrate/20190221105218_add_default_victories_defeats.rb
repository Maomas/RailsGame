class AddDefaultVictoriesDefeats < ActiveRecord::Migration[5.2]
  def change
	  change_column :users, :victories, :integer, :default => 0
	  change_column :users, :defeats, :integer, :default => 0
  end
end
