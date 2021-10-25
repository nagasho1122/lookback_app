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

ActiveRecord::Schema.define(version: 2021_10_17_052427) do

  create_table "lookback_details", force: :cascade do |t|
    t.integer "number"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "subject_id", null: false
    t.string "unit"
    t.index ["subject_id"], name: "index_lookback_details_on_subject_id"
  end

  create_table "lookbacks", force: :cascade do |t|
    t.string "university"
    t.string "faculty"
    t.string "department"
    t.integer "year"
    t.text "all_text"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "created_at"], name: "index_lookbacks_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_lookbacks_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.datetime "deadline_at"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "subject_id"
    t.index ["subject_id"], name: "index_reviews_on_subject_id"
    t.index ["user_id", "created_at", "deadline_at"], name: "reviews_index"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subject"
    t.integer "lookback_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lookback_id"], name: "index_subjects_on_lookback_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "lookback_details", "subjects"
  add_foreign_key "lookbacks", "users"
  add_foreign_key "reviews", "subjects"
  add_foreign_key "reviews", "users"
  add_foreign_key "subjects", "lookbacks"
end
