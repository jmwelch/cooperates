class AddRecipeTable < ActiveRecord::Migration
  def up
  	create_table :recipe do |t|
      t.integer :food_id
      t.integer :inventory_id
      t.float :amt_used
  end

  def down
  end
end
end
