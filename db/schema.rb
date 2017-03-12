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

ActiveRecord::Schema.define(version: 20170312190228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.decimal  "original_gravity", precision: 4, scale: 3
    t.decimal  "final_gravity",    precision: 4, scale: 3
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "notes"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "text"
    t.integer  "user_id"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.integer  "rating"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "ingredient_categories", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "category"
    t.string   "ingredient_name"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.decimal  "weight",          precision: 4, scale: 2
    t.string   "measurement"
    t.integer  "recipe_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "brew_id"
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.string   "style"
    t.integer  "boil_time"
    t.integer  "ibu"
    t.string   "batch_size"
    t.string   "image_url"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
