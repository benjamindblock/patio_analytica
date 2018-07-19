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

ActiveRecord::Schema.define(version: 20180523040134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mixes", force: :cascade do |t|
    t.string "name"
    t.string "artist"
    t.string "s3_url"
    t.text "description"
    t.string "duration"
  end

  create_table "patios", force: :cascade do |t|
    t.string "name"
    t.string "google_place_id"
    t.text "special_notes"
    t.integer "region"
    t.string "neighborhood"
    t.boolean "is_recommended"
    t.boolean "is_bougie"
    t.boolean "more_bar_than_restaurant"
    t.boolean "on_rooftop"
    t.boolean "is_small"
    t.boolean "is_covered"
    t.boolean "has_view"
    t.boolean "on_street"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weather_data", force: :cascade do |t|
    t.decimal "temperature"
    t.string "conditions"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
