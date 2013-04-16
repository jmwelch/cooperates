class FixDbShit < ActiveRecord::Migration
  def self.up
    drop_table :foods
  end
  
  def self.down
     rename_column :inventories, :quanity_left, :quantity_left

  end
end