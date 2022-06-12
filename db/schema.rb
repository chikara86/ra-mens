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

ActiveRecord::Schema.define(version: 2022_06_11_112447) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "areas", force: :cascade do |t|
    t.string "area", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ramen", force: :cascade do |t|
    t.integer "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ramen_comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ramen_id"
    t.text "comment", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ramen_id"], name: "index_ramen_comments_on_ramen_id"
    t.index ["user_id"], name: "index_ramen_comments_on_user_id"
  end

  create_table "ramen_favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ramen_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ramen_id"], name: "index_ramen_favorites_on_ramen_id"
    t.index ["user_id"], name: "index_ramen_favorites_on_user_id"
  end

  create_table "ramen_genres", force: :cascade do |t|
    t.integer "ramen_id"
    t.integer "genre_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id"], name: "index_ramen_genres_on_genre_id"
    t.index ["ramen_id"], name: "index_ramen_genres_on_ramen_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ramen_comments", "ramen", column: "ramen_id"
  add_foreign_key "ramen_comments", "users"
  add_foreign_key "ramen_favorites", "ramen", column: "ramen_id"
  add_foreign_key "ramen_favorites", "users"
  add_foreign_key "ramen_genres", "genres"
  add_foreign_key "ramen_genres", "ramen", column: "ramen_id"
end
