class CreateTables < ActiveRecord::Migration
  def change

     create_table :foods do |t|
       t.string :name
       t.integer :user_id
       t.float :price
       t.string :ingredient_name
     end
     
     create_table :ingredients do |t|
       t.string :ingredient_name
       t.integer :user_id
       t.integer :food_id
       t.integer :quantity_used
     end
     
     create_table :transactions do |t|
       t.string :ingredient_name
       t.datetime :purchase_date
       t.float :purchase_price
       t.integer :quantity
       t.integer :bought_from
       t.integer :sold_to
    end
    
    create_table :stocks do |t|
      t.string :ingredient_name
      t.integer :quantity
      t.integer :user_id
    end
    
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id
      
      t.timestamps
     end
     
     
  end
end
