# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130322033458) do

  create_table "foods", :id => false, :force => true do |t|
    t.integer "id",      :null => false
    t.integer "user_id"
    t.string  "fname"
    t.integer "price"
  end

  create_table "ingedients", :force => true do |t|
    t.string "ingedient_name"
    t.date   "date"
    t.float  "current_price"
  end

  create_table "inventory", :force => true do |t|
    t.integer "user_id"
    t.integer "ingredient_id"
    t.date    "purchase_date"
    t.integer "purchase_price"
    t.float   "quantity_bought"
    t.float   "quanity_left"
  end

  create_table "recipe", :force => true do |t|
    t.integer "food_id"
    t.integer "inventory_id"
    t.float   "amt_used"
  end

  create_table "sells", :force => true do |t|
    t.integer "user_id"
    t.integer "ingredient_id"
    t.date    "date"
    t.float   "current_cost"
    t.integer "quantity_left"
  end

  create_table "users", :id => false, :force => true do |t|
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

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
