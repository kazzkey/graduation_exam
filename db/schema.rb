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

ActiveRecord::Schema.define(version: 2020_07_28_053155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_sheets", force: :cascade do |t|
    t.integer "score", null: false
    t.bigint "exam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["exam_id"], name: "index_answer_sheets_on_exam_id"
    t.index ["user_id"], name: "index_answer_sheets_on_user_id"
  end

  create_table "answers", force: :cascade do |t|
    t.integer "choice", null: false
    t.bigint "answer_sheet_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_sheet_id"], name: "index_answers_on_answer_sheet_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content", null: false
    t.bigint "user_id"
    t.bigint "answer_sheet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_sheet_id"], name: "index_comments_on_answer_sheet_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "title", null: false
    t.date "deadline", null: false
    t.boolean "release", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subject_id"
    t.index ["subject_id"], name: "index_exams_on_subject_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "content", null: false
    t.string "image"
    t.integer "correct_answer", null: false
    t.string "description"
    t.integer "rate"
    t.bigint "exam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_questions_on_exam_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "student_id", null: false
    t.string "name", null: false
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
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["student_id"], name: "index_users_on_student_id", unique: true
  end

  add_foreign_key "answer_sheets", "exams"
  add_foreign_key "answer_sheets", "users"
  add_foreign_key "answers", "answer_sheets"
  add_foreign_key "answers", "questions"
  add_foreign_key "comments", "answer_sheets"
  add_foreign_key "comments", "users"
  add_foreign_key "exams", "subjects"
  add_foreign_key "questions", "exams"
end
