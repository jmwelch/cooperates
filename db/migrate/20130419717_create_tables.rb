class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :user_type
      t.string :description
      t.string :price_range
      t.string :rating
      t.string :cuisine
      t.string :address
      t.string :email,                  :default => "", :null => false
      t.string :encrypted_password,     :default => "", :null => false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer  :sign_in_count,          :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      
      t.timestamps
     end

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
    
    create_table :stock do |t|
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