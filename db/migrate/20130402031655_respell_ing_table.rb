class RespellIngTable < ActiveRecord::Migration
  def up
  	rename_column :ingedients, :ingredients
  end

  def down
  end
end
