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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120408140245) do

  create_table "class_table_inheritance", :id => false, :force => true do |t|
    t.string "parent_relation",      :null => false
    t.string "child_aggregate_view", :null => false
    t.string "child_relation",       :null => false
  end

  add_index "class_table_inheritance", ["child_aggregate_view"], :name => "class_table_inheritance_child_aggregate_view_key", :unique => true
  add_index "class_table_inheritance", ["parent_relation", "child_aggregate_view"], :name => "class_table_inheritance_parent_relation_child_aggregate_vie_key", :unique => true

  create_table "pollers", :force => true do |t|
    t.string   "hostname"
    t.integer  "port"
    t.string   "state",          :limit => 16
    t.string   "queue_username", :limit => 32, :null => false
    t.string   "queue_password", :limit => 32, :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "deleter_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.datetime "deleted_at"
  end

  add_index "pollers", ["hostname"], :name => "index_pollers_on_hostname"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.datetime "deleted_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
