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

ActiveRecord::Schema.define(version: 20130605203758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "operation_types", force: true do |t|
    t.string   "russianpost_type"
    t.string   "russianpost_attr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operations", force: true do |t|
    t.integer  "mass"
    t.integer  "parcel_id"
    t.integer  "operation_type_id"
    t.integer  "post_office_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "happened_at"
  end

  add_index "operations", ["happened_at"], name: "index_operations_on_happened_at", using: :btree
  add_index "operations", ["operation_type_id"], name: "index_operations_on_operation_type_id", using: :btree
  add_index "operations", ["parcel_id"], name: "index_operations_on_parcel_id", using: :btree
  add_index "operations", ["post_office_id"], name: "index_operations_on_post_office_id", using: :btree

  create_table "parcels", force: true do |t|
    t.string   "barcode",                    null: false
    t.datetime "synced_at"
    t.boolean  "delivered",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_offices", force: true do |t|
    t.string   "postal_code"
    t.string   "name"
    t.string   "country_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_offices", ["country_code"], name: "index_post_offices_on_country_code", using: :btree
  add_index "post_offices", ["name"], name: "index_post_offices_on_name", using: :btree
  add_index "post_offices", ["postal_code"], name: "index_post_offices_on_postal_code", using: :btree

  create_table "subscriptions", force: true do |t|
    t.integer  "user_id"
    t.integer  "parcel_id"
    t.boolean  "confirmed",   default: false
    t.string   "token"
    t.datetime "notified_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["parcel_id"], name: "index_subscriptions_on_parcel_id", using: :btree
  add_index "subscriptions", ["token"], name: "index_subscriptions_on_token", using: :btree
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
