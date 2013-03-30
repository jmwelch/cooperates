class Useridfix < ActiveRecord::Migration
  def up
  drop_table :users

  create_table "users", :force => true do |t|
    t.integer  "id",                                     :null => false
    t.string   "username"
    t.string   "user_type"
    t.string   "description"
    t.integer  "price_range"
    t.integer  "rating"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end
  end

  def down
  end
end