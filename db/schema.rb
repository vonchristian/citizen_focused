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

ActiveRecord::Schema.define(version: 20170118052158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.boolean  "contra",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["type"], name: "index_accounts_on_type", using: :btree
  end

  create_table "addresses", force: :cascade do |t|
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.string   "house_or_building_number"
    t.string   "building_name"
    t.string   "unit_number"
    t.string   "subdivision"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["addressable_id"], name: "index_addresses_on_addressable_id", using: :btree
    t.index ["addressable_type"], name: "index_addresses_on_addressable_type", using: :btree
  end

  create_table "amounts", force: :cascade do |t|
    t.string   "type"
    t.integer  "account_id"
    t.integer  "entry_id"
    t.decimal  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id", "entry_id"], name: "index_amounts_on_account_id_and_entry_id", using: :btree
    t.index ["account_id"], name: "index_amounts_on_account_id", using: :btree
    t.index ["entry_id", "account_id"], name: "index_amounts_on_entry_id_and_account_id", using: :btree
    t.index ["entry_id"], name: "index_amounts_on_entry_id", using: :btree
    t.index ["type"], name: "index_amounts_on_type", using: :btree
  end

  create_table "barangays", force: :cascade do |t|
    t.string   "name",          default: "", null: false
    t.integer  "subscriber_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["subscriber_id"], name: "index_barangays_on_subscriber_id", using: :btree
  end

  create_table "businesses", force: :cascade do |t|
    t.string   "name"
    t.integer  "taxpayer_id"
    t.decimal  "asset_size"
    t.boolean  "renting"
    t.integer  "employee_count"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "type_of_organization_id"
    t.integer  "enterprise_scale_id"
    t.index ["enterprise_scale_id"], name: "index_businesses_on_enterprise_scale_id", using: :btree
    t.index ["taxpayer_id"], name: "index_businesses_on_taxpayer_id", using: :btree
    t.index ["type_of_organization_id"], name: "index_businesses_on_type_of_organization_id", using: :btree
  end

  create_table "capitals", force: :cascade do |t|
    t.integer  "business_id"
    t.decimal  "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["business_id"], name: "index_capitals_on_business_id", using: :btree
  end

  create_table "enterprise_scales", force: :cascade do |t|
    t.string   "name"
    t.decimal  "minimum"
    t.decimal  "maximum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.string   "reference_number"
    t.datetime "entry_date"
    t.integer  "commercial_document_id"
    t.string   "commercial_document_type"
    t.integer  "recorder_id"
    t.string   "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["commercial_document_id"], name: "index_entries_on_commercial_document_id", using: :btree
    t.index ["commercial_document_type"], name: "index_entries_on_commercial_document_type", using: :btree
    t.index ["recorder_id"], name: "index_entries_on_recorder_id", using: :btree
  end

  create_table "gross_sales", force: :cascade do |t|
    t.date     "year"
    t.decimal  "amount"
    t.decimal  "tax"
    t.integer  "business_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["business_id"], name: "index_gross_sales_on_business_id", using: :btree
  end

  create_table "line_of_business_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_of_businesses", force: :cascade do |t|
    t.string   "name"
    t.integer  "line_of_business_category_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["line_of_business_category_id"], name: "index_line_of_businesses_on_line_of_business_category_id", using: :btree
  end

  create_table "provinces", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "name"
    t.integer  "province_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "type"
    t.index ["province_id"], name: "index_subscribers_on_province_id", using: :btree
    t.index ["type"], name: "index_subscribers_on_type", using: :btree
  end

  create_table "taxpayers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "full_name"
    t.integer  "sex",              default: 0
    t.date     "date_of_birth"
    t.string   "mobile_number"
    t.string   "telephone_number"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "type_of_organizations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "mobile_number"
    t.string   "telephone_member"
    t.integer  "sex"
    t.date     "date_of_birth"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "businesses", "enterprise_scales"
  add_foreign_key "businesses", "taxpayers"
  add_foreign_key "businesses", "type_of_organizations"
  add_foreign_key "capitals", "businesses"
  add_foreign_key "line_of_businesses", "line_of_business_categories"
  add_foreign_key "subscribers", "provinces"
end
