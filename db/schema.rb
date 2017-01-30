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


ActiveRecord::Schema.define(version: 20170130161246) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"


  create_table "bookings", force: :cascade do |t|
    t.date     "check_in"
    t.date     "check_out"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.integer  "phone"
    t.string   "email"
    t.string   "street_name"
    t.string   "street_number"
    t.string   "city"
    t.string   "zip_code"
    t.integer  "people"
    t.decimal  "total_price"
    t.boolean  "confirmed"
    t.boolean  "paid"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "prices", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "min_days"
    t.decimal  "nightly_price"
    t.decimal  "extra_price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end
end
