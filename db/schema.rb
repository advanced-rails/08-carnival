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

ActiveRecord::Schema.define(version: 20170817222059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cabins", force: :cascade do |t|
    t.string "room", null: false
    t.string "level", null: false
    t.boolean "is_available", default: true
    t.bigint "ship_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room", "level", "ship_id"], name: "index_cabins_on_room_and_level_and_ship_id", unique: true
    t.index ["ship_id"], name: "index_cabins_on_ship_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.string "country", null: false
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "country"], name: "index_cities_on_name_and_country", unique: true
  end

  create_table "cities_cruises", id: false, force: :cascade do |t|
    t.bigint "city_id", null: false
    t.bigint "cruise_id", null: false
    t.index ["city_id"], name: "index_cities_cruises_on_city_id"
    t.index ["cruise_id"], name: "index_cities_cruises_on_cruise_id"
  end

  create_table "cruises", force: :cascade do |t|
    t.string "name", null: false
    t.integer "duration", default: 0
    t.decimal "base_cost", default: "0.0"
    t.date "dates", default: [], array: true
    t.bigint "ship_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_cruises_on_name", unique: true
    t.index ["ship_id"], name: "index_cruises_on_ship_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "date", null: false
    t.string "room", null: false
    t.integer "level", null: false
    t.decimal "cost", null: false
    t.bigint "user_id", null: false
    t.bigint "cruise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cruise_id"], name: "index_reservations_on_cruise_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "ships", force: :cascade do |t|
    t.string "name", null: false
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_ships_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "user"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cabins", "ships"
  add_foreign_key "cities_cruises", "cities"
  add_foreign_key "cities_cruises", "cruises"
  add_foreign_key "cruises", "ships"
  add_foreign_key "reservations", "cruises"
  add_foreign_key "reservations", "users"
end
