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

ActiveRecord::Schema.define(version: 20170104231115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliations", force: :cascade do |t|
    t.integer  "user_id",                      null: false
    t.integer  "group_id",                     null: false
    t.string   "moderator",  default: "false", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["group_id"], name: "affiliations_group_id_ix", using: :btree
    t.index ["group_id"], name: "index_affiliations_on_group_id", using: :btree
    t.index ["user_id"], name: "affiliations_user_id_ix", using: :btree
    t.index ["user_id"], name: "index_affiliations_on_user_id", using: :btree
  end

  create_table "aspirations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "goal_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "votes_count", default: 0
    t.index ["goal_id"], name: "aspiration_goal_id_ix", using: :btree
    t.index ["goal_id"], name: "index_aspirations_on_goal_id", using: :btree
    t.index ["user_id"], name: "aspirations_user_id_ix", using: :btree
    t.index ["user_id"], name: "index_aspirations_on_user_id", using: :btree
  end

  create_table "goals", force: :cascade do |t|
    t.string   "title",                         null: false
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "aspirations_count", default: 0
    t.index ["details"], name: "goals_details_ix", using: :btree
    t.index ["title"], name: "goals_title_ix", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name",                         null: false
    t.string   "moderated",  default: "false", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "first_name",                           null: false
    t.string   "last_name",                            null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "avatar"
    t.float    "latitude",               default: 0.0
    t.float    "longitude",              default: 0.0
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "aspiration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["aspiration_id"], name: "index_votes_on_aspiration_id", using: :btree
    t.index ["aspiration_id"], name: "votes_aspiration_id_ix", using: :btree
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
    t.index ["user_id"], name: "votes_user_id_ix", using: :btree
  end

end
