class FixDbShit < ActiveRecord::Migration
  def self.up
    drop_table :foods
  end
  
  def self.down
     rename_column :inventories, :quanity_left, :quantity_left

      create_table(:foods, :primary_key => 'id')  do |t|      
        t.integer "food_id",      :null => false
        t.integer "user_id"
        t.string  "fname"
        t.integer "price"
      end
  end
end