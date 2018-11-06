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

ActiveRecord::Schema.define(version: 2018_11_04_155311) do

  create_table "chefs", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.string "cook_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dishingredients", force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "dish_id"
    t.index ["dish_id"], name: "index_dishingredients_on_dish_id"
    t.index ["ingredient_id"], name: "index_dishingredients_on_ingredient_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.integer "chef_id"
    t.integer "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chef_id"], name: "index_ingredients_on_chef_id"
    t.index ["dish_id"], name: "index_ingredients_on_dish_id"
  end

end