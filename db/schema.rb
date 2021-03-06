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

ActiveRecord::Schema.define(version: 20150414070507) do

  create_table "atusers", force: true do |t|
    t.integer  "mircoblog_id"
    t.integer  "comment_id"
    t.integer  "from_user_id"
    t.integer  "at_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "comment"
    t.integer  "mircoblog_id"
    t.integer  "photo_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follows", force: true do |t|
    t.integer  "from_user_id"
    t.integer  "follow_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.string   "message"
    t.integer  "msgtype"
    t.integer  "msgstatu"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mircoblogs", force: true do |t|
    t.string   "sharetext"
    t.integer  "user_id"
    t.string   "praise"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photobooks", force: true do |t|
    t.string   "bookname"
    t.string   "bookcover"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "file"
    t.integer  "photobook_id"
    t.string   "filename"
    t.string   "original_filename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pointpraises", force: true do |t|
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_dynamics", force: true do |t|
    t.integer  "dynamicstype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
    t.integer  "gender"
  end

end
