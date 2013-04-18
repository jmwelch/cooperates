class DelOldPrimarykeys < ActiveRecord::Migration
  def up
  	remove_column :users, :uID
  	remove_column :foods, :fID
  end

  def down
  end
end
