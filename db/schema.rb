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

ActiveRecord::Schema.define(version: 20170102181612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gifs", force: :cascade do |t|
    t.string   "url"
    t.string   "image_original_url"
    t.string   "fixed_width_downsampled_url"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "category_id"
    t.string   "keyword"
    t.index ["category_id"], name: "index_gifs_on_category_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "title"
    t.boolean  "can_change_roles"
    t.boolean  "can_add_user"
    t.boolean  "can_delete_user"
    t.boolean  "can_add_gif"
    t.boolean  "can_delete_gif"
    t.boolean  "can_create_roles"
    t.boolean  "can_delete_roles"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_role_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "username"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest"
    t.integer  "site_role",       default: 0
    t.integer  "role_id"
  end

  add_foreign_key "gifs", "categories"
end
