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

ActiveRecord::Schema.define(:version => 20130402051101) do

  create_table "activities", :force => true do |t|
    t.integer  "user_id"
    t.string   "action"
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "activities", ["trackable_id"], :name => "index_activities_on_trackable_id"
  add_index "activities", ["user_id"], :name => "index_activities_on_user_id"

  create_table "foods", :primary_key => "food_id", :force => true do |t|
    t.integer "user_id"
    t.string  "fname"
    t.integer "price"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ingredients", :force => true do |t|
    t.integer "inventory_id"
    t.string  "ingredient_name"
    t.float   "current_price"
    t.date    "date"
  end

  create_table "inventories", :force => true do |t|
    t.integer "user_id"
    t.integer "ingredient_id"
    t.date    "purchase_date"
    t.integer "purchase_price"
    t.float   "quantity_bought"
    t.float   "quantity_left"
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

  create_table "users", :force => true do |t|
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
