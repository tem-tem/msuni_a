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

ActiveRecord::Schema.define(version: 20180623151546) do

  create_table "msu_books", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "msu_disciplines", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "visible", default: true
  end

  create_table "msu_files", force: :cascade do |t|
    t.string "name"
    t.string "file"
    t.string "link"
    t.integer "msu_discipline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "filetype"
    t.index ["msu_discipline_id"], name: "index_msu_files_on_msu_discipline_id"
  end

  create_table "msu_images", force: :cascade do |t|
    t.string "title"
    t.integer "msu_lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["msu_lecture_id"], name: "index_msu_images_on_msu_lecture_id"
  end

  create_table "msu_lecture_books", force: :cascade do |t|
    t.integer "msu_lectures_id"
    t.integer "msu_books_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["msu_books_id"], name: "index_msu_lecture_books_on_msu_books_id"
    t.index ["msu_lectures_id"], name: "index_msu_lecture_books_on_msu_lectures_id"
  end

  create_table "msu_lectures", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "msu_discipline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "visible", default: true
    t.integer "order"
    t.index ["msu_discipline_id"], name: "index_msu_lectures_on_msu_discipline_id"
  end

  create_table "msu_presentations", force: :cascade do |t|
    t.string "title"
    t.boolean "visible"
    t.integer "msu_lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pdf"
    t.index ["msu_lecture_id"], name: "index_msu_presentations_on_msu_lecture_id"
  end

  create_table "msu_users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "remember_digest"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["name"], name: "index_msu_users_on_name", unique: true
  end

  create_table "msu_videos", force: :cascade do |t|
    t.string "link"
    t.string "title"
    t.string "thumbnail"
    t.string "description"
    t.string "duration"
    t.integer "msu_discipline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "video_id"
    t.index ["msu_discipline_id"], name: "index_msu_videos_on_msu_discipline_id"
  end

end
