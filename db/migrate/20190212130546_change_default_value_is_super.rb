class ChangeDefaultValueIsSuper < ActiveRecord::Migration[5.2]
  def change
	  change_column :users, :isSuper, :boolean, :default => false 
  end
end
