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

ActiveRecord::Schema.define(version: 20151129003008) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abouts", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.text     "link"
    t.text     "link_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_options", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "options_enabled"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "admin_options", ["user_id"], name: "index_admin_options_on_user_id", using: :btree

  create_table "announcements", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "link"
  end

  add_index "announcements", ["user_id"], name: "index_announcements_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree
  add_index "comments", ["work_id"], name: "index_comments_on_work_id", using: :btree

  create_table "favourites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favourites", ["user_id"], name: "index_favourites_on_user_id", using: :btree
  add_index "favourites", ["work_id"], name: "index_favourites_on_work_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "email"
    t.string   "password_digest"
    t.text     "about"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.boolean  "is_admin"
    t.datetime "last_seen"
    t.text     "nanowrimo_name"
    t.text     "admin_description"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree

  create_table "works", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.boolean  "incomplete"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "works", ["user_id"], name: "index_works_on_user_id", using: :btree

  add_foreign_key "admin_options", "users"
  add_foreign_key "announcements", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "comments", "works"
  add_foreign_key "favourites", "users"
  add_foreign_key "favourites", "works"
  add_foreign_key "works", "users"
end
