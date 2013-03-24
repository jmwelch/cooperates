class AddFood < ActiveRecord::Migration
  def up
  	create_table :food, {:primary_key => :fID} do |t|
      t.integer :fID
      t.string :fname
      t.integer :price
  end
add_index :food, :fID,                :unique => true
	end
  def down
  end
end
