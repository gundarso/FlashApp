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

ActiveRecord::Schema.define(version: 20151016100109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name_fr"
    t.string   "name_nl"
    t.string   "name_de"
  end

  create_table "categories_customers", force: :cascade do |t|
    t.integer "category_id"
    t.integer "customer_id"
  end

  add_index "categories_customers", ["category_id"], name: "index_categories_customers_on_category_id", using: :btree
  add_index "categories_customers", ["customer_id"], name: "index_categories_customers_on_customer_id", using: :btree

  create_table "categories_shops", force: :cascade do |t|
    t.integer "category_id"
    t.integer "shop_id"
  end

  add_index "categories_shops", ["category_id"], name: "index_categories_shops_on_category_id", using: :btree
  add_index "categories_shops", ["shop_id"], name: "index_categories_shops_on_shop_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "message"
    t.string   "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "family_name"
    t.integer  "birth_year"
    t.string   "gender"
    t.string   "base_location"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true, using: :btree
  add_index "customers", ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true, using: :btree

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
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "sales", ["category_id"], name: "index_sales_on_category_id", using: :btree
  add_index "sales", ["shop_id"], name: "index_sales_on_shop_id", using: :btree

  create_table "shops", force: :cascade do |t|
    t.string   "name"
    t.string   "street_address"
    t.datetime "opening"
    t.datetime "closing"
    t.string   "phone"
    t.string   "contact_email"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "city"
    t.string   "postcode"
    t.string   "country"
  end

  add_index "shops", ["email"], name: "index_shops_on_email", unique: true, using: :btree
  add_index "shops", ["reset_password_token"], name: "index_shops_on_reset_password_token", unique: true, using: :btree

  create_table "welcomes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "categories_customers", "categories"
  add_foreign_key "categories_customers", "customers"
  add_foreign_key "categories_shops", "categories"
  add_foreign_key "categories_shops", "shops"
  add_foreign_key "sales", "categories"
  add_foreign_key "sales", "shops"
end
