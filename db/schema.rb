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

ActiveRecord::Schema.define(version: 2018_08_20_095715) do

  create_table "challenges", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id"
    t.integer "challenging_team_id"
  end

  create_table "consoles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gamers", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.boolean "admin", default: false
    t.string "description"
    t.string "nation"
    t.string "nickname"
    t.integer "team_id"
    t.string "conssole"
    t.string "gammes"
    t.boolean "updated", default: false
    t.integer "role"
    t.index ["email"], name: "index_gamers_on_email", unique: true
    t.index ["team_id"], name: "index_gamers_on_team_id"
  end

  create_table "gamers_teams", id: false, force: :cascade do |t|
    t.integer "gamer_id", null: false
    t.integer "team_id", null: false
    t.index ["gamer_id"], name: "index_gamers_teams_on_gamer_id"
    t.index ["team_id"], name: "index_gamers_teams_on_team_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_games_on_name"
  end

  create_table "games_groups", id: false, force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "group_id", null: false
    t.index ["game_id"], name: "index_games_groups_on_game_id"
    t.index ["group_id"], name: "index_games_groups_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "region"
    t.string "console"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_id"
    t.text "description"
    t.index ["game_id"], name: "index_groups_on_game_id"
    t.index ["member_id"], name: "index_groups_on_member_id"
    t.index ["name"], name: "index_groups_on_name", unique: true
  end

  create_table "invite_requests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id"
    t.integer "gamer_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "ip"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id"
    t.integer "matching_team_id"
  end

  create_table "members", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gamer_id"
    t.integer "team_id"
  end

  create_table "playings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "game_id"
    t.integer "group_id"
    t.index ["game_id", "group_id"], name: "index_playings_on_game_id_and_group_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "boss_id"
    t.integer "invite_id"
    t.integer "match_id"
    t.integer "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "console"
    t.integer "game_id"
    t.string "avatar"
    t.index ["boss_id"], name: "index_teams_on_boss_id"
    t.index ["challenge_id"], name: "index_teams_on_challenge_id"
    t.index ["game_id"], name: "index_teams_on_game_id"
    t.index ["invite_id"], name: "index_teams_on_invite_id"
    t.index ["match_id"], name: "index_teams_on_match_id"
  end

end
