class RecreateFoods < ActiveRecord::Migration
  def self.up
    create_table(:foods, :primary_key => 'food_id')  do |t|      
      t.integer "food_id",      :null => false
      t.integer "user_id"
      t.string  "fname"
      t.integer "price"
     end
  end
  
  def self.down
  end
end