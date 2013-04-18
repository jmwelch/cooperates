class AddInvTable < ActiveRecord::Migration
  def up
  	create_table :inventory do |t|
      t.integer :user_id
      t.integer :ingredient_id
      t.date :purchase_date
      t.integer :purchase_price
      t.float :quantity_bought
      t.float :quanity_left
  end

  def down
  end
end
end
