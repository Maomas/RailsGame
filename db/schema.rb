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

ActiveRecord::Schema.define(version: 2019_02_26_144842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.bigint "tournament_id"
    t.bigint "user_id"
    t.index ["tournament_id"], name: "index_games_on_tournament_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "games_tournaments", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_games_tournaments_on_game_id"
    t.index ["tournament_id"], name: "index_games_tournaments_on_tournament_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "player1"
    t.string "player2"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "tournament_id"
    t.string "game"
    t.index ["tournament_id"], name: "index_matches_on_tournament_id"
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "matches_tournaments", force: :cascade do |t|
    t.bigint "tournament_id"
    t.bigint "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_matches_tournaments_on_match_id"
    t.index ["tournament_id"], name: "index_matches_tournaments_on_tournament_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.datetime "date"
    t.string "address"
    t.integer "maxNumberPlayers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.bigint "game_id"
    t.bigint "user_id"
    t.bigint "match_id"
    t.datetime "end_time"
    t.float "latitude"
    t.float "longitude"
    t.index ["game_id"], name: "index_tournaments_on_game_id"
    t.index ["match_id"], name: "index_tournaments_on_match_id"
    t.index ["user_id"], name: "index_tournaments_on_user_id"
  end

  create_table "tournaments_matches", force: :cascade do |t|
    t.bigint "tournament_id"
    t.bigint "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_tournaments_matches_on_match_id"
    t.index ["tournament_id"], name: "index_tournaments_matches_on_tournament_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "country"
    t.integer "victories", default: 0
    t.integer "defeats", default: 0
    t.integer "totalScore"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "game_id"
    t.bigint "tournament_id"
    t.bigint "match_id"
    t.string "city"
    t.string "street"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["game_id"], name: "index_users_on_game_id"
    t.index ["match_id"], name: "index_users_on_match_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["tournament_id"], name: "index_users_on_tournament_id"
  end

  create_table "users_games", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_users_games_on_game_id"
    t.index ["user_id"], name: "index_users_games_on_user_id"
  end

  create_table "users_matches", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_users_matches_on_match_id"
    t.index ["user_id"], name: "index_users_matches_on_user_id"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "users_tournaments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_users_tournaments_on_tournament_id"
    t.index ["user_id"], name: "index_users_tournaments_on_user_id"
  end

  add_foreign_key "games_tournaments", "games"
  add_foreign_key "games_tournaments", "tournaments"
  add_foreign_key "matches_tournaments", "matches"
  add_foreign_key "matches_tournaments", "tournaments"
  add_foreign_key "tournaments", "games"
  add_foreign_key "tournaments_matches", "matches"
  add_foreign_key "tournaments_matches", "tournaments"
  add_foreign_key "users_games", "games"
  add_foreign_key "users_games", "users"
  add_foreign_key "users_matches", "matches"
  add_foreign_key "users_matches", "users"
  add_foreign_key "users_tournaments", "tournaments"
  add_foreign_key "users_tournaments", "users"
end
