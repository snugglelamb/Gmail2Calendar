class InitialSetUp < ActiveRecord::Migration
  def change
    create_table "events", force: true do |t|
      t.string   "name"
      t.datetime "schedule"
      t.string   "location"
      t.integer  "mygmail_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    add_index "events", ["mygmail_id"], name: "index_events_on_mygmail_id"

    create_table "mygmails", force: true do |t|
      t.string   "eid"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer  "user_id"
      t.text     "content"
    end

    add_index "mygmails", ["user_id"], name: "index_mygmails_on_user_id"

    create_table "users", force: true do |t|
      t.string   "name"
      t.string   "psw"
      t.string   "account"
      t.datetime "created_at",                          null: false
      t.datetime "updated_at",                          null: false
      t.string   "email",                  default: "", null: false
      t.string   "encrypted_password",     default: "", null: false
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",          default: 0,  null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
      t.string   "provider"
      t.string   "uid"
      t.string   "token"
    end

    add_index "users", ["email"], name: "index_users_on_email", unique: true
    add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    
  end #end of def change
  
  
end #end of class
