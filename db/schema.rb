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

ActiveRecord::Schema.define(version: 20170914203658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "hadith_books", force: :cascade do |t|
    t.text    "title"
    t.text    "notes"
    t.integer "position"
    t.integer "hadith_collection_id"
  end

  add_index "hadith_books", ["hadith_collection_id"], name: "index_hadith_books_on_hadith_collection_id", using: :btree

  create_table "hadith_chapters", force: :cascade do |t|
    t.text    "title"
    t.text    "notes"
    t.integer "position"
    t.integer "hadith_book_id"
  end

  add_index "hadith_chapters", ["hadith_book_id"], name: "index_hadith_chapters_on_hadith_book_id", using: :btree

  create_table "hadith_collections", force: :cascade do |t|
    t.string "title"
    t.string "author"
  end

  create_table "narrations", force: :cascade do |t|
    t.integer "position"
    t.integer "hadith_chapter_id"
    t.text    "arabic"
    t.text    "english"
    t.text    "annotated_arabic"
  end

  add_index "narrations", ["hadith_chapter_id"], name: "index_narrations_on_hadith_chapter_id", using: :btree

  create_table "narrator_narrations", force: :cascade do |t|
    t.integer "narrator_id"
    t.integer "narration_id"
  end

  add_index "narrator_narrations", ["narration_id"], name: "index_narrator_narrations_on_narration_id", using: :btree
  add_index "narrator_narrations", ["narrator_id"], name: "index_narrator_narrations_on_narrator_id", using: :btree

  create_table "narrators", force: :cascade do |t|
    t.integer "position"
    t.text    "full_name"
  end

  create_table "resources", force: :cascade do |t|
    t.string  "title"
    t.string  "ayah"
    t.integer "hadith_reference"
    t.text    "body"
    t.string  "category"
    t.integer "user_id"
    t.integer "resourceable_id"
    t.string  "resourceable_type"
  end

  add_index "resources", ["resourceable_type", "resourceable_id"], name: "index_resources_on_resourceable_type_and_resourceable_id", using: :btree
  add_index "resources", ["user_id"], name: "index_resources_on_user_id", using: :btree

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "roles"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
