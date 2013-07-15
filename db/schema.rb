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

ActiveRecord::Schema.define(version: 20130715192049) do

  create_table "comments", force: true do |t|
    t.text     "note"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "flower_id"
  end

  add_index "comments", ["flower_id"], name: "index_comments_on_flower_id"

  create_table "flowers", force: true do |t|
    t.text     "url",         limit: 255
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: true do |t|
    t.boolean  "up_vote"
    t.integer  "user_id"
    t.integer  "flower_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["flower_id"], name: "index_ratings_on_flower_id"
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "active_flower"
    t.integer  "gallery_range"
  end

end
