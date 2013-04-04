class CleanupInvIng < ActiveRecord::Migration
  def up
   #remove_column :inventories, :ingredient_id
  	drop_table :ingredients
  	create_table :ingredients do |t|
      t.integer :inventory_id
      t.string :ingredient_name
      t.float :current_price
      t.date :date
  end

  def down
  end
end
end