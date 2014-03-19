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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140319073453) do

  create_table "comments", force: true do |t|
    t.text     "body"
    t.datetime "date_created"
    t.datetime "date_modified"
    t.integer  "user_id"
    t.integer  "menu_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "review_type"
  end

  add_index "comments", ["menu_item_id"], name: "index_comments_on_menu_item_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "menu_items", force: true do |t|
    t.string   "locu_id"
    t.string   "name"
    t.text     "description"
    t.decimal  "price",         precision: 10, scale: 2
    t.decimal  "rating",        precision: 10, scale: 1
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "review_types"
  end

  add_index "menu_items", ["restaurant_id"], name: "index_menu_items_on_restaurant_id"

  create_table "rates", force: true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id"

  create_table "rating_caches", force: true do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"

  create_table "ratings", force: true do |t|
    t.integer  "score",      default: 0
    t.integer  "comment_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["comment_id"], name: "index_ratings_on_comment_id"
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "restaurants", force: true do |t|
    t.string   "locu_id"
    t.string   "name"
    t.text     "street_address"
    t.string   "locality"
    t.string   "region"
    t.string   "postal_code"
    t.string   "country"
    t.string   "phone"
    t.decimal  "long"
    t.decimal  "lat"
    t.text     "websiteUrl"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
