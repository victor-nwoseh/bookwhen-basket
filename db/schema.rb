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

ActiveRecord::Schema[8.1].define(version: 2026_02_19_133717) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "basket_items", force: :cascade do |t|
    t.bigint "basket_id", null: false
    t.datetime "created_at", null: false
    t.bigint "event_id", null: false
    t.datetime "updated_at", null: false
    t.index ["basket_id", "event_id"], name: "index_basket_items_on_basket_id_and_event_id", unique: true
    t.index ["basket_id"], name: "index_basket_items_on_basket_id"
    t.index ["event_id"], name: "index_basket_items_on_event_id"
  end

  create_table "baskets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "session_token"
    t.datetime "updated_at", null: false
    t.index ["session_token"], name: "index_baskets_on_session_token"
  end

  create_table "events", force: :cascade do |t|
    t.integer "capacity"
    t.string "category"
    t.datetime "created_at", null: false
    t.text "description"
    t.datetime "end_time"
    t.string "instructor"
    t.string "location"
    t.integer "price_pence"
    t.integer "spots_remaining"
    t.datetime "start_time"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "basket_items", "baskets"
  add_foreign_key "basket_items", "events"
end
