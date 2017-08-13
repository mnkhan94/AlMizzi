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

ActiveRecord::Schema.define(version: 20170627201403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

end
