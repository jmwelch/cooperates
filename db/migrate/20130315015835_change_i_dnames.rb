class ChangeIDnames < ActiveRecord::Migration
  def up
  rename_column :users, :uID, :user_id
  rename_column :foods, :fID, :food_id
  rename_column :foods, :uID, :user_id


  end

  def down
  end
end
