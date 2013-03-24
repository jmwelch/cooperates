class Renamefood < ActiveRecord::Migration
  def up
  rename_table :food, :foods
  end

  def down
  end
end