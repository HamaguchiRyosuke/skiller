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

ActiveRecord::Schema.define(version: 20170725004058) do

  create_table "accounts", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "remember_digest"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
  end

  create_table "skills", force: :cascade do |t|
    t.string "skill_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teach_skills", force: :cascade do |t|
    t.integer "user_id"
    t.integer "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_teach_skills_on_skill_id"
    t.index ["user_id"], name: "index_teach_skills_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "gender", null: false
    t.integer "age", null: false
    t.text "other_information"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_users_on_account_id"
  end

end
