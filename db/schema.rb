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

ActiveRecord::Schema.define(version: 2019_02_17_193031) do

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
    t.float "molecular_weight"
    t.float "density"
    t.string "cas_number"
    t.string "canonical_smiles"
    t.string "inchi_key"
    t.string "formula_picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_chemicals_on_category_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "item_owner"
    t.integer "quantity"
    t.float "amount"
    t.string "comment"
    t.string "daily_usage"
    t.boolean "present_in_respiratory_zone", default: false
    t.bigint "chemical_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "room"
    t.string "shelf"
    t.string "number"
    t.index ["chemical_id"], name: "index_items_on_chemical_id"
  end

  create_table "safety_precautions", force: :cascade do |t|
    t.string "sds_file"
    t.string "name_from_sds"
    t.string "pictogram"
    t.string "storage_temperature_range"
    t.string "signal_word"
    t.string "h_codes"
    t.string "h_statements"
    t.string "p_codes"
    t.string "p_statements"
    t.string "adr_number"
    t.string "adr_class"
    t.string "adr_group"
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
