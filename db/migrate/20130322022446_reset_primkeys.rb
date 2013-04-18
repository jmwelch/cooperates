class ResetPrimkeys < ActiveRecord::Migration
  def up
  rename_column :users, :user_id, :id
  rename_column :foods, :food_id, :id
  end

  def down
  end
end
