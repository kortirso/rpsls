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

ActiveRecord::Schema.define(version: 2020_07_22_174535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "calls", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.integer "userable_id"
    t.string "userable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["userable_type", "userable_id"], name: "index_calls_on_userable_type_and_userable_id", unique: true
    t.index ["uuid"], name: "index_calls_on_uuid"
  end

  create_table "guests", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uuid"], name: "index_guests_on_uuid"
  end

  create_table "users_devices", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.string "unique_id"
    t.integer "userable_id"
    t.string "userable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["unique_id"], name: "index_users_devices_on_unique_id", unique: true
    t.index ["userable_type", "userable_id"], name: "index_users_devices_on_userable_type_and_userable_id"
    t.index ["uuid"], name: "index_users_devices_on_uuid"
  end

  create_table "users_sessions", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.integer "userable_id"
    t.string "userable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["userable_type", "userable_id"], name: "index_users_sessions_on_userable_type_and_userable_id"
    t.index ["uuid"], name: "index_users_sessions_on_uuid"
  end

end
