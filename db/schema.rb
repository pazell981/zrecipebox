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

ActiveRecord::Schema.define(version: 20140910194830) do

  create_table "categories", force: true do |t|
    t.string   "category"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["user_id"], name: "index_categories_on_user_id"

  create_table "comments", force: true do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["recipe_id"], name: "index_comments_on_recipe_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "favorites", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "like"
    t.string   "favorite"
  end

  add_index "favorites", ["recipe_id"], name: "index_favorites_on_recipe_id"
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id"

  create_table "friends", force: true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "friend_id"
  end

  add_index "friends", ["friend_id"], name: "index_friends_on_friend_id"
  add_index "friends", ["user_id"], name: "index_friends_on_user_id"

  create_table "recipe_boxes", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recipe_category_id"
  end

  add_index "recipe_boxes", ["recipe_category_id"], name: "index_recipe_boxes_on_recipe_category_id"
  add_index "recipe_boxes", ["recipe_id"], name: "index_recipe_boxes_on_recipe_id"
  add_index "recipe_boxes", ["user_id"], name: "index_recipe_boxes_on_user_id"

  create_table "recipe_categories", id: false, force: true do |t|
    t.integer "category_id", null: false
    t.integer "recipe_id",   null: false
  end

  create_table "recipes", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.string   "yield"
    t.time     "actual_time"
    t.time     "total_time"
    t.string   "source"
    t.binary   "public"
    t.text     "instructions"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "ingredients"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "encrypted_password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
  end

end
