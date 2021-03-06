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

ActiveRecord::Schema.define(version: 20141123121630) do

  create_table "events", force: true do |t|
    t.string   "name",       limit: nil
    t.datetime "schedule"
    t.string   "location",   limit: nil
    t.integer  "mygmail_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "events", ["mygmail_id"], name: "index_events_on_mygmail_id"

  create_table "mygmails", force: true do |t|
    t.string   "eid",        limit: nil
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.text     "content"
  end

  add_index "mygmails", ["user_id"], name: "index_mygmails_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name",                   limit: nil
    t.string   "psw",                    limit: nil
    t.string   "account",                limit: nil
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: nil, default: "", null: false
    t.string   "encrypted_password",     limit: nil, default: "", null: false
    t.string   "reset_password_token",   limit: nil
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: nil
    t.string   "last_sign_in_ip",        limit: nil
    t.string   "provider",               limit: nil
    t.string   "uid",                    limit: nil
    t.string   "token",                  limit: nil
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
