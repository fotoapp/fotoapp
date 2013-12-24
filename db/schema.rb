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

ActiveRecord::Schema.define(version: 20131223000047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "photo_stores", force: true do |t|
    t.integer  "user_id",         null: false
    t.string   "provider_key",    null: false
    t.string   "provider_secret", null: false
    t.string   "folder_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "filename",       null: false
    t.integer  "user_id",        null: false
    t.string   "checksum",       null: false
    t.integer  "photo_store_id", null: false
    t.string   "path",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["photo_store_id", "path"], name: "index_photos_on_photo_store_id_and_path", unique: true, using: :btree
  add_index "photos", ["user_id", "checksum"], name: "index_photos_on_user_id_and_checksum", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "username",   null: false
    t.string   "name"
    t.string   "email"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
