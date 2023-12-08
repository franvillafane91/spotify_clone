# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_11_30_210521) do
  create_table "albums", force: :cascade do |t|
    t.string "title", null: false
    t.boolean "published", default: false
    t.integer "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_albums_on_artist_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "visit_count", default: 0
    t.index ["email"], name: "index_artists_on_email", unique: true
    t.index ["reset_password_token"], name: "index_artists_on_reset_password_token", unique: true
  end

  create_table "followers", force: :cascade do |t|
    t.integer "artist_id", null: false
    t.integer "listener_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_followers_on_artist_id"
    t.index ["listener_id"], name: "index_followers_on_listener_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "listener_id", null: false
    t.integer "album_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_likes_on_album_id"
    t.index ["listener_id"], name: "index_likes_on_listener_id"
  end

  create_table "listeners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_listeners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_listeners_on_reset_password_token", unique: true
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "string"
    t.string "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "album_id", null: false
    t.index ["album_id"], name: "index_songs_on_album_id"
  end

  add_foreign_key "albums", "artists"
  add_foreign_key "followers", "artists"
  add_foreign_key "followers", "listeners"
  add_foreign_key "likes", "albums"
  add_foreign_key "likes", "listeners"
  add_foreign_key "songs", "albums"
end
