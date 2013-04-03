class RenameInventory < ActiveRecord::Migration
  def self.up
    rename_table :inventory, :inventories
  end

 def self.down
 end
end