class RespellIngTable < ActiveRecord::Migration
  def up
  	rename_table :ingedients, :ingredients
  end
  
  def down
  end
end
