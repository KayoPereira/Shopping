# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_21_162626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.bigint "districts_id", null: false
    t.text "street"
    t.integer "number"
    t.text "cep"
    t.text "complement"
    t.index ["districts_id"], name: "index_addresses_on_districts_id"
    t.index ["users_id"], name: "index_addresses_on_users_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.bigint "zones_id", null: false
    t.bigint "cities_id", null: false
    t.index ["cities_id"], name: "index_districts_on_cities_id"
    t.index ["zones_id"], name: "index_districts_on_zones_id"
  end

  create_table "phones", force: :cascade do |t|
    t.integer "number"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_phones_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.boolean "status"
    t.bigint "profile_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["profile_id"], name: "index_users_on_profile_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.float "value"
  end

  add_foreign_key "addresses", "districts", column: "districts_id"
  add_foreign_key "addresses", "users", column: "users_id"
  add_foreign_key "districts", "cities", column: "cities_id"
  add_foreign_key "districts", "zones", column: "zones_id"
  add_foreign_key "phones", "users"
  add_foreign_key "users", "profiles"
end
