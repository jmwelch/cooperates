class AddIngr < ActiveRecord::Migration
  def up
  	create_table :ingedients do |t|
      t.string :ingedient_name
      t.date :date
      t.float :current_price
  end

  def down
  end
end
end