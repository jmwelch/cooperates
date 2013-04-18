class DbFixes < ActiveRecord::Migration
  def self.up
    rename_table :inventory, :inventories
    rename_column :inventories, :quanity_left, :quantity_left
    
  end
  
  def self.down
  end
end