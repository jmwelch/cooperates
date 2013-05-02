class AddLowQuantityToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :low_quantity, :float
  end
end
