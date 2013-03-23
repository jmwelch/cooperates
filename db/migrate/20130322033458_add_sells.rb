class AddSells < ActiveRecord::Migration
  def up
	create_table :sells do |t|
      t.integer :user_id
      t.integer :ingredient_id
      t.date :date
      t.float :current_cost
      t.integer :quantity_left
  end

  def down
  end
end
end