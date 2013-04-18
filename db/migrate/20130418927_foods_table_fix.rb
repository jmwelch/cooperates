class FoodsTableFix < ActiveRecord::Migration
  def self.up
    drop_table :foods   
  end
  
  def self.down
  end
end