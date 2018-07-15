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

ActiveRecord::Schema.define(version: 20180715012128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "caddies", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "password_digest"
    t.boolean "ranking"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "golfers", force: :cascade do |t|
    t.string "name"
    t.integer "member_number"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "caddy_preference_1"
    t.integer "caddy_preference_2"
    t.integer "caddy_preference_3"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tee_time_reminders", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tee_times", force: :cascade do |t|
    t.integer "caddy_id"
    t.integer "golfer_id"
    t.integer "location_id"
    t.boolean "confirmed"
    t.boolean "no_caddy"
    t.boolean "cart"
    t.integer "number_of_holes"
    t.string "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
