class AddMenu < ActiveRecord::Migration
  def change
  	create_table :menu do |t|
      t.integer :uID
      t.integer :fID
  end
  add_index :menu, :uID,                :unique => true
	end
  def down
  end
end