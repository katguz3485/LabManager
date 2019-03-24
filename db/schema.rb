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

ActiveRecord::Schema.define(version: 2019_03_24_130916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "category_name", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "chemicals", force: :cascade do |t|
    t.string "chemical_name", null: false
    t.string "formula", null: false
    t.float "molecular_weight", null: false
    t.float "density", default: 0.0, null: false
    t.string "cas_number", default: "", null: false
    t.string "canonical_smiles", default: "", null: false
    t.string "inchi_key", default: "", null: false
    t.string "formula_picture", default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "category_id"
    t.string "picture_url", default: "", null: false
    t.integer "cid", default: 0, null: false
    t.index ["category_id"], name: "index_chemicals_on_category_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "item_owner", default: "", null: false
    t.integer "quantity", null: false
    t.float "amount", default: 0.0, null: false
    t.string "comment", default: "", null: false
    t.string "daily_usage", default: "", null: false
    t.boolean "present_in_respiratory_zone", default: false, null: false
    t.bigint "chemical_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "room", default: "", null: false
    t.string "shelf", default: "", null: false
    t.string "number", default: "", null: false
    t.index ["chemical_id"], name: "index_items_on_chemical_id"
  end

  create_table "safety_precautions", force: :cascade do |t|
    t.string "sds_file", default: "", null: false
    t.string "name_from_sds", default: "", null: false
    t.string "pictogram", default: "", null: false
    t.string "storage_temperature_range", default: "", null: false
    t.string "signal_word", default: "", null: false
    t.string "h_codes", default: "", null: false
    t.string "h_statements", default: "", null: false
    t.string "p_codes", default: "", null: false
    t.string "p_statements", default: "", null: false
    t.string "adr_number", default: "", null: false
    t.string "adr_class", default: "", null: false
    t.string "adr_group", default: "", null: false
    t.bigint "chemical_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chemical_id"], name: "index_safety_precautions_on_chemical_id"
  end

  create_table "user_providers", force: :cascade do |t|
    t.integer "user_id"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_providers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "username"
    t.string "avatar"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "users"
  add_foreign_key "chemicals", "categories"
end
