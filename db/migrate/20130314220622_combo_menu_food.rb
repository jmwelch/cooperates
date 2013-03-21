class ComboMenuFood < ActiveRecord::Migration
  def up
  drop_table :menu
  drop_table :food
  
  create_table :food, {:primary_key => :fID} do |t|
      t.integer :fID
      t.integer :uID
      t.string :fname
      t.integer :price

  end

  def down
  end
end
end
