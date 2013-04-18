class TypoFix < ActiveRecord::Migration
  def self.up
    #rename_column :inventories, :quanity_left, :quantity_left
  end
  
  def self.down
  end
end