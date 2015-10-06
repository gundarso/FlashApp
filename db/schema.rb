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

ActiveRecord::Schema.define(version: 20151006094434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "family_name"
    t.integer  "age"
    t.string   "gender"
    t.string   "base_location"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "sales", force: :cascade do |t|
    t.string   "product_name"
    t.string   "product_description"
    t.string   "product_quantity"
    t.string   "price"
    t.string   "terms"
    t.datetime "starting"
    t.datetime "ending"
    t.integer  "category_id"
    t.integer  "shop_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "sales", ["category_id"], name: "index_sales_on_category_id", using: :btree
  add_index "sales", ["shop_id"], name: "index_sales_on_shop_id", using: :btree

  create_table "shops", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "opening"
    t.datetime "closing"
    t.string   "phone"
    t.string   "email"
    t.float    "latitute"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "sales", "categories"
  add_foreign_key "sales", "shops"
end
