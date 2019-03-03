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

ActiveRecord::Schema.define(version: 2018_07_15_040144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mains", force: :cascade do |t|
    t.string "name"
    t.integer "plate_id"
  end

  create_table "plate_mains", force: :cascade do |t|
    t.integer "plate_id"
    t.integer "main_id"
  end

  create_table "plate_sides", force: :cascade do |t|
    t.integer "plate_id"
    t.integer "side_id"
  end

  create_table "plates", force: :cascade do |t|
    t.string "main"
    t.string "side"
    t.integer "user_id"
  end

  create_table "sides", force: :cascade do |t|
    t.string "name"
    t.integer "plate_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
