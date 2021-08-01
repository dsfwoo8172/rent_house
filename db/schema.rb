# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_31_103740) do

  create_table "favourites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "rent_item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rent_item_id"], name: "index_favourites_on_rent_item_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "rent_items", force: :cascade do |t|
    t.string "small_img"
    t.string "show_url"
    t.string "title"
    t.string "address"
    t.string "area"
    t.integer "price"
    t.string "county"
    t.string "room_type"
    t.integer "size"
    t.string "floor"
    t.string "specification"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_rent_items_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.string "phone", null: false
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "favourites", "rent_items"
  add_foreign_key "favourites", "users"
  add_foreign_key "rent_items", "users"
end
