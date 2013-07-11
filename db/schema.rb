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

ActiveRecord::Schema.define(version: 20130710175056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.integer  "category_id"
    t.text     "body"
    t.text     "question"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "viewed_at"
  end

  add_index "answers", ["category_id"], name: "index_answers_on_category_id", using: :btree

  create_table "categories", force: true do |t|
    t.integer  "game_id"
    t.string   "name"
    t.string   "slug"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["game_id"], name: "index_categories_on_game_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "type"
    t.integer  "game_id"
    t.integer  "answer_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["answer_id"], name: "index_events_on_answer_id", using: :btree
  add_index "events", ["game_id"], name: "index_events_on_game_id", using: :btree
  add_index "events", ["player_id"], name: "index_events_on_player_id", using: :btree

  create_table "games", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.integer  "game_id"
    t.string   "name"
    t.integer  "score",      default: 0, null: false
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["game_id"], name: "index_players_on_game_id", using: :btree

  create_table "rewards", force: true do |t|
    t.integer  "game_id"
    t.integer  "score"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rewards", ["game_id"], name: "index_rewards_on_game_id", using: :btree

end
