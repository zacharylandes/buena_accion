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

ActiveRecord::Schema.define(version: 20180201215528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "category_needs", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "need_id"
    t.index ["category_id"], name: "index_category_needs_on_category_id"
    t.index ["need_id"], name: "index_category_needs_on_need_id"
  end

  create_table "needs", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.integer "amount"
    t.bigint "organization_id"
    t.index ["category_id"], name: "index_needs_on_category_id"
    t.index ["organization_id"], name: "index_needs_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.string "city"
    t.integer "zipcode"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "score"
    t.string "stars"
    t.string "cause_image"
    t.string "mission"
    t.string "url"
    t.string "cat_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
  end

  add_foreign_key "category_needs", "categories"
  add_foreign_key "category_needs", "needs"
  add_foreign_key "needs", "categories"
  add_foreign_key "needs", "organizations"
end
