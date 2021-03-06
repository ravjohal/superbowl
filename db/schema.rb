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

ActiveRecord::Schema.define(version: 2021_02_01_023906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "super_bowl_id"
  end

  create_table "messages", id: :serial, force: :cascade do |t|
    t.text "header_update"
    t.text "header_details"
    t.string "header_first"
    t.string "header_second"
    t.string "header_third"
    t.string "header_pot_title"
    t.text "header_middle"
    t.text "header_left"
    t.text "footer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", id: :serial, force: :cascade do |t|
    t.integer "answer_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prop_bet_sheets", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "totals_points"
    t.boolean "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "super_bowl_id"
    t.integer "total_points_earned"
  end

  create_table "prop_bets", id: :serial, force: :cascade do |t|
    t.integer "question_id"
    t.integer "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "prop_bet_sheet_id"
    t.integer "user_id"
    t.integer "super_bowl_id"
    t.index ["answer_id"], name: "index_prop_bets_on_answer_id"
    t.index ["question_id"], name: "index_prop_bets_on_question_id"
  end

  create_table "propbetsheets", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "paid"
    t.integer "total_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "questions", id: :serial, force: :cascade do |t|
    t.text "question"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "super_bowl_id"
    t.integer "correct_answer_id"
  end

  create_table "super_bowls", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "editing_enabled"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "prop_bets", "answers"
  add_foreign_key "prop_bets", "questions"
end
