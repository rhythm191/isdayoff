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

ActiveRecord::Schema.define(version: 20170222124017) do

  create_table "calendars", force: :cascade do |t|
    t.string   "country",     null: false
    t.string   "locale",      null: false
    t.string   "calendar_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["country", "locale"], name: "index_calendars_on_country_and_locale", unique: true
  end

  create_table "holidays", force: :cascade do |t|
    t.date     "date",       null: false
    t.string   "reason",     null: false
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "locale"
    t.index ["date", "country", "locale"], name: "index_holidays_on_date_and_country_and_locale"
  end

end
