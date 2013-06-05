# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20130605132029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parcels", force: true do |t|
    t.string   "barcode",                    null: false
    t.datetime "synced_at"
    t.boolean  "delivered",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_offices", force: true do |t|
    t.string   "postal_code",  null: false
    t.string   "name"
    t.string   "country_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_offices", ["country_code"], name: "index_post_offices_on_country_code", using: :btree
  add_index "post_offices", ["postal_code"], name: "index_post_offices_on_postal_code", using: :btree

end
