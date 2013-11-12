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

ActiveRecord::Schema.define(version: 20131112150921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blood_draw_appointments", force: true do |t|
    t.integer  "user_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blood_draw_appointments", ["user_id"], name: "index_blood_draw_appointments_on_user_id", using: :btree

  create_table "consents", force: true do |t|
    t.string   "email",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currently_ill_memberships", force: true do |t|
    t.integer  "user_id"
    t.date     "consented_on"
    t.date     "enrolled_on"
    t.date     "symptoms_started_on"
    t.date     "tested_positive_on"
    t.date     "tested_negative_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "currently_ill_memberships", ["user_id"], name: "index_currently_ill_memberships_on_user_id", using: :btree

  create_table "previously_ill_memberships", force: true do |t|
    t.integer  "user_id"
    t.date     "consented_on"
    t.date     "enrolled_on"
    t.date     "symptoms_started_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "previously_ill_memberships", ["user_id"], name: "index_previously_ill_memberships_on_user_id", using: :btree

  create_table "questions", force: true do |t|
    t.string   "data_label"
    t.string   "content"
    t.integer  "survey_id"
    t.string   "input_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["survey_id"], name: "index_questions_on_survey_id", using: :btree

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "responses", force: true do |t|
    t.string   "label"
    t.integer  "value"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responses", ["question_id"], name: "index_responses_on_question_id", using: :btree

  create_table "survey_submissions", force: true do |t|
    t.integer  "user_id"
    t.integer  "survey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "survey_submissions", ["survey_id"], name: "index_survey_submissions_on_survey_id", using: :btree
  add_index "survey_submissions", ["user_id"], name: "index_survey_submissions_on_user_id", using: :btree

  create_table "surveys", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
