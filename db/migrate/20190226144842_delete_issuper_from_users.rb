class DeleteIssuperFromUsers < ActiveRecord::Migration[5.2]
  def change
	  remove_column :users, :isSuper

  end
end
